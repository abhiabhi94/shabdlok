import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/grid_cell.dart';
import '../ui/colors.dart';

class GridCellWidget extends StatefulWidget {
  final GridCell? cell;
  final double size;

  const GridCellWidget({
    super.key,
    required this.cell,
    required this.size,
  });

  @override
  State<GridCellWidget> createState() => _GridCellWidgetState();
}

class _GridCellWidgetState extends State<GridCellWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _scale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.3), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 1.3, end: 1.0), weight: 60),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );
  }

  @override
  void didUpdateWidget(GridCellWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newState = widget.cell?.state;
    final oldState = oldWidget.cell?.state;

    if (newState == CellState.hinted && oldState != CellState.hinted) {
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cell == null) {
      return SizedBox(width: widget.size, height: widget.size);
    }

    final state = widget.cell!.state;
    final isLocked = state == CellState.locked;
    final isHinted = state == CellState.hinted;
    final isPreRevealed = state == CellState.preRevealed;
    final showLetter = isLocked || isHinted || isPreRevealed;

    Color bg;
    Color border;
    Color letterColor;

    if (isLocked) {
      bg = cellLocked;
      border = cellLockedBorder;
      letterColor = successGreen;
    } else if (isHinted) {
      bg = cellHinted;
      border = cellHintedBorder;
      letterColor = accentGold;
    } else if (isPreRevealed) {
      bg = cellBackground;
      border = borderHighlight;
      letterColor = textSecondary;
    } else {
      bg = cellBackground;
      border = cellBorderDefault;
      letterColor = textPrimary;
    }

    Widget cell = AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: border, width: 1.5),
        boxShadow: isLocked
            ? [BoxShadow(color: successGreen.withAlpha(60), blurRadius: 6, spreadRadius: 1)]
            : null,
      ),
      child: Center(
        child: showLetter
            ? Text(
                widget.cell!.letter,
                style: GoogleFonts.inter(
                  fontSize: widget.size * 0.48,
                  fontWeight: isPreRevealed ? FontWeight.w600 : FontWeight.w800,
                  color: letterColor,
                ),
              )
            : null,
      ),
    );

    if (isHinted) {
      cell = AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          // Only apply reveal animation while controller is running
          if (_controller.isAnimating || _controller.isCompleted) {
            return Transform.scale(
              scale: _scale.value,
              child: Opacity(
                opacity: _opacity.value.clamp(0.0, 1.0),
                child: child,
              ),
            );
          }
          return child!;
        },
        child: cell,
      );
    }

    return cell;
  }
}
