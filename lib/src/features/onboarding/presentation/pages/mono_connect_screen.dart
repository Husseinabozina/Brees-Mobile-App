import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_status_bar.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../../../../core/widgets/home_indicator.dart';

class MonoConnectScreen extends StatefulWidget {
  const MonoConnectScreen({super.key, required this.onFinished});

  final VoidCallback onFinished;

  @override
  State<MonoConnectScreen> createState() => _MonoConnectScreenState();
}

class _MonoConnectScreenState extends State<MonoConnectScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 1200), widget.onFinished);
  }

  @override
  void dispose() {
    _timer?.cancel();
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
            const Center(
              child: Text(
                'Mono API',
                style: TextStyle(
                  color: BreesColors.navy,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            const HomeIndicator(),
          ],
        ),
      ),
    );
  }
}
