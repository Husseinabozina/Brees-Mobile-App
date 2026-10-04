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
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            width: 287,
            height: 58,
            child: _ScaleDownText(
              title,
              style: const TextStyle(
                color: BreesColors.navy,
                fontSize: 24,
                height: 1.2,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 74,
            width: 287,
            height: 63,
            child: _ScaleDownText(
              description,
              style: TextStyle(
                color: BreesColors.navy.withValues(alpha: 0.8),
                fontSize: 14,
                height: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 123.5,
            top: 161,
            child: OnboardingIndicator(index: index),
          ),
          Positioned(
            left: 40,
            top: 215,
            child: BreesButton(label: buttonLabel, onPressed: onPressed),
          ),
        ],
      ),
    );
  }
}

class _ScaleDownText extends StatelessWidget {
  const _ScaleDownText(this.text, {required this.style});

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.center,
      child: SizedBox(
        width: 287,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: style,
        ),
      ),
    );
  }
}
