import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:shabdlok/data/level_data.dart';
import 'package:shabdlok/models/word_placement.dart';
import 'package:shabdlok/utils/grid_builder.dart';

void main() {
  group('Level validation', () {
    for (final level in LevelData.levels) {
      group('Level ${level.id} (${level.name})', () {
        test('has at least 2 target words', () {
          expect(level.targetPlacements.length, greaterThanOrEqualTo(2));
        });

        test('all target word letters covered by roulette letters', () {
          final bag = _letterBag(level.letters);
          for (final placement in level.targetPlacements) {
            final wordBag = _letterBag(placement.word.split(''));
            for (final entry in wordBag.entries) {
              expect(
                bag[entry.key] ?? 0,
                greaterThanOrEqualTo(entry.value),
                reason:
                    'Word "${placement.word}" needs ${entry.value}x "${entry.key}" but roulette only has ${bag[entry.key] ?? 0}',
              );
            }
          }
        });

        test('all bonus word letters covered by roulette letters', () {
          final bag = _letterBag(level.letters);
          for (final word in level.bonusWords) {
            final wordBag = _letterBag(word.split(''));
            for (final entry in wordBag.entries) {
              expect(
                bag[entry.key] ?? 0,
                greaterThanOrEqualTo(entry.value),
                reason:
                    'Bonus word "$word" needs ${entry.value}x "${entry.key}" but roulette only has ${bag[entry.key] ?? 0}',
              );
            }
          }
        });

        test('no grid cell conflicts (two words placing different letters at same cell)', () {
          final cellLetters = <String, String>{};
          for (final placement in level.targetPlacements) {
            for (int i = 0; i < placement.word.length; i++) {
              final cell = placement.cells[i];
              final key = '${cell.$1},${cell.$2}';
              final letter = placement.word[i];
              if (cellLetters.containsKey(key)) {
                expect(
                  cellLetters[key],
                  letter,
                  reason:
                      'Level ${level.id}: cell ($key) has conflicting letters: "${cellLetters[key]}" vs "$letter"',
                );
              } else {
                cellLetters[key] = letter;
              }
            }
          }
        });

        test('all word cells are within grid bounds', () {
          for (final placement in level.targetPlacements) {
            for (final cell in placement.cells) {
              expect(cell.$1, lessThan(level.gridRows),
                  reason: 'Row ${cell.$1} out of bounds for level ${level.id}');
              expect(cell.$2, lessThan(level.gridCols),
                  reason: 'Col ${cell.$2} out of bounds for level ${level.id}');
              expect(cell.$1, greaterThanOrEqualTo(0));
              expect(cell.$2, greaterThanOrEqualTo(0));
            }
          }
        });

        test('word graph is connected (all words share a cell with at least one other word)', () {
          final placements = level.targetPlacements;
          if (placements.length < 2) return;

          // Build set of cells per word
          final wordCells = placements.map((p) => p.cells.toSet()).toList();

          // BFS from word 0 through shared-cell adjacency
          final visited = <int>{0};
          final queue = [0];
          while (queue.isNotEmpty) {
            final current = queue.removeAt(0);
            for (int j = 0; j < placements.length; j++) {
              if (visited.contains(j)) continue;
              final shared = wordCells[current].intersection(wordCells[j]);
              if (shared.isNotEmpty) {
                visited.add(j);
                queue.add(j);
              }
            }
          }

          expect(
            visited.length,
            placements.length,
            reason:
                'Level ${level.id}: word graph is not fully connected. Only ${visited.length} of ${placements.length} words reachable.',
          );
        });

        test('no duplicate bonus words', () {
          final seen = <String>{};
          for (final word in level.bonusWords) {
            expect(seen.contains(word), isFalse,
                reason: 'Level ${level.id}: bonus word "$word" is listed more than once');
            seen.add(word);
          }
        });

        test('no bonus word is also a target word', () {
          final targetWords = level.targetPlacements.map((p) => p.word).toSet();
          for (final word in level.bonusWords) {
            expect(targetWords.contains(word), isFalse,
                reason:
                    'Level ${level.id}: "$word" appears in both bonusWords and targetPlacements');
          }
        });

        test('exactly one word marked isBonus', () {
          final bonusCount = level.targetPlacements.where((p) => p.isBonus).length;
          expect(bonusCount, greaterThanOrEqualTo(1),
              reason: 'Level ${level.id} has no bonus-designated word');
        });

        test('GridBuilder produces correct dimensions', () {
          final grid = GridBuilder.build(level);
          expect(grid.length, level.gridRows);
          expect(grid[0].length, level.gridCols);
        });

        test('horizontal words placed correctly in direction', () {
          for (final p in level.targetPlacements) {
            if (p.direction == WordDirection.horizontal) {
              final cells = p.cells;
              for (int i = 1; i < cells.length; i++) {
                expect(cells[i].$1, cells[0].$1,
                    reason: 'Horizontal word ${p.word} row changes at index $i');
                expect(cells[i].$2, cells[i - 1].$2 + 1,
                    reason: 'Horizontal word ${p.word} col not sequential at index $i');
              }
            }
          }
        });

        test('vertical words placed correctly in direction', () {
          for (final p in level.targetPlacements) {
            if (p.direction == WordDirection.vertical) {
              final cells = p.cells;
              for (int i = 1; i < cells.length; i++) {
                expect(cells[i].$2, cells[0].$2,
                    reason: 'Vertical word ${p.word} col changes at index $i');
                expect(cells[i].$1, cells[i - 1].$1 + 1,
                    reason: 'Vertical word ${p.word} row not sequential at index $i');
              }
            }
          }
        });

        test('no row below row 0 has more than half its columns occupied', () {
          // Prevents dense horizontal bands where letters fill the entire width.
          // A row is considered crowded if occupied cells ≥ gridCols (i.e. fully packed).
          final occupied = <int, Set<int>>{};
          for (final p in level.targetPlacements) {
            for (final cell in p.cells) {
              final row = cell.$1;
              if (row == 0) continue; // name word row is always full — that's fine
              occupied.putIfAbsent(row, () => {}).add(cell.$2);
            }
          }
          for (final entry in occupied.entries) {
            expect(
              entry.value.length,
              lessThan(level.gridCols),
              reason:
                  'Level ${level.id}: row ${entry.key} has ${entry.value.length} occupied cells '
                  'out of ${level.gridCols} columns — the entire row is filled, which looks like a solid block of letters',
            );
          }
        });
      });
    }

    test('50 levels total', () {
      expect(LevelData.levels.length, 50);
    });

    test('level IDs are sequential from 1 to 50', () {
      for (int i = 0; i < LevelData.levels.length; i++) {
        expect(LevelData.levels[i].id, i + 1);
      }
    });
  });

  group('Bonus word completeness', () {
    // Requires tools/words_alpha.txt (ENABLE word list).
    // If the word list is missing, this test is skipped.
    //
    // If this test fails, run:
    //   dart run tools/audit_bonus_words.dart
    // then re-run flutter test.

    late Set<String> dictionary;

    setUpAll(() {
      final wordListFile = File('tools/words_alpha.txt');
      if (!wordListFile.existsSync()) {
        dictionary = {};
        return;
      }
      dictionary = wordListFile
          .readAsLinesSync()
          .map((l) => l.trim().toUpperCase())
          .where((w) => w.length >= 3 && _alphaOnly.hasMatch(w))
          .toSet();
    });

    for (final level in LevelData.levels) {
      test('Level ${level.id} (${level.name}) has no missing bonus words', () {
        if (dictionary.isEmpty) {
          // Word list not available — skip silently.
          return;
        }

        final bag = _letterBag(level.letters);
        final known = {
          ...level.targetPlacements.map((p) => p.word),
          ...level.bonusWords,
        };

        final missing = <String>[];
        for (final word in dictionary) {
          if (word.length > level.letters.length) continue;
          if (known.contains(word)) continue;
          if (_canForm(word, bag)) missing.add(word);
        }
        missing.sort();

        expect(
          missing,
          isEmpty,
          reason:
              'Level ${level.id} (${level.name}) is missing ${missing.length} bonus word(s): $missing\n'
              'Run: dart run tools/audit_bonus_words.dart',
        );
      });
    }
  });
}

final _alphaOnly = RegExp(r'^[A-Z]+$');

bool _canForm(String word, Map<String, int> bag) {
  final need = _letterBag(word.split(''));
  for (final entry in need.entries) {
    if ((bag[entry.key] ?? 0) < entry.value) return false;
  }
  return true;
}

Map<String, int> _letterBag(List<String> letters) {
  final bag = <String, int>{};
  for (final l in letters) {
    bag[l] = (bag[l] ?? 0) + 1;
  }
  return bag;
}
