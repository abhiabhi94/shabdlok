import 'dart:math';

import 'package:flutter/material.dart';

import '../ui/colors.dart';

class ConfettiOverlay extends StatefulWidget {
  const ConfettiOverlay({super.key});

  @override
  State<ConfettiOverlay> createState() => _ConfettiOverlayState();
}

class _ConfettiOverlayState extends State<ConfettiOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<_Particle> _particles;
  final Random _rng = Random();

  static const _count = 60;
  static const _colors = [
    accentGold,
    accentGoldLight,
    accentTerra,
    accentTerraLight,
    successGreen,
    textPrimary,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2_000),
    )..forward();
    _particles = List.generate(_count, (_) => _Particle(_rng));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return CustomPaint(
          painter: _ConfettiPainter(
            particles: _particles,
            progress: _controller.value,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class _Particle {
  final double x;
  final double vy;
  final double vx;
  final double size;
  final Color color;
  final double rotation;
  final double rotationSpeed;

  _Particle(Random rng)
      : x = rng.nextDouble(),
        vy = 0.3 + rng.nextDouble() * 0.7,
        vx = (rng.nextDouble() - 0.5) * 0.3,
        size = 6 + rng.nextDouble() * 8,
        color = _ConfettiOverlayState._colors[
            rng.nextInt(_ConfettiOverlayState._colors.length)],
        rotation = rng.nextDouble() * pi * 2,
        rotationSpeed = (rng.nextDouble() - 0.5) * 8;
}

class _ConfettiPainter extends CustomPainter {
  final List<_Particle> particles;
  final double progress;

  _ConfettiPainter({required this.particles, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    for (final p in particles) {
      final cx = (p.x + p.vx * progress) * size.width;
      final cy = p.vy * progress * size.height * 1.2;
      final opacity = (1.0 - progress * 0.8).clamp(0.0, 1.0);

      paint.color = p.color.withAlpha((opacity * 255).round());

      canvas.save();
      canvas.translate(cx, cy);
      canvas.rotate(p.rotation + p.rotationSpeed * progress);
      canvas.drawRect(
        Rect.fromCenter(center: Offset.zero, width: p.size, height: p.size * 0.5),
        paint,
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter old) => old.progress != progress;
}
