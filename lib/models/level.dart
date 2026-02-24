import 'word_placement.dart';

class Level {
  final int id;
  final String name;
  final List<String> letters;
  final List<WordPlacement> targetPlacements;
  final List<String> bonusWords;
  final int gridRows;
  final int gridCols;
  // Cells shown as letters from the very start. Each entry is (row, col).
  final List<(int, int)> preRevealedCells;

  const Level({
    required this.id,
    required this.name,
    required this.letters,
    required this.targetPlacements,
    required this.bonusWords,
    required this.gridRows,
    required this.gridCols,
    this.preRevealedCells = const [],
  });

  List<String> get targetWords => targetPlacements.map((p) => p.word).toList();

  String? get bonusDesignation {
    final bonus = targetPlacements.where((p) => p.isBonus).toList();
    if (bonus.isEmpty) return null;
    return bonus.map((p) => p.word).join(' / ');
  }
}
