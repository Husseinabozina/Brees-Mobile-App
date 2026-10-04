import 'package:flutter/material.dart';

import '../theme/brees_colors.dart';

class BreesButton extends StatefulWidget {
  const BreesButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width = 207,
    this.height = 62,
  });

  final String label;
  final VoidCallback onPressed;
  final double width;
  final double height;

  @override
  State<BreesButton> createState() => _BreesButtonState();
}

class _BreesButtonState extends State<BreesButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onPressed();
      },
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1,
        duration: const Duration(milliseconds: 110),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: widget.width,
          height: widget.height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: BreesColors.primary,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: BreesColors.primary.withValues(alpha: _pressed ? 0.08 : 0.15),
                blurRadius: _pressed ? 6 : 12,
                offset: Offset(0, _pressed ? 3 : 8),
              ),
            ],
          ),
          child: Text(
            widget.label,
            style: const TextStyle(
              color: Color(0xFFFCFCFC),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
