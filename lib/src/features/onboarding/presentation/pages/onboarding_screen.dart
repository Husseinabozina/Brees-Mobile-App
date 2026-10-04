import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_status_bar.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../widgets/onboarding_card.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, required this.onCompleted});

  final VoidCallback onCompleted;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _index = 0;

  static const _pages = [
    (
      title: 'You ought to know where\nyour money goes',
      description:
          'Get an overview of how you are\nperforming and motivate yourself to\nachieve even more.',
      asset: 'assets/images/onboarding_overview.png',
      left: -7.0,
      top: 74.0,
      width: 346.315,
      height: 327.052,
    ),
    (
      title: 'Gain total\ncontrol of your money',
      description:
          'Track your transaction easily, with\ncategories and financial report',
      asset: 'assets/images/onboarding_control.png',
      left: 46.0,
      top: 108.0,
      width: 276.792,
      height: 283.448,
    ),
    (
      title: 'Plan ahead and manage\nyour money better',
      description:
          'Setup your budget for each category\nso you in control. Track categories you\nspend the most money on',
      asset: 'assets/images/onboarding_budget.png',
      left: 1.0,
      top: 97.0,
      width: 373.478,
      height: 324.0,
    ),
  ];

  void _next() {
    if (_index == _pages.length - 1) {
      widget.onCompleted();
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 520),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: BreesColors.onboarding,
      child: Stack(
        children: [
          PageView.builder(
            key: const Key('onboarding-page-view'),
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (value) => setState(() => _index = value),
            itemBuilder: (context, index) {
              final page = _pages[index];
              return ColoredBox(
                color: BreesColors.onboarding,
                child: TweenAnimationBuilder<double>(
                  key: ValueKey(index),
                  tween: Tween(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 650),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, child) {
                    return Stack(
                      children: [
                        Positioned(
                          left: page.left,
                          top: page.top - (1 - value) * 18,
                          width: page.width,
                          height: page.height,
                          child: Opacity(
                            opacity: value,
                            child: Transform.scale(
                              scale: 0.94 + value * 0.06,
                              child: Image.asset(
                                page.asset,
                                fit: BoxFit.contain,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: 443 + (1 - value) * 24,
                          child: Opacity(
                            opacity: value,
                            child: OnboardingCard(
                              title: page.title,
                              description: page.description,
                              index: index,
                              buttonLabel:
                                  index == 2 ? 'Get Started' : 'Next',
                              onPressed: _next,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
          const Positioned(
            top: 0,
            child: BreesStatusBar(
              foreground: Colors.white,
              assetPath: 'assets/images/status_white.png',
            ),
          ),
          Positioned(
            right: 20,
            top: 64,
            child: GestureDetector(
              key: const Key('onboarding-skip'),
              onTap: widget.onCompleted,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
