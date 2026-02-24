import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ui/colors.dart';

class LevelCompleteCard extends StatelessWidget {
  final int levelId;
  final int wordsFound;
  final int bonusWordsFound;
  final bool hasNextLevel;
  final VoidCallback onNextLevel;
  final VoidCallback onHome;

  const LevelCompleteCard({
    super.key,
    required this.levelId,
    required this.wordsFound,
    required this.bonusWordsFound,
    required this.hasNextLevel,
    required this.onNextLevel,
    required this.onHome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.fromLTRB(28, 32, 28, 28),
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: accentGold.withAlpha(120), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: accentGold.withAlpha(50),
            blurRadius: 40,
            spreadRadius: 4,
          ),
          BoxShadow(
            color: backgroundDeep.withAlpha(200),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Trophy icon
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: accentGold.withAlpha(20),
              shape: BoxShape.circle,
              border: Border.all(color: accentGold.withAlpha(60), width: 1.5),
            ),
            child: const Icon(Icons.emoji_events_rounded,
                size: 32, color: accentGold),
          )
              .animate()
              .scale(begin: const Offset(0.5, 0.5), duration: 400.ms, curve: Curves.elasticOut)
              .fadeIn(duration: 250.ms),

          const SizedBox(height: 16),

          Text(
            'Level $levelId',
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: textSecondary,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Complete!',
            style: GoogleFonts.inter(
              fontSize: 34,
              fontWeight: FontWeight.w900,
              color: accentGold,
              letterSpacing: 0.5,
              height: 1.1,
            ),
          ),

          const SizedBox(height: 24),

          // Stats row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Stat(
                label: 'Words',
                value: '$wordsFound',
                icon: Icons.spellcheck_rounded,
                color: accentGold,
              ),
              Container(
                width: 1,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 28),
                color: borderDefault,
              ),
              _Stat(
                label: 'Bonus',
                value: '$bonusWordsFound',
                icon: Icons.auto_awesome,
                color: accentTerraLight,
              ),
            ],
          ),

          const SizedBox(height: 28),

          if (hasNextLevel)
            _ActionButton(
              label: 'Next Level',
              icon: Icons.arrow_forward_rounded,
              onTap: onNextLevel,
              primary: true,
            ),
          const SizedBox(height: 10),
          _ActionButton(
            label: 'All Levels',
            icon: Icons.grid_view_rounded,
            onTap: onHome,
            primary: false,
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _Stat({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 16, color: color.withAlpha(180)),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: textPrimary,
            height: 1,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 11,
            color: textSecondary,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool primary;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.onTap,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: primary ? accentGold : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: primary ? accentGold : borderDefault,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                size: 18,
                color: primary ? backgroundDeep : textSecondary),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: primary ? backgroundDeep : textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
