import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_button.dart';
import '../../../../core/widgets/brees_status_bar.dart';
import '../../../../core/widgets/design_canvas.dart';

class SignUpSuccessScreen extends StatefulWidget {
  const SignUpSuccessScreen({super.key, required this.onContinue});

  final VoidCallback onContinue;

  @override
  State<SignUpSuccessScreen> createState() => _SignUpSuccessScreenState();
}

class _SignUpSuccessScreenState extends State<SignUpSuccessScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _checkScale;
  late final Animation<double> _contentOpacity;
  late final Animation<Offset> _buttonOffset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 950),
    )..forward();

    _checkScale = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.68, curve: Curves.elasticOut),
    );
    _contentOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.35, 0.85, curve: Curves.easeOut),
    );
    _buttonOffset = Tween(
      begin: const Offset(0, 0.35),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.55, 1, curve: Curves.easeOutCubic),
      ),
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
              left: 84,
              top: 228,
              width: 208,
              height: 243,
              child: Column(
                children: [
                  ScaleTransition(
                    scale: _checkScale,
                    child: Image.asset(
                      'assets/images/success_check.png',
                      width: 123,
                      height: 123,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 56),
                  FadeTransition(
                    opacity: _contentOpacity,
                    child: const Text.rich(
                      TextSpan(
                        style: TextStyle(
                          color: BreesColors.heading,
                          fontSize: 24,
                          height: 32 / 24,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(text: 'Hi! '),
                          TextSpan(
                            text: 'John',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(text: '\nWelcome to Brees'),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              top: 700,
              child: SlideTransition(
                position: _buttonOffset,
                child: FadeTransition(
                  opacity: _contentOpacity,
                  child: BreesButton(
                    key: const Key('success-continue'),
                    label: 'Let’s get started',
                    width: 335,
                    onPressed: widget.onContinue,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 121,
              bottom: 8,
              width: 134,
              height: 5,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: BreesColors.ink,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
