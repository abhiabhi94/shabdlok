import 'level.dart';
import 'level_progress.dart';

enum GamePhase { playing, wordFound, bonusWordFound, invalidWord, alreadyFound, levelComplete }

class GameState {
  final Level level;
  final LevelProgress progress;
  final List<int> selectedIndices;
  final GamePhase phase;
  final String? lastFoundWord;
  final Set<int> hintRevealedCells;
  final int coinsEarned;

  const GameState({
    required this.level,
    required this.progress,
    required this.selectedIndices,
    required this.phase,
    required this.hintRevealedCells,
    this.lastFoundWord,
    this.coinsEarned = 0,
  });

  String get currentWord => selectedIndices
      .map((i) => level.letters[i])
      .join();

  List<String> get unsolvedTargetWords => level.targetWords
      .where((w) => !progress.foundTargetWords.contains(w))
      .toList();

  bool get hintsExhausted => progress.hintsUsed >= 3;

  GameState copyWith({
    LevelProgress? progress,
    List<int>? selectedIndices,
    GamePhase? phase,
    String? lastFoundWord,
    Set<int>? hintRevealedCells,
    int? coinsEarned,
  }) {
    return GameState(
      level: level,
      progress: progress ?? this.progress,
      selectedIndices: selectedIndices ?? this.selectedIndices,
      phase: phase ?? this.phase,
      lastFoundWord: lastFoundWord ?? this.lastFoundWord,
      hintRevealedCells: hintRevealedCells ?? this.hintRevealedCells,
      coinsEarned: coinsEarned ?? this.coinsEarned,
    );
  }
}
