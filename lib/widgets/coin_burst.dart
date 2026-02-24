import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ui/colors.dart';

/// Spawns [coinCount] coin icons that fly from [origin] toward [target],
/// followed by a "+N" label that pops and fades.
///
/// Place inside a full-screen [Stack]. Call [onDone] to remove it.
class CoinFlyAnimation extends StatefulWidget {
  final Offset origin;
  final Offset target;
  final int coinCount;
  final VoidCallback onDone;

  // Total coins earned (shown in the "+N" label)
  final int totalCoins;

  static const Duration totalDuration = Duration(milliseconds: 1_400);

  const CoinFlyAnimation({
    super.key,
    required this.origin,
    required this.target,
    required this.coinCount,
    required this.totalCoins,
    required this.onDone,
  });

  @override
  State<CoinFlyAnimation> createState() => _CoinFlyAnimationState();
}

class _CoinFlyAnimationState extends State<CoinFlyAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  // Each coin gets a random horizontal arc offset so they fan out slightly
  late final List<double> _arcOffsets;
  late final List<double> _delays; // 0..1 normalised start time per coin

  static const _coinSize = 18.0;
  static const _coinCount = 6; // max visual coins regardless of amount

  @override
  void initState() {
    super.initState();
    final rng = Random();
    final count = widget.coinCount.clamp(1, _coinCount);
    _arcOffsets = List.generate(count, (_) => (rng.nextDouble() - 0.5) * 80);
    // Stagger coins: first at t=0, last starts at t=0.25
    _delays = List.generate(count, (i) => i * 0.25 / count.clamp(1, count - 1).toDouble());
    if (count == 1) _delays[0] = 0;

    _controller = AnimationController(
      vsync: this,
      duration: CoinFlyAnimation.totalDuration,
    )..forward().whenComplete(widget.onDone);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final count = widget.coinCount.clamp(1, _coinCount);
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final t = _controller.value;
          // "+N" label appears after coins start arriving (~60% through)
          final labelOpacity = t < 0.55
              ? 0.0
              : t < 0.70
                  ? ((t - 0.55) / 0.15).clamp(0.0, 1.0)
                  : t < 0.85
                      ? 1.0
                      : (1.0 - (t - 0.85) / 0.15).clamp(0.0, 1.0);

          return Stack(
            children: [
              // Flying coins
              for (int i = 0; i < count; i++)
                _buildCoin(i, t),

              // "+N" label near the target
              if (labelOpacity > 0)
                Positioned(
                  left: widget.target.dx - 28,
                  top: widget.target.dy - 32,
                  child: Opacity(
                    opacity: labelOpacity,
                    child: Transform.scale(
                      scale: 0.8 + labelOpacity * 0.3,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: accentGold,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '+${widget.totalCoins}',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: backgroundDeep,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCoin(int i, double globalT) {
    final delay = _delays[i];
    // Local progress for this coin: 0..1 over 75% of total timeline
    final coinDuration = 0.75;
    final localT = ((globalT - delay) / coinDuration).clamp(0.0, 1.0);

    if (localT <= 0) return const SizedBox.shrink();

    // Ease-in-out curve for the flight
    final eased = Curves.easeInOut.transform(localT);

    // Quadratic bezier: start → control → target
    // Control point fans coins upward/sideways
    final ctrl = Offset(
      (widget.origin.dx + widget.target.dx) / 2 + _arcOffsets[i],
      (widget.origin.dy + widget.target.dy) / 2 - 80,
    );

    final pos = _quadBezier(widget.origin, ctrl, widget.target, eased);

    // Scale down as they approach target
    final scale = (1.0 - eased * 0.4).clamp(0.6, 1.0);
    // Fade out last 20% of travel
    final opacity = localT < 0.8
        ? 1.0
        : (1.0 - (localT - 0.8) / 0.2).clamp(0.0, 1.0);

    return Positioned(
      left: pos.dx - _coinSize / 2,
      top: pos.dy - _coinSize / 2,
      child: Opacity(
        opacity: opacity,
        child: Transform.scale(
          scale: scale,
          child: Container(
            width: _coinSize,
            height: _coinSize,
            decoration: BoxDecoration(
              color: accentGold,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: accentGold.withAlpha(160),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Center(child: _CoinFace(size: _coinSize)),
          ),
        ),
      ),
    );
  }

  Offset _quadBezier(Offset p0, Offset p1, Offset p2, double t) {
    final mt = 1 - t;
    return Offset(
      mt * mt * p0.dx + 2 * mt * t * p1.dx + t * t * p2.dx,
      mt * mt * p0.dy + 2 * mt * t * p1.dy + t * t * p2.dy,
    );
  }
}

/// A coin face: filled circle with an inner ring, no currency symbol.
class _CoinFace extends StatelessWidget {
  final double size;
  const _CoinFace({required this.size});

  @override
  Widget build(BuildContext context) {
    final inner = size * 0.55;
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: Container(
          width: inner,
          height: inner,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: backgroundDeep.withAlpha(180), width: 1.5),
          ),
        ),
      ),
    );
  }
}

/// Persistent coin display shown in the top bar.
class CoinDisplay extends StatelessWidget {
  final int coins;

  const CoinDisplay({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accentGold.withAlpha(80), width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              color: accentGold,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: backgroundDeep.withAlpha(180), width: 1.5),
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, anim) => SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -0.5),
                end: Offset.zero,
              ).animate(CurvedAnimation(parent: anim, curve: Curves.easeOut)),
              child: FadeTransition(opacity: anim, child: child),
            ),
            child: Text(
              '$coins',
              key: ValueKey(coins),
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: accentGold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
