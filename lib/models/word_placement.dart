enum WordDirection { horizontal, vertical }

class WordPlacement {
  final String word;
  final int startRow;
  final int startCol;
  final WordDirection direction;
  final bool isBonus;

  const WordPlacement({
    required this.word,
    required this.startRow,
    required this.startCol,
    required this.direction,
    this.isBonus = false,
  });

  List<(int, int)> get cells {
    return List.generate(word.length, (i) {
      return direction == WordDirection.horizontal
          ? (startRow, startCol + i)
          : (startRow + i, startCol);
    });
  }
}
