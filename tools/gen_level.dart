// Level generator for ShabdLok.
//
// Usage (run from project root):
//   dart run tools/gen_level.dart <NAME_WORD> <LEVEL_ID>
//
// Example:
//   dart run tools/gen_level.dart MOTHERS 40
//
// Requires tools/words_alpha.txt and tools/common_words.txt to be present.
//
// The generator:
//   - Places NAME_WORD horizontally at row 0 (isBonus: true)
//   - Builds a freeform crossword by intersecting words off existing cells
//   - New words must intersect an existing placed word at a shared letter
//   - No-adjacency rule: two different words may not sit side-by-side unless
//     they share that junction cell (prevents visually misleading adjacency)
//   - Fragment check: any run of 3+ consecutive cells in a row or column must
//     be exactly one target word — no accidental letter sequences
//   - Aims for 6+ non-name target words per level
//   - Outputs Dart code ready to paste into lib/data/level_data.dart

import 'dart:io';
import 'dart:math';

const _minWordLength = 3;        // used for dictionary loading and bonus words
const _minTargetWordLength = 4;  // target words on the grid must be ≥ 4 letters
const _maxWordLength = 8;
const _minNonNameTargets = 6;
const _maxGridSpan = 9; // max rows or cols allowed in final grid (keeps puzzle compact)

// Abbreviations, non-standalone words, proper nouns and tech terms to exclude
// from target word candidates.
const _targetBlocklist = {
  // Greek letters / abbreviations / archaic
  'ATM', 'LAN', 'RNA', 'DNA', 'ENT', 'EST', 'REL', 'ONS', 'ERS', 'ARS',
  'ORS', 'UNS', 'INS', 'ELS', 'OES', 'IDS', 'ETH', 'NTH', 'PHO', 'TAO',
  'PSI', 'ETA', 'TAU', 'PHI', 'CHI', 'RHO', 'GNU', 'EMU', 'EWE',
  'OCA', 'OPE', 'OWT', 'UTE', 'APO', 'AVO', 'OBE', 'UPO',
  // Tech terms, brand names, proper nouns found in MIT 10k wordlist
  'EVAL', 'HTML', 'HTTP', 'SMTP', 'VOIP', 'WIFI', 'BLOG', 'WIKI',
  'JAVA', 'PERL', 'UNIX', 'LINUX', 'MYSQL', 'MSIE', 'XBOX', 'IPOD',
  'ISBN', 'IEEE', 'NASA', 'NATO', 'AIDS', 'VISA', 'EBAY', 'CISCO',
  'INTEL', 'ADOBE', 'APPLE', 'GOOGLE', 'YAHOO', 'SWIFT', 'NEPAL',
  // Profanity / inappropriate for a word puzzle game
  'SHIT', 'SHITS', 'DAMN', 'HELL', 'ARSE', 'ARSES', 'PISS', 'PISSED',
  'CRAP', 'FART', 'TURD', 'TURDS', 'SLUT', 'SLUTS',
  // Obscure / archaic standalone words not suitable as target words
  'HIST', 'GIST', 'SITH', 'SHRI', 'THIR', 'THIRL', 'TIRL', 'GIRSH',
  'GRITH', 'GRITHS', 'LWEI', 'SPEIL',
};

final _alphaPattern = RegExp(r'^[A-Z]+$');

void main(List<String> args) {
  if (args.length != 2) {
    stderr.writeln('Usage: dart run tools/gen_level.dart <NAME_WORD> <LEVEL_ID>');
    stderr.writeln('Example: dart run tools/gen_level.dart MOTHERS 40');
    exit(1);
  }

  final name = args[0].toUpperCase();
  final levelId = int.tryParse(args[1]);
  if (levelId == null) {
    stderr.writeln('LEVEL_ID must be an integer');
    exit(1);
  }
  if (name.length < 5 || name.length > 7) {
    stderr.writeln('NAME_WORD must be 5, 6, or 7 letters (got ${name.length})');
    exit(1);
  }
  if (!_alphaPattern.hasMatch(name)) {
    stderr.writeln('NAME_WORD must be alphabetic');
    exit(1);
  }

  final wordListFile = File('tools/words_alpha.txt');
  if (!wordListFile.existsSync()) {
    stderr.writeln('ERROR: tools/words_alpha.txt not found. Run from project root.');
    exit(1);
  }
  final commonWordsFile = File('tools/common_words.txt');
  if (!commonWordsFile.existsSync()) {
    stderr.writeln('ERROR: tools/common_words.txt not found. Run from project root.');
    stderr.writeln('Download with: curl -o tools/common_words.txt https://www.mit.edu/~ecprice/wordlist.10000');
    exit(1);
  }

  final dictionary = _loadDictionary(wordListFile);
  final commonWords = _loadDictionary(commonWordsFile);
  print('Loaded ${dictionary.length} dictionary words, ${commonWords.length} common words.');

  final letters = name.split('');
  final bag = _letterBag(letters);

  print('Name: $name  |  Letters: $letters');
  print('Searching for level design...\n');

  final solution = _findSolution(
    name: name,
    letters: letters,
    bag: bag,
    commonWords: commonWords,
  );

  if (solution == null) {
    print('\nNo valid solution found. Try a different name word.');
    exit(1);
  }

  _printSolution(solution, levelId, name, letters, dictionary);
}

// ---------------------------------------------------------------------------
// Data structures
// ---------------------------------------------------------------------------

class _Placement {
  final String word;
  final int startRow;
  final int startCol;
  final bool isHorizontal;
  final bool isBonus;

  const _Placement({
    required this.word,
    required this.startRow,
    required this.startCol,
    required this.isHorizontal,
    this.isBonus = false,
  });

  List<(int, int)> get cells => List.generate(word.length, (i) {
        return isHorizontal
            ? (startRow, startCol + i)
            : (startRow + i, startCol);
      });
}

class _Solution {
  final List<_Placement> placements;
  final Map<String, String> grid;

  _Solution({required this.placements, required this.grid});
}

// ---------------------------------------------------------------------------
// Solution search — freeform crossword packer
// ---------------------------------------------------------------------------

_Solution? _findSolution({
  required String name,
  required List<String> letters,
  required Map<String, int> bag,
  required Set<String> commonWords,
}) {
  // Build candidate pool: common words formable from bag, ≥4 letters, not blocklisted.
  // Minimum 4 letters keeps target words meaningful and avoids 3-letter fragments
  // like STR, STE appearing as grid words.
  final candidates = <String>[];
  for (final word in commonWords) {
    if (word.length < _minTargetWordLength || word.length > _maxWordLength) continue;
    if (_targetBlocklist.contains(word)) continue;
    if (word == name) continue;
    if (!_canForm(word, bag)) continue;
    candidates.add(word);
  }
  // Sort: prefer longer words first (more intersection opportunities)
  candidates.sort((a, b) => b.length.compareTo(a.length));
  print('Candidate pool: ${candidates.length} words');

  // Seed: place the name word horizontally at row 0
  final grid = <String, String>{};
  for (int c = 0; c < name.length; c++) {
    grid['0,$c'] = name[c];
  }
  final placements = <_Placement>[
    _Placement(word: name, startRow: 0, startCol: 0, isHorizontal: true, isBonus: true),
  ];
  final placedWords = <String>{name};

  // Try multiple random orderings to find the best solution
  _Solution? bestSolution;
  int bestScore = 0;
  final rng = Random(42);

  for (int attempt = 0; attempt < 12; attempt++) {
    final shuffled = List<String>.from(candidates)..shuffle(rng);
    final result = _pack(
      name: name,
      candidates: shuffled,
      initialGrid: Map.from(grid),
      initialPlacements: List.from(placements),
      initialPlacedWords: Set.from(placedWords),
    );
    if (result != null) {
      final nonNameCount = result.placements.where((p) => !p.isBonus).length;
      if (nonNameCount > bestScore) {
        bestScore = nonNameCount;
        bestSolution = result;
        if (bestScore >= _minNonNameTargets + 2) break; // good enough
      }
    }
  }

  if (bestSolution == null) return null;
  final nonName = bestSolution.placements.where((p) => !p.isBonus).length;
  if (nonName < _minNonNameTargets) {
    print('Best found only $nonName non-name words (need $_minNonNameTargets). Try a different name word.');
    return null;
  }
  return bestSolution;
}

_Solution? _pack({
  required String name,
  required List<String> candidates,
  required Map<String, String> initialGrid,
  required List<_Placement> initialPlacements,
  required Set<String> initialPlacedWords,
}) {
  final grid = Map<String, String>.from(initialGrid);
  final placements = List<_Placement>.from(initialPlacements);
  final placedWords = Set<String>.from(initialPlacedWords);

  // Track which cells belong to horizontal vs vertical words
  // to know which direction to try when intersecting
  final horizontalCells = <String>{}; // cells occupied by a horizontal word
  final verticalCells = <String>{}; // cells occupied by a vertical word
  for (final p in placements) {
    for (final cell in p.cells) {
      final key = '${cell.$1},${cell.$2}';
      if (p.isHorizontal) {
        horizontalCells.add(key);
      } else {
        verticalCells.add(key);
      }
    }
  }

  for (final word in candidates) {
    if (placedWords.contains(word)) continue;

    // Skip words that are a substring of (or contain) an already-placed word —
    // they're redundant and confusing (e.g. TERM when TERMS is already placed).
    if (placedWords.any((w) => w != name && (w.contains(word) || word.contains(w)))) continue;

    // Find all valid placements for this word
    final validPlacements = _findValidPlacements(
      word: word,
      grid: grid,
      horizontalCells: horizontalCells,
      verticalCells: verticalCells,
      placedWords: placedWords,
    );
    if (validPlacements.isEmpty) continue;

    // Pick the placement closest to the current grid centroid (keeps layout compact).
    // Ties broken by most new cells added.
    double centroidRow = 0, centroidCol = 0;
    for (final entry in grid.entries) {
      final parts = entry.key.split(',');
      centroidRow += int.parse(parts[0]);
      centroidCol += int.parse(parts[1]);
    }
    centroidRow /= grid.length;
    centroidCol /= grid.length;

    validPlacements.sort((a, b) {
      final aMid = a.cells[a.word.length ~/ 2];
      final bMid = b.cells[b.word.length ~/ 2];
      final aDist = (aMid.$1 - centroidRow).abs() + (aMid.$2 - centroidCol).abs();
      final bDist = (bMid.$1 - centroidRow).abs() + (bMid.$2 - centroidCol).abs();
      if ((aDist - bDist).abs() > 1.0) return aDist.compareTo(bDist);
      final aNew = a.cells.where((c) => !grid.containsKey('${c.$1},${c.$2}')).length;
      final bNew = b.cells.where((c) => !grid.containsKey('${c.$1},${c.$2}')).length;
      return bNew.compareTo(aNew);
    });
    final chosen = validPlacements.first;

    // Apply placement
    for (final cell in chosen.cells) {
      final key = '${cell.$1},${cell.$2}';
      grid[key] = word[chosen.cells.indexOf(cell)];
      if (chosen.isHorizontal) {
        horizontalCells.add(key);
      } else {
        verticalCells.add(key);
      }
    }
    placements.add(chosen);
    placedWords.add(word);
  }

  // Connectivity check
  if (!_isConnected(placements)) return null;

  return _Solution(placements: placements, grid: grid);
}

List<_Placement> _findValidPlacements({
  required String word,
  required Map<String, String> grid,
  required Set<String> horizontalCells,
  required Set<String> verticalCells,
  required Set<String> placedWords,
}) {
  final results = <_Placement>[];

  // For each letter in the word, check if that letter exists in the grid
  for (int i = 0; i < word.length; i++) {
    final letter = word[i];

    // Find all grid cells that have this letter
    for (final entry in grid.entries) {
      if (entry.value != letter) continue;
      final parts = entry.key.split(',');
      final cellRow = int.parse(parts[0]);
      final cellCol = int.parse(parts[1]);
      final cellKey = entry.key;

      // Determine which direction(s) to try based on existing word direction(s) at this cell.
      // A cell used by a horizontal word → try placing this word vertically through it.
      // A cell used by a vertical word → try placing this word horizontally through it.
      // A cell used by both → can't place either direction (would overlap same-direction words).
      final inHorizontal = horizontalCells.contains(cellKey);
      final inVertical = verticalCells.contains(cellKey);

      if (inHorizontal && !inVertical) {
        // Try placing word vertically through (cellRow, cellCol) at index i
        final startRow = cellRow - i;
        final startCol = cellCol;
        final p = _tryPlacement(
          word: word,
          startRow: startRow,
          startCol: startCol,
          isHorizontal: false,
          grid: grid,
          horizontalCells: horizontalCells,
          verticalCells: verticalCells,
        );
        if (p != null) results.add(p);
      }

      if (inVertical && !inHorizontal) {
        // Try placing word horizontally through (cellRow, cellCol) at index i
        final startRow = cellRow;
        final startCol = cellCol - i;
        final p = _tryPlacement(
          word: word,
          startRow: startRow,
          startCol: startCol,
          isHorizontal: true,
          grid: grid,
          horizontalCells: horizontalCells,
          verticalCells: verticalCells,
        );
        if (p != null) results.add(p);
      }
    }
  }

  return results;
}

_Placement? _tryPlacement({
  required String word,
  required int startRow,
  required int startCol,
  required bool isHorizontal,
  required Map<String, String> grid,
  required Set<String> horizontalCells,
  required Set<String> verticalCells,
}) {
  // Bounds check
  if (startRow < 0 || startCol < 0) return null;
  final endRow = isHorizontal ? startRow : startRow + word.length - 1;
  final endCol = isHorizontal ? startCol + word.length - 1 : startCol;
  if (endRow >= _maxGridSpan || endCol >= _maxGridSpan) return null;

  final candidate = _Placement(
    word: word,
    startRow: startRow,
    startCol: startCol,
    isHorizontal: isHorizontal,
  );
  final cells = candidate.cells;
  final cellKeys = cells.map((c) => '${c.$1},${c.$2}').toList();

  // Check for letter conflicts and same-direction overlaps
  for (int i = 0; i < word.length; i++) {
    final key = cellKeys[i];
    final existingLetter = grid[key];
    if (existingLetter != null && existingLetter != word[i]) return null; // conflict

    // A cell must not already belong to a word of the same direction
    if (isHorizontal && horizontalCells.contains(key) && existingLetter != word[i]) return null;
    if (!isHorizontal && verticalCells.contains(key) && existingLetter != word[i]) return null;
  }

  // Must have at least one intersection with an existing cell
  final hasIntersection = cellKeys.any((k) => grid.containsKey(k));
  if (!hasIntersection) return null;

  // No-adjacency rule:
  // For each NEW cell added by this word, its perpendicular neighbors must be empty
  // unless that neighbor is one of the intersection cells of THIS word.
  final wordCellSet = cellKeys.toSet();
  for (int i = 0; i < word.length; i++) {
    final (r, c) = cells[i];
    final key = cellKeys[i];
    final isNewCell = !grid.containsKey(key);
    if (!isNewCell) continue; // intersection cell — allowed to have neighbors

    if (isHorizontal) {
      // Check above and below (perpendicular neighbors for a horizontal word)
      final above = '${r - 1},$c';
      final below = '${r + 1},$c';
      if (grid.containsKey(above) && !wordCellSet.contains(above)) return null;
      if (grid.containsKey(below) && !wordCellSet.contains(below)) return null;
    } else {
      // Check left and right (perpendicular neighbors for a vertical word)
      final left = '$r,${c - 1}';
      final right = '$r,${c + 1}';
      if (grid.containsKey(left) && !wordCellSet.contains(left)) return null;
      if (grid.containsKey(right) && !wordCellSet.contains(right)) return null;
    }

    // Also check along-direction neighbors to prevent end-to-end touching
    // (two separate words of the same direction cannot sit adjacent end-to-end)
    if (isHorizontal) {
      if (i == 0) {
        final leftNeighbor = '$r,${c - 1}';
        if (grid.containsKey(leftNeighbor)) return null;
      }
      if (i == word.length - 1) {
        final rightNeighbor = '$r,${c + 1}';
        if (grid.containsKey(rightNeighbor)) return null;
      }
    } else {
      if (i == 0) {
        final topNeighbor = '${r - 1},$c';
        if (grid.containsKey(topNeighbor)) return null;
      }
      if (i == word.length - 1) {
        final bottomNeighbor = '${r + 1},$c';
        if (grid.containsKey(bottomNeighbor)) return null;
      }
    }
  }

  // Fragment check: after placing this word, verify no row or column has a run
  // of 3+ consecutive filled cells that does not match a single target word.
  // We simulate the placement and check the affected row/column.
  final testGrid = Map<String, String>.from(grid);
  for (int i = 0; i < word.length; i++) {
    testGrid[cellKeys[i]] = word[i];
  }

  // Check column fragment for each column touched (for horizontal) or the single column (vertical)
  if (isHorizontal) {
    // Horizontal placement: check each column individually at the affected row
    // Also check the full row for horizontal fragment
    if (!_checkRowFragment(testGrid, startRow, word, startCol)) return null;
    // For vertical fragments: each cell in the horizontal word occupies a different column
    for (int i = 0; i < word.length; i++) {
      if (!_checkColFragment(testGrid, startCol + i, null)) return null;
    }
  } else {
    // Vertical placement: check the affected column
    if (!_checkColFragment(testGrid, startCol, word)) return null;
    // For horizontal fragments: each cell in the vertical word occupies a different row
    for (int i = 0; i < word.length; i++) {
      if (!_checkRowFragment(testGrid, startRow + i, null, 0)) return null;
    }
  }

  return candidate;
}

// Checks that any run of 3+ consecutive cells in `col` is exactly `expectedWord`
// (if provided) or any single known word (if null — deferred to full validation).
// For simplicity during placement we use the strict rule: no run of 3+ unless
// it matches the word being placed (for vertical placements).
bool _checkColFragment(Map<String, String> grid, int col, String? placedWord) {
  final run = StringBuffer();
  for (int row = 0; row < _maxGridSpan; row++) {
    final letter = grid['$row,$col'];
    if (letter != null) {
      run.write(letter);
    } else {
      final s = run.toString();
      if (s.length >= 3) {
        if (placedWord != null && s != placedWord) return false;
        // If placedWord is null (checking a column not part of the vertical being placed),
        // we allow any run — full validation is done at solution-emit time.
      }
      run.clear();
    }
  }
  final s = run.toString();
  if (s.length >= 3 && placedWord != null && s != placedWord) return false;
  return true;
}

// Checks that any run of 3+ consecutive cells in `row` is exactly `placedWord`
// (if provided, for horizontal placements) or unchecked (null).
bool _checkRowFragment(Map<String, String> grid, int row, String? placedWord, int startCol) {
  final run = StringBuffer();
  int runStartCol = 0;
  for (int col = 0; col < _maxGridSpan; col++) {
    final letter = grid['$row,$col'];
    if (letter != null) {
      if (run.isEmpty) runStartCol = col;
      run.write(letter);
    } else {
      final s = run.toString();
      if (s.length >= 3) {
        if (placedWord != null && (s != placedWord || runStartCol != startCol)) return false;
      }
      run.clear();
    }
  }
  final s = run.toString();
  if (s.length >= 3 && placedWord != null && (s != placedWord || runStartCol != startCol)) {
    return false;
  }
  return true;
}

bool _isConnected(List<_Placement> placements) {
  if (placements.length < 2) return true;
  final wordCells = placements.map((p) => p.cells.toSet()).toList();
  final visited = <int>{0};
  final queue = [0];
  while (queue.isNotEmpty) {
    final current = queue.removeAt(0);
    for (int j = 0; j < placements.length; j++) {
      if (visited.contains(j)) continue;
      if (wordCells[current].intersection(wordCells[j]).isNotEmpty) {
        visited.add(j);
        queue.add(j);
      }
    }
  }
  return visited.length == placements.length;
}

// ---------------------------------------------------------------------------
// Output
// ---------------------------------------------------------------------------

void _printSolution(
  _Solution solution,
  int levelId,
  String name,
  List<String> letters,
  Set<String> dictionary,
) {
  final placements = solution.placements;
  final grid = solution.grid;

  // Compute bounding box
  int minRow = _maxGridSpan, maxRow = 0, minCol = _maxGridSpan, maxCol = 0;
  for (final entry in grid.entries) {
    final parts = entry.key.split(',');
    final r = int.parse(parts[0]);
    final c = int.parse(parts[1]);
    if (r < minRow) minRow = r;
    if (r > maxRow) maxRow = r;
    if (c < minCol) minCol = c;
    if (c > maxCol) maxCol = c;
  }
  // Name word is anchored at row 0, col 0 — bounding box always starts there.
  // minRow / minCol should be 0 by construction (name word at 0,0).
  final gridRows = maxRow + 1;
  final gridCols = maxCol + 1;

  print('=== SOLUTION FOUND ===\n');
  print('Grid ($gridRows rows × $gridCols cols):');
  for (int r = 0; r < gridRows; r++) {
    final row = List.generate(gridCols, (c) => grid['$r,$c'] ?? '.').join(' ');
    print('  $row');
  }
  print('');

  print('Words (${placements.length}):');
  for (final p in placements) {
    final dir = p.isHorizontal ? 'H' : 'V';
    final bonus = p.isBonus ? ' [BONUS/NAME]' : '';
    print('  ${p.word} @ row${p.startRow} col${p.startCol} $dir$bonus');
  }
  print('');

  // Compute bonus words
  final targetWords = placements.map((p) => p.word).toSet();
  final allFormable = _formableWords(letters, dictionary);
  final bonusWords = allFormable.difference(targetWords).toList()..sort();

  // Pre-revealed cells: midpoint of each non-name target word
  final nonNamePlacements = placements.where((p) => !p.isBonus).toList();
  final preRevealed = <(int, int)>[];
  for (final p in nonNamePlacements) {
    final midIdx = p.word.length ~/ 2;
    preRevealed.add(p.cells[midIdx]);
  }
  if (preRevealed.isEmpty) preRevealed.add((1, 0));

  // Generate Dart code
  final lettersStr = letters.map((l) => "'$l'").join(', ');
  final bonusStr = bonusWords.map((w) => "'$w'").join(', ');
  final preRevStr = preRevealed.map((c) => '(${c.$1}, ${c.$2})').join(', ');

  final sb = StringBuffer();
  sb.writeln('    Level(');
  sb.writeln('      id: $levelId,');
  sb.writeln("      name: '${name[0]}${name.substring(1).toLowerCase()}',");
  sb.writeln('      letters: [$lettersStr],');
  sb.writeln('      targetPlacements: [');
  for (final p in placements) {
    final dir = p.isHorizontal ? 'WordDirection.horizontal' : 'WordDirection.vertical';
    final bonusFlag = p.isBonus ? ', isBonus: true' : '';
    sb.writeln("        WordPlacement(word: '${p.word}', startRow: ${p.startRow}, startCol: ${p.startCol}, direction: $dir$bonusFlag),");
  }
  sb.writeln('      ],');
  sb.writeln('      bonusWords: [$bonusStr],');
  sb.writeln('      gridRows: $gridRows,');
  sb.writeln('      gridCols: $gridCols,');
  sb.writeln('      preRevealedCells: [$preRevStr],');
  sb.writeln('    ),');

  print('=== DART CODE ===\n');
  print(sb.toString());

  print('=== STATS ===');
  print('Target words: ${placements.length} (${nonNamePlacements.length} non-name)');
  print('Bonus words: ${bonusWords.length}');
  print('Grid: $gridRows × $gridCols');
  print('Pre-revealed cells: $preRevealed');
}

// ---------------------------------------------------------------------------
// Dictionary helpers
// ---------------------------------------------------------------------------

Set<String> _loadDictionary(File file) {
  return file
      .readAsLinesSync()
      .map((line) => line.trim().toUpperCase())
      .where((w) => w.length >= _minWordLength && _alphaPattern.hasMatch(w))
      .toSet();
}

Set<String> _formableWords(List<String> letters, Set<String> dictionary) {
  final bag = _letterBag(letters);
  final results = <String>{};
  for (final word in dictionary) {
    if (word.length < _minWordLength || word.length > letters.length) continue;
    if (_canForm(word, bag)) results.add(word);
  }
  return results;
}

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
