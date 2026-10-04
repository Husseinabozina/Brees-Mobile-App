import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_button.dart';
import 'onboarding_indicator.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({
    super.key,
    required this.title,
    required this.description,
    required this.index,
    required this.buttonLabel,
    required this.onPressed,
  });

  final String title;
  final String description;
  final int index;
  final String buttonLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 349,
      padding: const EdgeInsets.fromLTRB(24, 36, 24, 36),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(48),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3D000000),
            blurRadius: 24,
            spreadRadius: -8,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 137,
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: BreesColors.navy,
                    fontSize: 24,
                    height: 1.2,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
                const Spacer(),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: BreesColors.navy.withValues(alpha: 0.8),
                    fontSize: 14,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          OnboardingIndicator(index: index),
          const SizedBox(height: 32),
          BreesButton(label: buttonLabel, onPressed: onPressed),
        ],
      ),
    );
  }
}
