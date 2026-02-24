import 'package:flutter/material.dart';

import '../models/grid_cell.dart';
import '../models/level.dart';
import '../utils/grid_builder.dart';
import 'grid_cell_widget.dart';

class CrosswordGrid extends StatelessWidget {
  final Level level;
  final Set<String> foundWords;
  final Set<int> hintRevealedCells;

  const CrosswordGrid({
    super.key,
    required this.level,
    required this.foundWords,
    required this.hintRevealedCells,
  });

  @override
  Widget build(BuildContext context) {
    final grid = GridBuilder.build(level);

    // Apply pre-revealed scaffold letters (baked into level data)
    for (final (row, col) in level.preRevealedCells) {
      final cell = grid[row][col];
      if (cell != null && cell.state == CellState.empty) {
        grid[row][col] = cell.copyWith(state: CellState.preRevealed);
      }
    }

    // Apply hint-revealed cells (from hint button usage)
    for (final encoded in hintRevealedCells) {
      final row = encoded ~/ level.gridCols;
      final col = encoded % level.gridCols;
      final cell = grid[row][col];
      if (cell != null && cell.state == CellState.empty) {
        grid[row][col] = cell.copyWith(state: CellState.hinted);
      }
    }

    // Apply locked state to cells whose word is fully found (highest priority)
    for (final placement in level.targetPlacements) {
      if (foundWords.contains(placement.word)) {
        for (final (row, col) in placement.cells) {
          final cell = grid[row][col];
          if (cell != null) {
            grid[row][col] = cell.copyWith(state: CellState.locked);
          }
        }
      }
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final cellSize = _cellSize(constraints.maxWidth, constraints.maxHeight);
        final gridW = cellSize * level.gridCols;
        final gridH = cellSize * level.gridRows;

        return SizedBox(
          width: gridW,
          height: gridH,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(level.gridRows, (row) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(level.gridCols, (col) {
                  final cell = grid[row][col];
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: GridCellWidget(
                      cell: cell,
                      size: cellSize - 4,
                    ),
                  );
                }),
              );
            }),
          ),
        );
      },
    );
  }

  double _cellSize(double maxW, double maxH) {
    final byWidth = maxW / level.gridCols;
    final byHeight = maxH / level.gridRows;
    return (byWidth < byHeight ? byWidth : byHeight).clamp(1.0, 52.0);
  }
}
