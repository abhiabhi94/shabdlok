import 'package:flutter/material.dart';
import '../ui/colors.dart';

class HintButton extends StatelessWidget {
  final int hintsRemaining;
  final int coinBalance;
  final VoidCallback? onPressed;

  static const int coinCost = 5;

  const HintButton({
    super.key,
    required this.hintsRemaining,
    required this.coinBalance,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final canAfford = coinBalance >= coinCost;
    final enabled = hintsRemaining > 0 && onPressed != null && canAfford;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: enabled ? onPressed : null,
      child: AnimatedOpacity(
        opacity: enabled ? 1.0 : 0.4,
        duration: const Duration(milliseconds: 200),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: cardBackground,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: enabled ? accentGold : borderDefault,
                  width: 1.5,
                ),
              ),
              child: Icon(Icons.lightbulb_outline,
                  size: 22, color: enabled ? accentGold : textDisabled),
            ),
            Positioned(
              top: -6,
              right: -6,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: enabled ? accentGold : borderDefault,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '$hintsRemaining',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
