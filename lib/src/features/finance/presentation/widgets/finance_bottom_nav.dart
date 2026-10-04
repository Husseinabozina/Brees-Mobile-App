import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';

enum FinanceTab { home, budget, insights, profile }

class FinanceBottomNav extends StatelessWidget {
  const FinanceBottomNav({
    super.key,
    required this.activeTab,
    required this.onHome,
    required this.onBudget,
    required this.onInsights,
    required this.onProfile,
    this.light = false,
  });

  final FinanceTab activeTab;
  final VoidCallback onHome;
  final VoidCallback onBudget;
  final VoidCallback onInsights;
  final VoidCallback onProfile;
  final bool light;

  @override
  Widget build(BuildContext context) {
    final background = light ? Colors.white : BreesColors.primary;
    final inactive = light ? BreesColors.primary : const Color(0xFFD5D0FB);
    final active = light ? BreesColors.primary : Colors.white;

    Widget item({
      required FinanceTab tab,
      required IconData icon,
      required VoidCallback onTap,
    }) {
      return SizedBox(
        width: 93.75,
        height: 56,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: Icon(
              icon,
              size: 26,
              color: activeTab == tab ? active : inactive,
            ),
          ),
        ),
      );
    }

    return ColoredBox(
      color: background,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 7,
            child: Row(
              children: [
                item(tab: FinanceTab.home, icon: Icons.home_rounded, onTap: onHome),
                item(tab: FinanceTab.budget, icon: Icons.pie_chart_rounded, onTap: onBudget),
                item(tab: FinanceTab.insights, icon: Icons.bar_chart_rounded, onTap: onInsights),
                item(tab: FinanceTab.profile, icon: Icons.person_outline_rounded, onTap: onProfile),
              ],
            ),
          ),
          Positioned(
            left: 120,
            bottom: 8,
            width: 135,
            height: 5,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: light ? const Color(0xFF353535) : const Color(0xFFD5D0FB),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
