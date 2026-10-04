import 'package:flutter/material.dart';

class DesignCanvas extends StatelessWidget {
  const DesignCanvas({
    super.key,
    required this.child,
    this.background = Colors.transparent,
  });

  static const referenceSize = Size(375, 812);

  final Widget child;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: background,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(
            key: const Key('brees-design-canvas'),
            width: referenceSize.width,
            height: referenceSize.height,
            child: child,
          ),
        ),
      ),
    );
  }
}
