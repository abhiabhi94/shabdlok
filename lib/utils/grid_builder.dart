import '../models/grid_cell.dart';
import '../models/level.dart';

class GridBuilder {
  static List<List<GridCell?>> build(Level level) {
    final grid = List.generate(
      level.gridRows,
      (_) => List<GridCell?>.filled(level.gridCols, null),
    );

    for (final placement in level.targetPlacements) {
      for (int i = 0; i < placement.word.length; i++) {
        final (row, col) = placement.cells[i];
        final letter = placement.word[i];
        final existing = grid[row][col];
        assert(
          existing == null || existing.letter == letter,
          'Grid conflict at ($row,$col): "$letter" clashes with existing letter',
        );
        grid[row][col] ??= GridCell(row: row, col: col, letter: letter);
      }
    }

    return grid;
  }
}
