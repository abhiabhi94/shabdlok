import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/level_data.dart';
import '../providers/progress_provider.dart';
import '../ui/colors.dart';

class HomeScreen extends StatelessWidget {
  final GameProgressRepository repository;
  final void Function(int levelId) onLevelSelected;

  const HomeScreen({
    super.key,
    required this.repository,
    required this.onLevelSelected,
  });

  @override
  Widget build(BuildContext context) {
    final total = LevelData.levels.length;
    final completed =
        LevelData.levels.where((l) => repository.load(l.id).isCompleted).length;

    // Find the first unlocked, incomplete level (the "current" level)
    final firstIncomplete = LevelData.levels
        .where((l) => repository.isLevelUnlocked(l.id) && !repository.load(l.id).isCompleted)
        .map((l) => l.id)
        .firstOrNull;

    // In debug builds show every level; in release show completed + next 5.
    final List<int> visibleIds;
    if (kDebugMode) {
      visibleIds = List.generate(total, (i) => i + 1);
    } else {
      final anchorId = firstIncomplete ?? total;
      final upcomingEnd = (anchorId + 4).clamp(1, total);
      visibleIds = <int>{
        ...LevelData.levels
            .where((l) => repository.load(l.id).isCompleted)
            .map((l) => l.id),
        for (int i = anchorId; i <= upcomingEnd; i++) i,
      }.toList()
        ..sort();
    }

    return Scaffold(
      backgroundColor: backgroundDeep,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),

            // Title block
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ShabdLok',
                    style: GoogleFonts.inter(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: accentGold,
                      letterSpacing: 2,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Word Puzzle',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: textSecondary,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Progress block
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: _ProgressBlock(completed: completed, total: total),
            ),

            const SizedBox(height: 32),

            // Section header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    firstIncomplete == null ? 'All Complete' : 'Your Levels',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: textSecondary,
                      letterSpacing: 2,
                    ),
                  ),
                  Text(
                    '$total levels total',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: textDisabled,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Level list
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                itemCount: visibleIds.length,
                separatorBuilder: (_, _) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final id = visibleIds[index];
                  final progress = repository.load(id);
                  final unlocked = repository.isLevelUnlocked(id);
                  final isCurrent = id == firstIncomplete;

                  return _LevelRow(
                    levelId: id,
                    isCompleted: progress.isCompleted,
                    isUnlocked: unlocked,
                    isCurrent: isCurrent,
                    bonusCount: progress.foundBonusWords.length,
                    onTap: unlocked ? () => onLevelSelected(id) : null,
                  ).animate().fadeIn(
                        delay: Duration(milliseconds: index * 60),
                        duration: 300.ms,
                      ).slideX(
                        begin: 0.08,
                        end: 0,
                        delay: Duration(milliseconds: index * 60),
                        duration: 300.ms,
                        curve: Curves.easeOut,
                      );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _ProgressBlock extends StatelessWidget {
  final int completed;
  final int total;

  const _ProgressBlock({required this.completed, required this.total});

  @override
  Widget build(BuildContext context) {
    final pct = completed / total;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderDefault, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$completed completed',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: textPrimary,
                ),
              ),
              Text(
                '${(pct * 100).round()}%',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: accentGold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: pct,
              minHeight: 8,
              backgroundColor: borderDefault,
              valueColor: const AlwaysStoppedAnimation<Color>(accentGold),
            ),
          ),
        ],
      ),
    );
  }
}

class _LevelRow extends StatelessWidget {
  final int levelId;
  final bool isCompleted;
  final bool isUnlocked;
  final bool isCurrent;
  final int bonusCount;
  final VoidCallback? onTap;

  const _LevelRow({
    required this.levelId,
    required this.isCompleted,
    required this.isUnlocked,
    required this.isCurrent,
    required this.bonusCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor;
    final Color bgColor;
    final Color numberColor;

    if (isCompleted) {
      borderColor = successGreen.withAlpha(100);
      bgColor = successSubtle;
      numberColor = successGreen;
    } else if (isCurrent) {
      borderColor = accentGold;
      bgColor = accentGoldSubtle;
      numberColor = accentGold;
    } else if (isUnlocked) {
      borderColor = borderHighlight;
      bgColor = backgroundSurface;
      numberColor = textPrimary;
    } else {
      borderColor = borderDefault;
      bgColor = backgroundDeep;
      numberColor = textDisabled;
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor, width: isCurrent ? 1.5 : 1),
          boxShadow: isCurrent
              ? [BoxShadow(color: accentGold.withAlpha(30), blurRadius: 12, spreadRadius: 1)]
              : isCompleted
                  ? [BoxShadow(color: successGreen.withAlpha(15), blurRadius: 8)]
                  : null,
        ),
        child: Row(
          children: [
            // Level number badge
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: isCompleted
                    ? successGreen.withAlpha(20)
                    : isCurrent
                        ? accentGold.withAlpha(20)
                        : borderDefault.withAlpha(60),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                '$levelId',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: numberColor,
                ),
              ),
            ),

            const SizedBox(width: 16),

            // Label + bonus
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isCurrent ? 'Current Level' : isCompleted ? 'Completed' : isUnlocked ? 'Unlocked' : 'Locked',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: isCompleted ? successGreen : isCurrent ? accentGold : textDisabled,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Level $levelId',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: isUnlocked ? textPrimary : textDisabled,
                    ),
                  ),
                ],
              ),
            ),

            // Right side: bonus stars or lock icon
            if (isCompleted && bonusCount > 0) ...[
              Icon(Icons.auto_awesome, size: 12, color: accentGold.withAlpha(200)),
              const SizedBox(width: 4),
              Text(
                '$bonusCount',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: accentGold,
                ),
              ),
              const SizedBox(width: 8),
            ],
            if (isCompleted)
              const Icon(Icons.check_circle_rounded, size: 22, color: successGreen)
            else if (isCurrent)
              const Icon(Icons.play_circle_filled_rounded, size: 22, color: accentGold)
            else if (!isUnlocked)
              const Icon(Icons.lock_rounded, size: 18, color: textDisabled)
            else
              const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: textSecondary),
          ],
        ),
      ),
    );
  }
}
