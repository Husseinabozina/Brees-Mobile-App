import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_button.dart';
import '../../../../core/widgets/brees_status_bar.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../../../../core/widgets/home_indicator.dart';

class SetupAccountIntroScreen extends StatefulWidget {
  const SetupAccountIntroScreen({super.key, required this.onContinue});

  final VoidCallback onContinue;

  @override
  State<SetupAccountIntroScreen> createState() => _SetupAccountIntroScreenState();
}

class _SetupAccountIntroScreenState extends State<SetupAccountIntroScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rocket;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat(reverse: true);
    _rocket = Tween(begin: -4.0, end: 6.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
            Positioned(
              left: 134.5,
              top: 150,
              width: 106,
              height: 220.4,
              child: AnimatedBuilder(
                animation: _rocket,
                builder: (_, child) => Transform.translate(
                  offset: Offset(0, _rocket.value),
                  child: child,
                ),
                child: Image.asset(
                  'assets/images/setup_rocket.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Positioned(
              left: 20,
              top: 440,
              width: 335,
              child: Column(
                children: [
                  Text(
                    'Let’s get your account set up!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: BreesColors.navy,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Account can be your bank, credit card or\nyour digital wallet.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: BreesColors.body,
                      fontSize: 14,
                      height: 22 / 14,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              top: 700,
              child: BreesButton(
                label: 'Let’s get started',
                width: 335,
                onPressed: widget.onContinue,
              ),
            ),
            const HomeIndicator(),
          ],
        ),
      ),
    );
  }
}
