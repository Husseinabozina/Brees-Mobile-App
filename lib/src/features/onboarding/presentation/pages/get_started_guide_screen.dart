import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_status_bar.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../../../../core/widgets/home_indicator.dart';

class GetStartedGuideScreen extends StatefulWidget {
  const GetStartedGuideScreen({
    super.key,
    required this.onEmail,
    required this.onAccount,
    required this.includeSecurity,
  });

  final VoidCallback onEmail;
  final VoidCallback onAccount;
  final bool includeSecurity;

  @override
  State<GetStartedGuideScreen> createState() => _GetStartedGuideScreenState();
}

class _GetStartedGuideScreenState extends State<GetStartedGuideScreen> {
  double _reveal = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _reveal = 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = <_GuideItem>[
      _GuideItem(
        title: 'Verify your email address',
        asset: 'assets/images/guide_email.png',
        onTap: widget.onEmail,
      ),
      _GuideItem(
        title: 'Connect your bank account',
        asset: 'assets/images/guide_bank.png',
        onTap: widget.onAccount,
      ),
      if (widget.includeSecurity)
        const _GuideItem(
          title: 'Setup a security pin',
          asset: 'assets/images/guide_lock.png',
        ),
      const _GuideItem(
        title: 'Tell us more about you',
        asset: 'assets/images/guide_user.png',
      ),
    ];

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
            const Positioned(
              left: 20,
              top: 79,
              child: Text(
                'Get started',
                style: TextStyle(
                  color: Color(0xFFEAE7FD),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Positioned(
              left: 20,
              top: 114,
              child: Text(
                'Get most out of your Brees account',
                style: TextStyle(
                  color: Color(0xFFEAE7FD),
                  fontSize: 12,
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 64,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 172,
              width: 335,
              height: widget.includeSecurity ? 568 : 420,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 24),
                itemBuilder: (context, index) {
                  final item = items[index];
                  final delay = index * 0.08;
                  final opacity =
                      ((_reveal - delay) / (1 - delay)).clamp(0.0, 1.0).toDouble();
                  return Opacity(
                    opacity: opacity,
                    child: Transform.translate(
                      offset: Offset(0, 14 * (1 - opacity)),
                      child: _GuideCard(item: item),
                    ),
                  );
                },
              ),
            ),
            const HomeIndicator(color: Color(0xFFD5D0FB)),
          ],
        ),
      ),
    );
  }
}

class _GuideItem {
  const _GuideItem({
    required this.title,
    required this.asset,
    this.onTap,
  });

  final String title;
  final String asset;
  final VoidCallback? onTap;
}

class _GuideCard extends StatelessWidget {
  const _GuideCard({required this.item});

  final _GuideItem item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        width: 335,
        height: 124,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: const Color(0xFF432DEC),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 12,
              top: 31,
              width: 195,
              child: Text(
                item.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 18 / 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Positioned(
              left: 12,
              top: 57,
              width: 198,
              child: Text(
                'This is the bank account we would track and manage your spendings',
                style: TextStyle(
                  color: Color(0xE6FFFFFF),
                  fontSize: 12,
                  height: 18 / 12,
                ),
              ),
            ),
            Positioned(
              right: -20,
              top: item.asset.contains('user') ? 10 : 4,
              width: 143,
              height: 143,
              child: Image.asset(
                item.asset,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
