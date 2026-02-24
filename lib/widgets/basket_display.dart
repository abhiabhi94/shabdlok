import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ui/colors.dart';

class BasketDisplay extends StatelessWidget {
  final Set<String> bonusWords;

  const BasketDisplay({super.key, required this.bonusWords});

  @override
  Widget build(BuildContext context) {
    if (bonusWords.isEmpty) {
      return const SizedBox(height: 36);
    }

    return SizedBox(
      height: 36,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.auto_awesome, size: 14, color: accentGold.withAlpha(180)),
          const SizedBox(width: 6),
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: bonusWords.map((word) => _BonusChip(word: word)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BonusChip extends StatelessWidget {
  final String word;

  const _BonusChip({required this.word});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: accentGoldSubtle,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: accentGold.withAlpha(80), width: 1),
      ),
      child: Text(
        word,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: accentGoldLight,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
