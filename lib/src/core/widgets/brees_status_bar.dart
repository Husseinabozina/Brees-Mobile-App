import 'package:flutter/material.dart';

class BreesStatusBar extends StatelessWidget {
  const BreesStatusBar({
    super.key,
    required this.foreground,
    required this.assetPath,
  });

  final Color foreground;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: 375,
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 14,
            width: 54,
            child: Text(
              '9:41',
              style: TextStyle(
                color: foreground,
                fontSize: 15,
                height: 18 / 15,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.165,
              ),
            ),
          ),
          Positioned(
            right: 15,
            top: 16,
            width: 67,
            height: 12,
            child: Image.asset(
              assetPath,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          ),
        ],
      ),
    );
  }
}
