import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_button.dart';
import '../../../../core/widgets/brees_status_bar.dart';
import '../../../../core/widgets/brees_top_nav.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../../../../core/widgets/home_indicator.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({
    super.key,
    required this.onBack,
    required this.onContinue,
  });

  final VoidCallback onBack;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: BreesColors.canvas,
      child: ColoredBox(
        color: BreesColors.canvas,
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              child: BreesStatusBar(
                foreground: Color(0xFF161719),
                assetPath: 'assets/images/status_dark.png',
              ),
            ),
            BreesTopNav(title: 'Forgot Password', onBack: onBack),
            const Positioned(
              left: 20,
              top: 120,
              width: 343,
              child: Text(
                'Enter your email and we’ll\nsend you a link to reset your\npassword.',
                style: TextStyle(
                  color: BreesColors.heading,
                  fontSize: 24,
                  height: 31 / 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 245,
              child: Container(
                width: 335,
                height: 61,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Stack(
                  children: [
                    Positioned(
                      left: 20,
                      top: 11,
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: BreesColors.muted,
                          fontSize: 10,
                          height: 12 / 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 31,
                      child: Text(
                        'Louis04real@gmail.com',
                        style: TextStyle(
                          color: Color(0xFF040C22),
                          fontSize: 14,
                          height: 17 / 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 700,
              child: BreesButton(
                label: 'Continue',
                width: 335,
                onPressed: onContinue,
              ),
            ),
            const HomeIndicator(),
          ],
        ),
      ),
    );
  }
}
