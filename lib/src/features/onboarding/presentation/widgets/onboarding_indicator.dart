import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';

class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 22,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(4, (dot) {
          final active = dot == index;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 260),
            curve: Curves.easeOutCubic,
            width: 6,
            height: active ? 18 : 6,
            decoration: BoxDecoration(
              color: active ? BreesColors.primary : const Color(0xFFBBBBBB),
              borderRadius: BorderRadius.circular(56),
            ),
          );
        }),
      ),
    );
  }
}
