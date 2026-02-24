import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ui/colors.dart';

class LevelCard extends StatelessWidget {
  final int levelId;
  final bool isCompleted;
  final bool isUnlocked;
  final VoidCallback? onTap;

  const LevelCard({
    super.key,
    required this.levelId,
    required this.isCompleted,
    required this.isUnlocked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color border;
    Color textColor;

    if (isCompleted) {
      bg = cellLocked;
      border = successGreen;
      textColor = successGreen;
    } else if (isUnlocked) {
      bg = cardBackground;
      border = accentGold;
      textColor = textPrimary;
    } else {
      bg = backgroundSurface;
      border = borderDefault;
      textColor = textDisabled;
    }

    return GestureDetector(
      onTap: isUnlocked ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: border, width: 1.5),
          boxShadow: isCompleted
              ? [BoxShadow(color: successGreen.withAlpha(40), blurRadius: 8)]
              : isUnlocked
                  ? [BoxShadow(color: accentGold.withAlpha(25), blurRadius: 6)]
                  : null,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              '$levelId',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: textColor,
              ),
            ),
            if (isCompleted)
              const Positioned(
                top: 6,
                right: 6,
                child: Icon(Icons.check_circle_rounded,
                    size: 12, color: successGreen),
              ),
            if (!isUnlocked)
              const Positioned(
                bottom: 6,
                right: 6,
                child: Icon(Icons.lock_rounded, size: 12, color: textDisabled),
              ),
          ],
        ),
      ),
    );
  }
}
