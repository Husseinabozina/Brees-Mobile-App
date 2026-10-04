import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_button.dart';
import '../../../../core/widgets/brees_status_bar.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../../../../core/widgets/home_indicator.dart';

class EmailNoticeScreen extends StatefulWidget {
  const EmailNoticeScreen({
    super.key,
    required this.title,
    required this.body,
    required this.buttonLabel,
    required this.onPressed,
  });

  final String title;
  final String body;
  final String buttonLabel;
  final VoidCallback onPressed;

  @override
  State<EmailNoticeScreen> createState() => _EmailNoticeScreenState();
}

class _EmailNoticeScreenState extends State<EmailNoticeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    )..forward();
    _scale = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
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
              left: 64,
              top: 115,
              width: 248,
              height: 256,
              child: ScaleTransition(
                scale: _scale,
                child: Image.asset(
                  'assets/images/email_envelope.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              left: 24,
              top: 415,
              width: 328,
              child: Column(
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: BreesColors.heading,
                      fontSize: 24,
                      height: 1.2,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 280,
                    child: Text(
                      widget.body,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: BreesColors.body,
                        fontSize: 14,
                        height: 22 / 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              top: 700,
              child: BreesButton(
                label: widget.buttonLabel,
                width: 335,
                onPressed: widget.onPressed,
              ),
            ),
            const HomeIndicator(),
          ],
        ),
      ),
    );
  }
}
