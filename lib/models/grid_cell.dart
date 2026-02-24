enum CellState { empty, preRevealed, hinted, locked }

class GridCell {
  final int row;
  final int col;
  final String letter;
  final CellState state;

  const GridCell({
    required this.row,
    required this.col,
    required this.letter,
    this.state = CellState.empty,
  });

  GridCell copyWith({CellState? state}) {
    return GridCell(
      row: row,
      col: col,
      letter: letter,
      state: state ?? this.state,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is GridCell && other.row == row && other.col == col;

  @override
  int get hashCode => Object.hash(row, col);
}
