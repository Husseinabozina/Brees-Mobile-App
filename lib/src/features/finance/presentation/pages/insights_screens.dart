import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_status_bar.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../../../../core/widgets/home_indicator.dart';
import '../widgets/finance_bottom_nav.dart';

class InsightIntroScreen extends StatelessWidget {
  const InsightIntroScreen({
    super.key,
    required this.onClose,
    required this.onViewInsights,
    this.background,
  });

  final VoidCallback onClose;
  final VoidCallback onViewInsights;
  final Widget? background;

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: const Color(0xFF706C87),
      child: Stack(
        children: [
          if (background != null)
            Positioned.fill(
              child: IgnorePointer(child: background!),
            )
          else
            const ColoredBox(color: Color(0xFF8B879B)),
          Positioned.fill(
            child: ColoredBox(color: Colors.black.withValues(alpha: .44)),
          ),
          Positioned(
            left: 23,
            top: 129,
            width: 328,
            height: 527,
            child: Container(
              decoration: BoxDecoration(
                color: BreesColors.primary,
                borderRadius: BorderRadius.circular(26),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 30,
                    offset: Offset(0, 18),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 18,
                    top: 20,
                    child: GestureDetector(
                      onTap: onClose,
                      child: const CircleAvatar(
                        radius: 12,
                        backgroundColor: Color(0xFFD3CDFF),
                        child: Icon(
                          Icons.close_rounded,
                          color: BreesColors.primary,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 49,
                    top: 25,
                    width: 230,
                    height: 157,
                    child: Image.asset(
                      'assets/images/insight_intro.png',
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  const Positioned(
                    left: 20,
                    right: 20,
                    top: 260,
                    child: Column(
                      children: [
                        Text(
                          'Insights',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Get your insights',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'If you are interested in investing, but\nhas no idea where to start, if you are\ninterested in investing, but has no idea\nwhere to start!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            height: 22 / 14,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _Dot(active: true),
                            _Dot(),
                            _Dot(),
                            _Dot(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 448,
                    width: 280,
                    height: 56,
                    child: FilledButton(
                      onPressed: onViewInsights,
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: BreesColors.primary,
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        'View Insights',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({this.active = false});
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: active ? Colors.white : Colors.white.withValues(alpha: .35),
        shape: BoxShape.circle,
      ),
    );
  }
}

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({
    super.key,
    required this.onHome,
    required this.onBudget,
    required this.onProfile,
    required this.onOpenReport,
  });

  final VoidCallback onHome;
  final VoidCallback onBudget;
  final VoidCallback onProfile;
  final VoidCallback onOpenReport;

  static const updates = [
    ('Brees', 'assets/images/insight_brees.png'),
    ('Paystack', 'assets/images/insight_paystack.png'),
    ('Piggyvest', 'assets/images/insight_piggyvest.png'),
  ];

  static const viewed = [
    ('Carbon', 'assets/images/insight_carbon.png'),
    ('Abeg', 'assets/images/insight_abeg.png'),
    ('Patricia', 'assets/images/insight_patricia.png'),
  ];

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
            const Positioned(
              left: 0,
              right: 0,
              top: 58,
              child: Text(
                'Insights',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 107,
              width: 335,
              height: 76,
              child: GestureDetector(
                onTap: onOpenReport,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF2918A9),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      const Positioned(
                        left: 28,
                        top: 17,
                        child: CircleAvatar(
                          radius: 21,
                          backgroundColor: Color(0xFF5A8DFF),
                          child: Icon(
                            Icons.pie_chart_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 78,
                        top: 18,
                        child: Text(
                          'Insight',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 78,
                        top: 43,
                        child: Text(
                          'Balance Trend',
                          style: TextStyle(
                            color: Color(0xFFD2CDFF),
                            fontSize: 11,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 177,
                        top: 22,
                        width: 1,
                        height: 34,
                        child: ColoredBox(
                          color: Colors.white.withValues(alpha: .16),
                        ),
                      ),
                      const Positioned(
                        left: 200,
                        top: 18,
                        child: Text(
                          'N98,432.65',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 200,
                        top: 43,
                        child: Text(
                          '+4.3% vs last week',
                          style: TextStyle(
                            color: Color(0xFFC7C1FF),
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 202,
              width: 375,
              height: 610,
              child: Container(
                decoration: const BoxDecoration(
                  color: BreesColors.canvas,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Stack(
                  children: [
                    const Positioned(
                      left: 24,
                      top: 31,
                      child: Text(
                        'Recent updates',
                        style: TextStyle(
                          color: BreesColors.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 24,
                      top: 65,
                      width: 327,
                      child: Column(
                        children: [
                          ...updates.asMap().entries.map(
                                (entry) => _InsightUpdateRow(
                                  name: entry.value.$1,
                                  asset: entry.value.$2,
                                  subtitle: entry.key == 0
                                      ? 'Click to view your insights'
                                      : null,
                                  onTap: entry.key == 0 ? onOpenReport : null,
                                ),
                              ),
                          const SizedBox(height: 20),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Viewed updates',
                              style: TextStyle(
                                color: BreesColors.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          ...viewed.map(
                            (item) => _InsightUpdateRow(
                              name: item.$1,
                              asset: item.$2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 82,
              child: FinanceBottomNav(
                activeTab: FinanceTab.insights,
                light: true,
                onHome: onHome,
                onBudget: onBudget,
                onInsights: () {},
                onProfile: onProfile,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InsightUpdateRow extends StatelessWidget {
  const _InsightUpdateRow({
    required this.name,
    required this.asset,
    this.subtitle,
    this.onTap,
  });

  final String name;
  final String asset;
  final String? subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 64,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 8,
              width: 48,
              height: 48,
              child: ClipOval(
                child: Image.asset(asset, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              left: 64,
              top: subtitle == null ? 21 : 11,
              child: Row(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Color(0xFF170B68),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.verified_rounded,
                    color: BreesColors.primary,
                    size: 13,
                  ),
                ],
              ),
            ),
            if (subtitle != null)
              Positioned(
                left: 64,
                top: 36,
                child: Text(
                  subtitle!,
                  style: const TextStyle(
                    color: Color(0xFF8F7AE8),
                    fontSize: 10,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

enum FinancialReportKind { expense, income, budget, quote }

class FinancialReportScreen extends StatelessWidget {
  const FinancialReportScreen({
    super.key,
    required this.kind,
    required this.onNext,
  });

  final FinancialReportKind kind;
  final VoidCallback onNext;

  Color get background => switch (kind) {
        FinancialReportKind.expense => const Color(0xFFFF3D4C),
        FinancialReportKind.income => const Color(0xFF00AD72),
        FinancialReportKind.budget => const Color(0xFF7F3DFF),
        FinancialReportKind.quote => BreesColors.primary,
      };

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: background,
      child: GestureDetector(
        onTap: onNext,
        behavior: HitTestBehavior.opaque,
        child: ColoredBox(
          color: background,
          child: Stack(
            children: [
              Positioned(
                left: 13,
                right: 13,
                top: 59,
                height: 4,
                child: Row(
                  children: List.generate(
                    4,
                    (index) => Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: index == 3 ? 0 : 4),
                        decoration: BoxDecoration(
                          color: _segmentActive(index)
                              ? Colors.white
                              : Colors.white.withValues(alpha: .28),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 0,
                child: BreesStatusBar(
                  foreground: Colors.white,
                  assetPath: 'assets/images/status_white.png',
                ),
              ),
              if (kind != FinancialReportKind.quote) ...[
                const Positioned(
                  left: 0,
                  right: 0,
                  top: 105,
                  child: Text(
                    'This Month',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xBFFFFFFF),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ..._reportBody(),
              ] else ...[
                const Positioned(
                  left: 16,
                  right: 16,
                  top: 207,
                  child: Text(
                    '“Financial freedom is infact\nfreedom from fear”',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      height: 39 / 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Positioned(
                  left: 16,
                  top: 302,
                  child: Text(
                    '-Robert Kiyosaki',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
              const HomeIndicator(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  bool _segmentActive(int index) => switch (kind) {
        FinancialReportKind.expense => index == 0,
        FinancialReportKind.income => index == 1,
        FinancialReportKind.budget => index == 2,
        FinancialReportKind.quote => index == 3,
      };

  List<Widget> _reportBody() {
    if (kind == FinancialReportKind.expense) {
      return const [
        Positioned(
          left: 16,
          right: 16,
          top: 275,
          child: Column(
            children: [
              Text(
                'You Spend 💸',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 18),
              Text(
                'N332',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 64,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          top: 531,
          child: _ReportCard(
            title: 'Your biggest\nspending is from',
            icon: Icons.shopping_bag_rounded,
            iconColor: Color(0xFFFFA800),
            iconBackground: Color(0xFFFFF0D6),
            category: 'Shopping',
            amount: 'N120',
          ),
        ),
      ];
    }
    if (kind == FinancialReportKind.income) {
      return const [
        Positioned(
          left: 16,
          right: 16,
          top: 275,
          child: Column(
            children: [
              Text(
                'You Earned 💰',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 18),
              Text(
                'N6000',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 64,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          top: 531,
          child: _ReportCard(
            title: 'Your biggest\nIncome is from',
            icon: Icons.attach_money_rounded,
            iconColor: Color(0xFF00A86B),
            iconBackground: Color(0xFFCFFAEA),
            category: 'Salary',
            amount: 'N5,000',
          ),
        ),
      ];
    }

    return const [
      Positioned(
        left: 33,
        right: 33,
        top: 330,
        child: Text(
          '2 of 12 Budget is\nexceeds the limit',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            height: 39 / 32,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      Positioned(
        left: 41,
        top: 434,
        child: _BudgetReportTag(
          icon: Icons.shopping_bag_rounded,
          iconColor: Color(0xFFFFA800),
          iconBackground: Color(0xFFFFF0D6),
          label: 'Shopping',
        ),
      ),
      Positioned(
        right: 50,
        top: 434,
        child: _BudgetReportTag(
          icon: Icons.restaurant_rounded,
          iconColor: Color(0xFFFF4F5E),
          iconBackground: Color(0xFFFFD9DC),
          label: 'Food',
        ),
      ),
    ];
  }
}

class _ReportCard extends StatelessWidget {
  const _ReportCard({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.category,
    required this.amount,
  });

  final String title;
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String category;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 241,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            right: 20,
            top: 19,
            height: 70,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(
                width: 295,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF131313),
                    fontSize: 24,
                    height: 1.35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 84,
            right: 84,
            top: 108,
            height: 60,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFFCFCFC),
                border: Border.all(color: const Color(0xFFE3E5E5)),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: iconBackground,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(icon, color: iconColor, size: 20),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      category,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 190,
            height: 30,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                amount,
                style: const TextStyle(
                  color: Color(0xFF131313),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BudgetReportTag extends StatelessWidget {
  const _BudgetReportTag({
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.label,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE3E5E5)),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF131313),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
