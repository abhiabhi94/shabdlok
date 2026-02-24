class LevelProgress {
  final int levelId;
  final Set<String> foundTargetWords;
  final Set<String> foundBonusWords;
  final int hintsUsed;
  final bool isCompleted;

  const LevelProgress({
    required this.levelId,
    required this.foundTargetWords,
    required this.foundBonusWords,
    required this.hintsUsed,
    required this.isCompleted,
  });

  LevelProgress copyWith({
    Set<String>? foundTargetWords,
    Set<String>? foundBonusWords,
    int? hintsUsed,
    bool? isCompleted,
  }) {
    return LevelProgress(
      levelId: levelId,
      foundTargetWords: foundTargetWords ?? this.foundTargetWords,
      foundBonusWords: foundBonusWords ?? this.foundBonusWords,
      hintsUsed: hintsUsed ?? this.hintsUsed,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  static LevelProgress empty(int levelId) => LevelProgress(
        levelId: levelId,
        foundTargetWords: {},
        foundBonusWords: {},
        hintsUsed: 0,
        isCompleted: false,
      );
}
