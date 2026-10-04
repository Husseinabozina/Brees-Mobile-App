import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_status_bar.dart';
import '../../../../core/widgets/design_canvas.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key, required this.onFinished});

  final VoidCallback onFinished;

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _logoScale;
  late final Animation<double> _logoOpacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1050),
    )..forward();
    _logoScale = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
    _logoOpacity = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    Future<void>.delayed(const Duration(milliseconds: 1650), () {
      if (mounted) widget.onFinished();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: BreesColors.primary,
      child: ColoredBox(
        color: BreesColors.primary,
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              child: BreesStatusBar(
                foreground: Colors.white,
                assetPath: 'assets/images/status_white.png',
              ),
            ),
            Positioned(
              left: 109,
              top: 343,
              width: 157,
              height: 136,
              child: ScaleTransition(
                scale: _logoScale,
                child: FadeTransition(
                  opacity: _logoOpacity,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 114,
                        width: 136,
                        height: 136,
                        child: Image.asset(
                          'assets/images/launch_glow.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Brees',
                          key: Key('launch-logo'),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 56,
                            fontWeight: FontWeight.w700,
                            height: 68 / 56,
                          ),
                        ),
                      ),
                    ],
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
                  color: Colors.white,
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
