import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/level_progress.dart';

// ---------- Coin repository ----------

class CoinRepository {
  static const _coinsKey = 'shabdlok_total_coins';

  final SharedPreferences _prefs;

  CoinRepository(this._prefs);

  int load() => _prefs.getInt(_coinsKey) ?? 0;

  void save(int coins) => _prefs.setInt(_coinsKey, coins);
}

// ---------- Riverpod coin notifier ----------

class CoinNotifier extends StateNotifier<int> {
  final CoinRepository _repo;

  CoinNotifier(this._repo) : super(_repo.load());

  void add(int amount) {
    state = state + amount;
    _repo.save(state);
  }

  /// Returns false if not enough coins.
  bool spend(int amount) {
    if (state < amount) return false;
    state = state - amount;
    _repo.save(state);
    return true;
  }
}

CoinNotifier? _coinNotifierInstance;

/// Must be called before [runApp] / before [coinProvider] is first read.
void initCoinNotifier(SharedPreferences prefs) {
  _coinNotifierInstance = CoinNotifier(CoinRepository(prefs));
}

final coinProvider = StateNotifierProvider<CoinNotifier, int>(
  (ref) => _coinNotifierInstance!,
);

// ---------- Level progress repository ----------

class GameProgressRepository {
  static const _prefix = 'shabdlok_level_';
  static const _foundTargetsKey = '_found_targets';
  static const _foundBonusKey = '_found_bonus';
  static const _hintsUsedKey = '_hints_used';
  static const _completedKey = '_completed';

  final SharedPreferences _prefs;

  GameProgressRepository(this._prefs);

  LevelProgress load(int levelId) {
    final p = '$_prefix$levelId';
    return LevelProgress(
      levelId: levelId,
      foundTargetWords:
          (_prefs.getStringList('$p$_foundTargetsKey') ?? []).toSet(),
      foundBonusWords:
          (_prefs.getStringList('$p$_foundBonusKey') ?? []).toSet(),
      hintsUsed: _prefs.getInt('$p$_hintsUsedKey') ?? 0,
      isCompleted: _prefs.getBool('$p$_completedKey') ?? false,
    );
  }

  void save(LevelProgress progress) {
    final p = '$_prefix${progress.levelId}';
    _prefs.setStringList(
        '$p$_foundTargetsKey', progress.foundTargetWords.toList());
    _prefs.setStringList(
        '$p$_foundBonusKey', progress.foundBonusWords.toList());
    _prefs.setInt('$p$_hintsUsedKey', progress.hintsUsed);
    _prefs.setBool('$p$_completedKey', progress.isCompleted);
  }

  LevelProgress reset(int levelId) {
    final p = '$_prefix$levelId';
    _prefs.remove('$p$_foundTargetsKey');
    _prefs.remove('$p$_foundBonusKey');
    _prefs.remove('$p$_hintsUsedKey');
    _prefs.remove('$p$_completedKey');
    return load(levelId);
  }

  bool isLevelUnlocked(int levelId) {
    if (kDebugMode) return true;
    if (levelId == 1) return true;
    return _prefs.getBool('$_prefix${levelId - 1}$_completedKey') ?? false;
  }

  int highestUnlockedLevel() {
    for (int i = 25; i >= 1; i--) {
      if (isLevelUnlocked(i)) return i;
    }
    return 1;
  }
}
