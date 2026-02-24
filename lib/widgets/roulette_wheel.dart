import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ui/colors.dart';

class RouletteWheel extends StatefulWidget {
  final List<String> letters;
  // displayOrder[i] = original index of the letter shown at visual position i
  final List<int> displayOrder;
  final List<int> selectedIndices;
  final void Function(int index) onLetterEntered;
  final void Function() onGestureEnd;
  final void Function() onShuffle;

  const RouletteWheel({
    super.key,
    required this.letters,
    required this.displayOrder,
    required this.selectedIndices,
    required this.onLetterEntered,
    required this.onGestureEnd,
    required this.onShuffle,
  });

  @override
  State<RouletteWheel> createState() => _RouletteWheelState();
}

class _RouletteWheelState extends State<RouletteWheel> {
  Offset? _center;
  double _letterRadius = 0;
  double _hitRadius = 0;
  double _innerRadius = 0;

  Offset? _fingerPos;
  final List<Offset> _trailPoints = [];
  // Which original indices have been highlighted (circle shown)
  final Set<int> _highlightedIndices = {};

  bool _isTapInCenter(Offset localPos) {
    if (_center == null) return false;
    final dx = localPos.dx - _center!.dx;
    final dy = localPos.dy - _center!.dy;
    return dx * dx + dy * dy <= _innerRadius * _innerRadius;
  }

  Offset _letterCenter(int visualPos) {
    final n = widget.letters.length;
    final angle = visualPos * (2 * pi / n) - pi / 2;
    return Offset(
      _center!.dx + _letterRadius * cos(angle),
      _center!.dy + _letterRadius * sin(angle),
    );
  }

  /// Returns the original letter index if localPos is within its hit circle, else -1.
  int _originalIndexAt(Offset localPos) {
    if (_center == null) return -1;
    final n = widget.letters.length;
    for (int visualPos = 0; visualPos < n; visualPos++) {
      final letterCenter = _letterCenter(visualPos);
      final dx = localPos.dx - letterCenter.dx;
      final dy = localPos.dy - letterCenter.dy;
      if (dx * dx + dy * dy <= _hitRadius * _hitRadius) {
        return widget.displayOrder[visualPos];
      }
    }
    return -1;
  }

  void _handlePanDown(DragDownDetails details) {
    final origIndex = _originalIndexAt(details.localPosition);
    setState(() {
      _fingerPos = details.localPosition;
      _trailPoints.clear();
      _highlightedIndices.clear();
      if (origIndex >= 0) {
        final visualPos = widget.displayOrder.indexOf(origIndex);
        _trailPoints.add(_letterCenter(visualPos));
        _highlightedIndices.add(origIndex);
        widget.onLetterEntered(origIndex);
      }
    });
  }

  void _handlePanStart(DragStartDetails details) {
    final origIndex = _originalIndexAt(details.localPosition);
    setState(() {
      _fingerPos = details.localPosition;
      if (origIndex >= 0 && !_highlightedIndices.contains(origIndex)) {
        final visualPos = widget.displayOrder.indexOf(origIndex);
        _trailPoints.add(_letterCenter(visualPos));
        _highlightedIndices.add(origIndex);
        widget.onLetterEntered(origIndex);
      }
    });
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    final origIndex = _originalIndexAt(details.localPosition);
    setState(() {
      _fingerPos = details.localPosition;
      if (origIndex >= 0) {
        final lastVisited = widget.selectedIndices.isNotEmpty
            ? widget.selectedIndices.last
            : -1;
        final alreadySelected = widget.selectedIndices.contains(origIndex);
        if (origIndex != lastVisited && !alreadySelected) {
          final visualPos = widget.displayOrder.indexOf(origIndex);
          _trailPoints.add(_letterCenter(visualPos));
          _highlightedIndices.add(origIndex);
          widget.onLetterEntered(origIndex);
        }
      }
    });
  }

  void _handlePanEnd(DragEndDetails _) {
    setState(() {
      _fingerPos = null;
      _trailPoints.clear();
      _highlightedIndices.clear();
    });
    widget.onGestureEnd();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: _handlePanDown,
      onPanStart: _handlePanStart,
      onPanUpdate: _handlePanUpdate,
      onPanEnd: _handlePanEnd,
      onTapUp: (details) {
        if (_isTapInCenter(details.localPosition)) {
          widget.onShuffle();
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.biggest.shortestSide;
          _center = Offset(size / 2, size / 2);
          _letterRadius = size / 2 * 0.72;
          _hitRadius = size / 2 * 0.14;
          _innerRadius = size / 2 * 0.18;
          return CustomPaint(
            size: Size(size, size),
            painter: WheelPainter(
              letters: widget.letters,
              displayOrder: widget.displayOrder,
              selectedIndices: widget.selectedIndices,
              highlightedIndices: Set.unmodifiable(_highlightedIndices),
              trailPoints: List.unmodifiable(_trailPoints),
              fingerPos: _fingerPos,
              letterRadius: _letterRadius,
              hitRadius: _hitRadius,
            ),
          );
        },
      ),
    );
  }
}

class WheelPainter extends CustomPainter {
  final List<String> letters;
  final List<int> displayOrder;
  final List<int> selectedIndices;
  final Set<int> highlightedIndices;
  final List<Offset> trailPoints;
  final Offset? fingerPos;
  final double letterRadius;
  final double hitRadius;

  WheelPainter({
    required this.letters,
    required this.displayOrder,
    required this.selectedIndices,
    required this.highlightedIndices,
    required this.trailPoints,
    required this.fingerPos,
    required this.letterRadius,
    required this.hitRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final n = letters.length;
    final center = Offset(size.width / 2, size.height / 2);
    final innerRadius = size.shortestSide / 2 * 0.18;

    // Outer ring encompassing all letter slots
    canvas.drawCircle(
      center,
      letterRadius + hitRadius + 5,
      Paint()
        ..style = PaintingStyle.stroke
        ..color = borderHighlight.withAlpha(80)
        ..strokeWidth = 1.0,
    );

    // Center circle
    canvas.drawCircle(center, innerRadius, Paint()..color = rouletteCenter);
    canvas.drawCircle(
      center,
      innerRadius,
      Paint()
        ..style = PaintingStyle.stroke
        ..color = borderHighlight
        ..strokeWidth = 1.5,
    );

    // Shuffle icon in center
    final shuffleStyle = TextStyle(
      fontSize: innerRadius * 0.95,
      color: textSecondary,
      fontFamily: 'MaterialIcons',
    );
    final shuffleTp = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(Icons.shuffle_rounded.codePoint),
        style: shuffleStyle,
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    shuffleTp.paint(
      canvas,
      Offset(center.dx - shuffleTp.width / 2, center.dy - shuffleTp.height / 2),
    );

    // Draw each letter with its permanent circle
    for (int visualPos = 0; visualPos < n; visualPos++) {
      final origIndex = displayOrder[visualPos];
      final angle = visualPos * (2 * pi / n) - pi / 2;
      final lx = center.dx + letterRadius * cos(angle);
      final ly = center.dy + letterRadius * sin(angle);
      final letterCenter = Offset(lx, ly);

      final isHighlighted = highlightedIndices.contains(origIndex);

      // Permanent circle background
      canvas.drawCircle(
        letterCenter,
        hitRadius,
        Paint()..color = isHighlighted ? accentGoldSubtle : rouletteBackground,
      );
      // Permanent circle border
      canvas.drawCircle(
        letterCenter,
        hitRadius,
        Paint()
          ..style = PaintingStyle.stroke
          ..color = isHighlighted ? accentGold.withAlpha(180) : borderHighlight
          ..strokeWidth = 1.5,
      );

      final letter = letters[origIndex];
      final textStyle = GoogleFonts.inter(
        fontSize: letterRadius * 0.28,
        fontWeight: FontWeight.w900,
        color: isHighlighted ? accentGold : rouletteLetter,
      );
      final tp = TextPainter(
        text: TextSpan(text: letter, style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(lx - tp.width / 2, ly - tp.height / 2));
    }

    // Swipe trail
    if (trailPoints.isNotEmpty) {
      final trailPaint = Paint()
        ..color = accentGold.withAlpha(180)
        ..strokeWidth = 3.5
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..style = PaintingStyle.stroke;

      final fullPoints = [...trailPoints];
      if (fingerPos != null) fullPoints.add(fingerPos!);

      if (fullPoints.length >= 2) {
        final path = Path()..moveTo(fullPoints[0].dx, fullPoints[0].dy);
        for (int i = 1; i < fullPoints.length; i++) {
          path.lineTo(fullPoints[i].dx, fullPoints[i].dy);
        }
        canvas.drawPath(path, trailPaint);
      }

      final dotPaint = Paint()
        ..color = accentGold
        ..style = PaintingStyle.fill;
      for (final pt in trailPoints) {
        canvas.drawCircle(pt, 4.5, dotPaint);
      }

      if (fingerPos != null) {
        canvas.drawCircle(
          fingerPos!,
          4,
          Paint()
            ..color = accentGoldLight.withAlpha(200)
            ..style = PaintingStyle.fill,
        );
        canvas.drawCircle(
          fingerPos!,
          4,
          Paint()
            ..color = accentGold
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.5,
        );
      }
    }
  }

  @override
  bool shouldRepaint(WheelPainter old) =>
      old.letters != letters ||
      old.displayOrder != displayOrder ||
      old.selectedIndices != selectedIndices ||
      old.highlightedIndices != highlightedIndices ||
      old.trailPoints != trailPoints ||
      old.fingerPos != fingerPos;
}
