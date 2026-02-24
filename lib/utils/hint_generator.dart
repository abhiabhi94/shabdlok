import '../models/game_state.dart';
import '../models/word_placement.dart';

class HintResult {
  final Set<int> revealedCellIndices;
  final String message;

  const HintResult({required this.revealedCellIndices, required this.message});
}

class HintGenerator {
  /// Returns which grid cell positions (row*gridCols+col) to reveal for the next hint.
  /// Hint 1 (hintsUsed==0): reveal first letter of an unsolved word
  /// Hint 2 (hintsUsed==1): reveal first two letters of an unsolved word
  /// Hint 3 (hintsUsed==2): reveal all letters of an unsolved word
  static HintResult generate(GameState state) {
    final unsolved = state.unsolvedTargetWords;
    if (unsolved.isEmpty) {
      return const HintResult(revealedCellIndices: {}, message: 'All words found!');
    }

    // Pick the shortest unsolved word to give the most targeted hint
    final targetWord = unsolved.reduce(
      (a, b) => a.length <= b.length ? a : b,
    );

    final placement = state.level.targetPlacements
        .firstWhere((p) => p.word == targetWord);

    final cells = placement.cells;
    final hintsUsed = state.progress.hintsUsed;
    final cols = state.level.gridCols;

    final Set<int> toReveal = {};
    int revealCount;
    String message;

    if (hintsUsed == 0) {
      revealCount = 1;
      message = 'First letter revealed for a ${targetWord.length}-letter word';
    } else if (hintsUsed == 1) {
      revealCount = 2;
      message = 'Two letters revealed for "${'_' * targetWord.length}"';
    } else {
      revealCount = cells.length;
      message = '"$targetWord" revealed!';
    }

    // Build the set of already-visible cells (pre-revealed + hint-revealed)
    final preRevealedEncoded = state.level.preRevealedCells
        .map((rc) => rc.$1 * cols + rc.$2)
        .toSet();
    final alreadyVisible = {...state.hintRevealedCells, ...preRevealedEncoded};

    // Reveal up to revealCount cells, skipping those already visible.
    // Always ensure at least one new cell is revealed.
    int newCount = 0;
    for (int i = 0; i < cells.length; i++) {
      final (row, col) = cells[i];
      final encoded = row * cols + col;
      toReveal.add(encoded);
      if (!alreadyVisible.contains(encoded)) newCount++;
      if (toReveal.length >= revealCount && newCount >= 1) break;
    }

    // Merge with already revealed cells
    final allRevealed = {...state.hintRevealedCells, ...toReveal};
    return HintResult(revealedCellIndices: allRevealed, message: message);
  }

  /// Returns the direction label for display
  static String directionLabel(WordPlacement p) =>
      p.direction == WordDirection.horizontal ? '→' : '↓';
}
