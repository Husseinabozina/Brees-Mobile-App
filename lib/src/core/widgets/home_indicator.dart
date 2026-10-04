import 'package:flutter/material.dart';

class HomeIndicator extends StatelessWidget {
  const HomeIndicator({super.key, this.color = const Color(0xFF131313)});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 121,
      bottom: 8,
      width: 134,
      height: 5,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
