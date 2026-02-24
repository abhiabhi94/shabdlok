import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ui/colors.dart';

class WordDisplay extends StatelessWidget {
  final String word;
  final bool isInvalid;
  final bool isAlreadyFound;

  const WordDisplay({
    super.key,
    required this.word,
    this.isInvalid = false,
    this.isAlreadyFound = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor;
    final Color bgColor;
    final Color textColor;
    final String displayText;

    if (isAlreadyFound) {
      borderColor = accentTerra;
      bgColor = accentTerra.withAlpha(30);
      textColor = accentTerraLight;
      displayText = 'Already found!';
    } else if (isInvalid) {
      borderColor = errorRed;
      bgColor = errorRed.withAlpha(30);
      textColor = errorRed;
      displayText = word;
    } else {
      borderColor = word.isEmpty ? borderDefault : accentGold;
      bgColor = accentGoldSubtle;
      textColor = word.isEmpty ? textDisabled : textPrimary;
      displayText = word.isEmpty ? '...' : word;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      constraints: const BoxConstraints(minWidth: 120, minHeight: 44),
      child: Text(
        displayText,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          fontSize: isAlreadyFound ? 14 : 22,
          fontWeight: FontWeight.w800,
          color: textColor,
          letterSpacing: isAlreadyFound ? 1.5 : 4,
        ),
      ),
    );
  }
}
