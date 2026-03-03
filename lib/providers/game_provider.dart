import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/game_state.dart';
import '../models/level.dart';
import '../utils/hint_generator.dart';
import 'progress_provider.dart';

const _coinsPerTargetWord = 10;
const _coinsPerBonusWord = 5;
const _coinsPerHint = 5;

class GameNotifier extends StateNotifier<GameState> {
  final GameProgressRepository _repository;
  final CoinNotifier _coins;

  GameNotifier(Level level, this._repository, this._coins)
      : super(GameState(
          level: level,
          progress: _repository.load(level.id),
          selectedIndices: [],
          phase: GamePhase.playing,
          hintRevealedCells: {},
        ));

  void selectLetter(int index) {
    if (state.phase == GamePhase.levelComplete) return;

    final current = state.selectedIndices;
    if (current.isNotEmpty && current.last == index) return;

    state = state.copyWith(
      selectedIndices: [...current, index],
      phase: GamePhase.playing,
    );
  }

  void deselectLast() {
    if (state.selectedIndices.isEmpty) return;
    final updated = [...state.selectedIndices]..removeLast();
    state = state.copyWith(selectedIndices: updated, phase: GamePhase.playing);
  }

  void resetLevel() {
    final fresh = _repository.reset(state.level.id);
    state = state.copyWith(
      progress: fresh,
      selectedIndices: [],
      phase: GamePhase.playing,
      hintRevealedCells: {},
    );
  }

  void submitWord() {
    final word = state.currentWord;
    if (word.length < 3) {
      state = state.copyWith(selectedIndices: [], phase: GamePhase.playing);
      return;
    }

    final alreadyFoundTarget = state.progress.foundTargetWords.contains(word);
    final alreadyFoundBonus = state.progress.foundBonusWords.contains(word);

    if (alreadyFoundTarget || alreadyFoundBonus) {
      state = state.copyWith(
        selectedIndices: [],
        phase: GamePhase.alreadyFound,
        lastFoundWord: word,
      );
    } else if (state.level.targetPlacements.any((p) => p.word == word)) {
      _handleTargetWord(word);
    } else if (state.level.bonusWords.contains(word)) {
      _handleBonusWord(word);
    } else {
      state = state.copyWith(
        selectedIndices: [],
        phase: GamePhase.invalidWord,
      );
    }
  }

  void useHint() {
    if (state.hintsExhausted) return;
    if (state.unsolvedTargetWords.isEmpty) return;
    if (!_coins.spend(_coinsPerHint)) return;

    final result = HintGenerator.generate(state);
    final newProgress = state.progress.copyWith(
      hintsUsed: state.progress.hintsUsed + 1,
    );
    _repository.save(newProgress);

    state = state.copyWith(
      progress: newProgress,
      hintRevealedCells: result.revealedCellIndices,
      phase: GamePhase.playing,
    );
  }

  void resetPhase() {
    if (state.phase != GamePhase.levelComplete) {
      state = state.copyWith(phase: GamePhase.playing);
    }
  }

  void _handleTargetWord(String word) {
    final newFound = {...state.progress.foundTargetWords, word};
    final requiredWords = state.level.targetPlacements
        .map((p) => p.word)
        .toSet();
    final isComplete = newFound.containsAll(requiredWords);
    final newProgress = state.progress.copyWith(
      foundTargetWords: newFound,
      isCompleted: isComplete,
    );
    _repository.save(newProgress);
    _coins.add(_coinsPerTargetWord);

    state = state.copyWith(
      progress: newProgress,
      selectedIndices: [],
      phase: isComplete ? GamePhase.levelComplete : GamePhase.wordFound,
      lastFoundWord: word,
      coinsEarned: _coinsPerTargetWord,
    );
  }

  void _handleBonusWord(String word) {
    final newFound = {...state.progress.foundBonusWords, word};
    final newProgress = state.progress.copyWith(foundBonusWords: newFound);
    _repository.save(newProgress);
    _coins.add(_coinsPerBonusWord);

    state = state.copyWith(
      progress: newProgress,
      selectedIndices: [],
      phase: GamePhase.bonusWordFound,
      lastFoundWord: word,
      coinsEarned: _coinsPerBonusWord,
    );
  }

  bool isCellHintRevealed(int row, int col) {
    final index = row * state.level.gridCols + col;
    return state.hintRevealedCells.contains(index);
  }
}

// Providers are created per-level via a family
final gameProvider =
    StateNotifierProvider.family<GameNotifier, GameState, GameArgs>(
  (ref, args) =>
      GameNotifier(args.level, args.repository, ref.watch(coinProvider.notifier)),
);

class GameArgs {
  final Level level;
  final GameProgressRepository repository;

  const GameArgs({required this.level, required this.repository});
}

// Helper to create game args — used by game screen
GameArgs gameArgs(Level level, GameProgressRepository repository) =>
    GameArgs(level: level, repository: repository);
