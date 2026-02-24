// Audit and auto-patch missing bonus words in level_data.dart.
//
// Usage:
//   dart run tools/audit_bonus_words.dart
//
// Requires tools/words_alpha.txt (dwyl english-words list).
// Downloads available at: https://github.com/dwyl/english-words

import 'dart:io';

// Minimum word length accepted by the game (see game_provider.dart submitWord)
const _minWordLength = 3;

void main() {
  final wordListFile = File('tools/words_alpha.txt');
  if (!wordListFile.existsSync()) {
    stderr.writeln('ERROR: tools/words_alpha.txt not found.');
    stderr.writeln('Download from: https://raw.githubusercontent.com/dwyl/english-words/master/words_alpha.txt');
    exit(1);
  }

  final levelDataFile = File('lib/data/level_data.dart');
  if (!levelDataFile.existsSync()) {
    stderr.writeln('ERROR: lib/data/level_data.dart not found.');
    stderr.writeln('Run this script from the project root.');
    exit(1);
  }

  final dictionary = _loadDictionary(wordListFile);
  print('Loaded ${dictionary.length} dictionary words.');

  final source = levelDataFile.readAsStringSync();
  final levels = _parseLevels(source);
  print('Parsed ${levels.length} levels.\n');

  var totalAdded = 0;
  var patched = source;

  for (final level in levels) {
    final formable = _formableWords(level.letters, dictionary);
    final known = {...level.targetWords, ...level.bonusWords};
    final missing = formable.difference(known).toList()..sort();

    if (missing.isEmpty) continue;

    print('Level ${level.id} (${level.name}): adding ${missing.length} words: $missing');
    totalAdded += missing.length;

    final merged = {...level.bonusWords, ...missing}.toList()..sort();
    patched = _patchBonusWords(patched, level, merged);
  }

  if (totalAdded == 0) {
    print('All levels are complete — no missing bonus words found.');
    return;
  }

  levelDataFile.writeAsStringSync(patched);
  print('\nPatched lib/data/level_data.dart — added $totalAdded bonus words across ${levels.where((l) {
    final formable = _formableWords(l.letters, dictionary);
    final known = {...l.targetWords, ...l.bonusWords};
    return formable.difference(known).isNotEmpty;
  }).length} levels.');
  print('Run: flutter test');
}

// ---------------------------------------------------------------------------
// Dictionary loading
// ---------------------------------------------------------------------------

Set<String> _loadDictionary(File file) {
  return file
      .readAsLinesSync()
      .map((line) => line.trim().toUpperCase())
      .where((w) => w.length >= _minWordLength && _isAlpha(w))
      .toSet();
}

final _alphaPattern = RegExp(r'^[A-Z]+$');

bool _isAlpha(String w) => _alphaPattern.hasMatch(w);

// ---------------------------------------------------------------------------
// Find all words formable from a letter bag
// ---------------------------------------------------------------------------

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

// ---------------------------------------------------------------------------
// Level parsing — extract enough structure to compute formable words and patch
// ---------------------------------------------------------------------------

class _LevelInfo {
  final int id;
  final String name;
  final List<String> letters;
  final Set<String> targetWords;
  final Set<String> bonusWords;
  // The exact bonusWords: [...] substring in source, for replacement
  final String bonusWordsRaw;

  _LevelInfo({
    required this.id,
    required this.name,
    required this.letters,
    required this.targetWords,
    required this.bonusWords,
    required this.bonusWordsRaw,
  });
}

// Matches: id: 4,
final _idPattern = RegExp(r'id:\s*(\d+),');
// Matches: name: 'Foo',
final _namePattern = RegExp(r"name:\s*'([^']+)'");
// Matches: letters: ['A', 'B', 'C'],
final _lettersPattern = RegExp(r"letters:\s*\[([^\]]+)\]");
// Matches: word: 'FOO',
final _wordPattern = RegExp(r"word:\s*'([A-Z]+)'");
// Matches: bonusWords: ['FOO', 'BAR'],  — including empty list
final _bonusWordsPattern = RegExp(r"bonusWords:\s*\[([^\]]*)\]");

List<_LevelInfo> _parseLevels(String source) {
  // Split on Level( boundaries
  final levelChunks = _splitLevelChunks(source);
  final levels = <_LevelInfo>[];

  for (final chunk in levelChunks) {
    final idMatch = _idPattern.firstMatch(chunk);
    final nameMatch = _namePattern.firstMatch(chunk);
    final lettersMatch = _lettersPattern.firstMatch(chunk);
    final bonusMatch = _bonusWordsPattern.firstMatch(chunk);

    if (idMatch == null || nameMatch == null || lettersMatch == null || bonusMatch == null) {
      continue;
    }

    final id = int.parse(idMatch.group(1)!);
    final name = nameMatch.group(1)!;
    final letters = _parseStringList(lettersMatch.group(1)!);
    final bonusWords = _parseStringList(bonusMatch.group(1)!).toSet();
    final targetWords = _wordPattern.allMatches(chunk).map((m) => m.group(1)!).toSet();

    levels.add(_LevelInfo(
      id: id,
      name: name,
      letters: letters,
      targetWords: targetWords,
      bonusWords: bonusWords,
      bonusWordsRaw: bonusMatch.group(0)!,
    ));
  }

  return levels;
}

// Split source into per-level chunks by finding Level( ... ) blocks.
// Each chunk is the text from one `Level(` to the matching closing `)`.
List<String> _splitLevelChunks(String source) {
  final chunks = <String>[];
  var i = 0;
  while (i < source.length) {
    final start = source.indexOf('Level(', i);
    if (start == -1) break;

    // Find matching closing paren by counting depth
    var depth = 0;
    var j = start;
    while (j < source.length) {
      if (source[j] == '(') depth++;
      if (source[j] == ')') {
        depth--;
        if (depth == 0) {
          chunks.add(source.substring(start, j + 1));
          i = j + 1;
          break;
        }
      }
      j++;
    }
    if (depth != 0) break; // malformed
  }
  return chunks;
}

List<String> _parseStringList(String inner) {
  if (inner.trim().isEmpty) return [];
  return inner
      .split(',')
      .map((s) => s.trim().replaceAll("'", ''))
      .where((s) => s.isNotEmpty)
      .toList();
}

// ---------------------------------------------------------------------------
// Patch the bonusWords line for a given level in source
// ---------------------------------------------------------------------------

String _patchBonusWords(String source, _LevelInfo level, List<String> merged) {
  final newList = merged.map((w) => "'$w'").join(', ');
  final replacement = 'bonusWords: [$newList]';

  // We need to replace the FIRST occurrence of this level's bonusWords.
  // Since bonusWordsRaw is the exact matched text, find it in context near
  // the level's id to avoid collisions if two levels happen to have the same list.
  final levelIdMarker = 'id: ${level.id},';
  final levelStart = source.indexOf(levelIdMarker);
  if (levelStart == -1) return source;

  // Find the next bonusWords: [...] after this level's id marker
  final bonusStart = source.indexOf('bonusWords:', levelStart);
  if (bonusStart == -1) return source;

  final bonusEnd = source.indexOf(']', bonusStart) + 1;

  return source.substring(0, bonusStart) + replacement + source.substring(bonusEnd);
}
