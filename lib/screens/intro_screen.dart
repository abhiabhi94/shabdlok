import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ui/colors.dart';
import '../widgets/roulette_wheel.dart';

// Letters on the demo wheel; P=0, L=1, A=2, Y=3 are the ones being "swiped".
const List<String> _kLetters = ['P', 'L', 'A', 'Y', 'S', 'I', 'N', 'G'];
const List<int> _kDisplayOrder = [0, 1, 2, 3, 4, 5, 6, 7];

// Which original indices get highlighted, in swipe order (P→L→A→Y).
const List<int> _kSwipeOrder = [0, 1, 2, 3];

// Animation timeline fractions (out of 1.0, total duration 5500ms).
const double _tFadeIn = 0.07;       // 0–385ms    title + bg fade in
const double _tWheelIn = 0.15;      // 550–825ms  wheel fades in
const double _tL0Start = 0.20;      // 1100ms — letter P highlights
const double _tL0End = 0.27;
const double _tL1Start = 0.27;      // letter L
const double _tL1End = 0.34;
const double _tL2Start = 0.34;      // letter A
const double _tL2End = 0.41;
const double _tL3Start = 0.41;      // letter Y
const double _tL3End = 0.48;
const double _tWordStart = 0.52;    // "PLAY" word fades in
const double _tWordEnd = 0.60;
const double _tFadeOutStart = 0.80; // screen fades out (holds "PLAY" for ~1.1s)
const double _tFadeOutEnd = 1.00;

class IntroScreen extends StatefulWidget {
  final VoidCallback onDone;

  const IntroScreen({super.key, required this.onDone});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  bool _doneFired = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5_500),
    )..addListener(_onTick)..forward();
  }

  void _onTick() {
    if (!_doneFired && _ctrl.value >= _tFadeOutEnd) {
      _doneFired = true;
      widget.onDone();
    }
    setState(() {});
  }

  @override
  void dispose() {
    _ctrl.removeListener(_onTick);
    _ctrl.dispose();
    super.dispose();
  }

  double _interval(double start, double end) {
    final v = _ctrl.value;
    if (v <= start) return 0.0;
    if (v >= end) return 1.0;
    return (v - start) / (end - start);
  }

  @override
  Widget build(BuildContext context) {
    final fadeIn = _interval(0.0, _tFadeIn);
    final wheelIn = _interval(_tWheelIn, _tWheelIn + 0.08);
    final fadeOut = _interval(_tFadeOutStart, _tFadeOutEnd);
    final wordReveal = _interval(_tWordStart, _tWordEnd);

    // Which letters are highlighted & trail points (computed from wheel geometry).
    final highlighted = <int>{};
    final steps = [
      (_tL0Start, _tL0End, _kSwipeOrder[0]),
      (_tL1Start, _tL1End, _kSwipeOrder[1]),
      (_tL2Start, _tL2End, _kSwipeOrder[2]),
      (_tL3Start, _tL3End, _kSwipeOrder[3]),
    ];
    for (final (start, _, idx) in steps) {
      if (_ctrl.value >= start) highlighted.add(idx);
    }

    final screenOpacity = (fadeIn * (1.0 - fadeOut)).clamp(0.0, 1.0);

    return Opacity(
      opacity: screenOpacity,
      child: Scaffold(
        backgroundColor: backgroundDeep,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title
              Opacity(
                opacity: fadeIn,
                child: Transform.translate(
                  offset: Offset(0, (1 - fadeIn) * 20),
                  child: Column(
                    children: [
                      Text(
                        'ShabdLok',
                        style: GoogleFonts.inter(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: accentGold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Word Puzzle',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: textSecondary,
                          letterSpacing: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 48),

              // Hint label above wheel
              Opacity(
                opacity: wheelIn,
                child: Text(
                  'swipe to spell a word',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: textSecondary,
                    letterSpacing: 2,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Animated wheel
              Opacity(
                opacity: wheelIn,
                child: SizedBox(
                  width: 260,
                  height: 260,
                  child: _AnimatedWheelDisplay(
                    letters: _kLetters,
                    displayOrder: _kDisplayOrder,
                    highlightedIndices: highlighted,
                    ctrlValue: _ctrl.value,
                    steps: steps,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // "PLAY" word reveal
              Opacity(
                opacity: wordReveal,
                child: Transform.scale(
                  scale: 0.85 + 0.15 * wordReveal,
                  child: Text(
                    'PLAY',
                    style: GoogleFonts.inter(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: accentGold,
                      letterSpacing: 8,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Stateless display-only widget that drives WheelPainter with animated trail.
class _AnimatedWheelDisplay extends StatelessWidget {
  final List<String> letters;
  final List<int> displayOrder;
  final Set<int> highlightedIndices;
  final double ctrlValue;
  final List<(double, double, int)> steps;

  const _AnimatedWheelDisplay({
    required this.letters,
    required this.displayOrder,
    required this.highlightedIndices,
    required this.ctrlValue,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final size = constraints.biggest.shortestSide;
      final center = size / 2;
      final letterRadius = size / 2 * 0.72;
      final hitRadius = size / 2 * 0.14;

      // Build trail points for letters that have been reached.
      final trailPoints = <Offset>[];
      Offset? fingerPos;

      for (final (start, end, idx) in steps) {
        if (ctrlValue < start) break;

        final visualPos = displayOrder.indexOf(idx);
        final n = letters.length;
        final angle = visualPos * (2 * pi / n) - pi / 2;
        final pt = Offset(
          center + letterRadius * cos(angle),
          center + letterRadius * sin(angle),
        );

        if (ctrlValue >= end) {
          // Fully reached this letter.
          trailPoints.add(pt);
        } else {
          // Partially into this letter's phase — animate the finger moving toward it.
          final progress = (ctrlValue - start) / (end - start);

          // Previous trail point (or center of wheel for first letter).
          final from = trailPoints.isNotEmpty
              ? trailPoints.last
              : Offset(center, center);

          trailPoints.add(from + (pt - from) * progress);
          fingerPos = trailPoints.last;
          break;
        }
      }

      return CustomPaint(
        size: Size(size, size),
        painter: WheelPainter(
          letters: letters,
          displayOrder: displayOrder,
          selectedIndices: highlightedIndices.toList(),
          highlightedIndices: highlightedIndices,
          trailPoints: trailPoints,
          fingerPos: fingerPos,
          letterRadius: letterRadius,
          hitRadius: hitRadius,
        ),
      );
    });
  }
}
