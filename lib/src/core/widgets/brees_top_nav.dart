import 'package:flutter/material.dart';

import '../theme/brees_colors.dart';

class BreesTopNav extends StatelessWidget {
  const BreesTopNav({
    super.key,
    required this.title,
    required this.onBack,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 44,
      width: 375,
      height: 52,
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: BreesColors.ink.withValues(
                      alpha: subtitle == null ? 1 : 0.75,
                    ),
                    fontSize: subtitle == null ? 16 : 14,
                    fontWeight:
                        subtitle == null ? FontWeight.w500 : FontWeight.w600,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: const TextStyle(
                      color: BreesColors.ink,
                      fontSize: 12,
                      height: 1.2,
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            left: 16,
            top: 4,
            child: GestureDetector(
              onTap: onBack,
              child: Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.chevron_left_rounded,
                  color: BreesColors.ink,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
