import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_status_bar.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../../domain/entities/finance_snapshot.dart';
import '../widgets/finance_bottom_nav.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({
    super.key,
    required this.snapshot,
    required this.extended,
    required this.onOpenExtended,
    required this.onOpenAccounts,
    required this.onSortTransactions,
    required this.onNotifications,
    required this.onSearch,
    required this.onTransactions,
    required this.onBudget,
    required this.onInsights,
    required this.onProfile,
  });

  final FinanceSnapshot snapshot;
  final bool extended;
  final VoidCallback onOpenExtended;
  final VoidCallback onOpenAccounts;
  final VoidCallback onSortTransactions;
  final VoidCallback onNotifications;
  final VoidCallback onSearch;
  final VoidCallback onTransactions;
  final VoidCallback onBudget;
  final VoidCallback onInsights;
  final VoidCallback onProfile;

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: BreesColors.primary,
      child: ColoredBox(
        color: BreesColors.primary,
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 82,
              child: SingleChildScrollView(
                physics: extended
                    ? const BouncingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                child: SizedBox(
                  width: 375,
                  height: extended ? 1160 : 730,
                  child: _DashboardContent(
                    snapshot: snapshot,
                    extended: extended,
                    onOpenExtended: onOpenExtended,
                    onOpenAccounts: onOpenAccounts,
                    onSortTransactions: onSortTransactions,
                    onNotifications: onNotifications,
                    onSearch: onSearch,
                    onTransactions: onTransactions,
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
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 82,
              child: FinanceBottomNav(
                activeTab: FinanceTab.home,
                onHome: extended ? onOpenExtended : () {},
                onBudget: onBudget,
                onInsights: onInsights,
                onProfile: onProfile,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent({
    required this.snapshot,
    required this.extended,
    required this.onOpenExtended,
    required this.onOpenAccounts,
    required this.onSortTransactions,
    required this.onNotifications,
    required this.onSearch,
    required this.onTransactions,
  });

  final FinanceSnapshot snapshot;
  final bool extended;
  final VoidCallback onOpenExtended;
  final VoidCallback onOpenAccounts;
  final VoidCallback onSortTransactions;
  final VoidCallback onNotifications;
  final VoidCallback onSearch;
  final VoidCallback onTransactions;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          left: 20,
          top: 74,
          child: Text.rich(
            TextSpan(
              style: TextStyle(color: Colors.white, fontSize: 16),
              children: [
                TextSpan(text: 'Hello '),
                TextSpan(text: 'John', style: TextStyle(fontWeight: FontWeight.w700)),
                TextSpan(text: '\n'),
                TextSpan(
                  text: 'Your finances are looking good',
                  style: TextStyle(fontSize: 12, color: Color(0xFFDCD8FF)),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 65,
          top: 73,
          child: _CircleIcon(
            icon: Icons.notifications_none_rounded,
            onTap: onNotifications,
            key: const Key('home-notifications'),
          ),
        ),
        Positioned(
          right: 20,
          top: 73,
          child: _CircleIcon(
            icon: Icons.search_rounded,
            onTap: onSearch,
            key: const Key('home-search'),
          ),
        ),
        Positioned(
          left: 20,
          top: 140,
          width: 335,
          height: 335,
          child: GestureDetector(
            onTap: onOpenAccounts,
            behavior: HitTestBehavior.opaque,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF371FC4),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 22,
                    top: 20,
                    child: Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.white.withValues(alpha: 0.55),
                    ),
                  ),
                  Positioned(
                    left: 141,
                    top: 25,
                    width: 52,
                    height: 52,
                    child: Image.asset('assets/images/home_avatar.png'),
                  ),
                  const Positioned(
                    left: 0,
                    right: 0,
                    top: 90,
                    child: Column(
                      children: [
                        Text('Your available balance is', style: TextStyle(color: Color(0xFFDCD8FF), fontSize: 12)),
                        SizedBox(height: 6),
                        Text('N20,983', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w800)),
                        SizedBox(height: 12),
                        Text(
                          'By this time last month, you spent\nslightly higher (N22,719)',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(left: 20, right: 20, top: 230, child: _BalanceRow(name: 'Kuda bank', amount: 'N12,000.00')),
                  const Positioned(left: 20, right: 20, top: 263, child: _BalanceRow(name: 'GT Bank', amount: 'N950.00')),
                  const Positioned(left: 20, right: 20, top: 296, child: _BalanceRow(name: 'PiggyVest', amount: 'N1,050.00')),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 492,
          width: 335,
          height: 89,
          child: GestureDetector(
            key: const Key('home-sort-transactions'),
            onTap: onSortTransactions,
            behavior: HitTestBehavior.opaque,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF321EB2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Stack(
                children: [
                  Positioned(left: 16, top: 25, child: _SortIcon()),
                  Positioned(left: 80, top: 20, child: Text('Sort your transactions', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700))),
                  Positioned(left: 80, top: 43, child: Text('Get points for sorting your\ntransactions', style: TextStyle(color: Color(0xFFDCD8FF), fontSize: 12, height: 1.35))),
                  Positioned(right: 16, top: 32, child: Icon(Icons.chevron_right_rounded, color: Color(0xFFB7ACFF))),
                ],
              ),
            ),
          ),
        ),
        const Positioned(
          left: 20,
          top: 617,
          child: Text('My Budgets', style: TextStyle(color: Color(0xFFDCD8FF), fontSize: 14)),
        ),
        Positioned(
          left: 20,
          top: 650,
          width: 335,
          height: extended ? 194 : 108,
          child: GestureDetector(
            key: const Key('home-open-extended'),
            onTap: onOpenExtended,
            behavior: HitTestBehavior.opaque,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF4933E9),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  const Positioned(left: 16, top: 16, child: Text('You have', style: TextStyle(color: Colors.white, fontSize: 12))),
                  const Positioned(
                    right: 16,
                    top: 15,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Color(0xFF321EB2),
                      child: Icon(Icons.chevron_right_rounded, size: 18, color: Color(0xFFB7ACFF)),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 42,
                    child: Text(snapshot.budgetLabel, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
                  ),
                  if (extended) ...[
                    const Positioned(left: 16, top: 76, child: Text('Left out of N80,888 budgeted', style: TextStyle(color: Color(0xFFDCD8FF), fontSize: 11))),
                    const Positioned(
                      left: 16,
                      right: 16,
                      top: 112,
                      child: LinearProgressIndicator(
                        value: 0.76,
                        minHeight: 4,
                        backgroundColor: Color(0xFF6B5AF0),
                        valueColor: AlwaysStoppedAnimation(Color(0xFF54E889)),
                      ),
                    ),
                    const Positioned(left: 16, top: 146, child: Text('😱  Sapa go soon catch you bros, calm down!!', style: TextStyle(color: Colors.white, fontSize: 10))),
                  ],
                ],
              ),
            ),
          ),
        ),
        if (extended) ...[
          const Positioned(left: 20, top: 878, child: Text('Transactions', style: TextStyle(color: Color(0xFFDCD8FF), fontSize: 14))),
          Positioned(
            left: 20,
            top: 911,
            width: 335,
            height: 188,
            child: GestureDetector(
              key: const Key('home-open-transactions'),
              onTap: onTransactions,
              behavior: HitTestBehavior.opaque,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF4933E9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    const Positioned(left: 16, top: 16, child: Text('Recent Transactions', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600))),
                    const Positioned(
                      right: 16,
                      top: 14,
                      child: CircleAvatar(
                        radius: 9,
                        backgroundColor: Color(0xFF321EB2),
                        child: Icon(Icons.chevron_right_rounded, color: Color(0xFFB7ACFF), size: 16),
                      ),
                    ),
                    ...List.generate(snapshot.transactions.take(3).length, (index) {
                      final t = snapshot.transactions[index];
                      return Positioned(
                        left: 16,
                        right: 16,
                        top: 47 + index * 45.0,
                        height: 38,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: const Color(0xFFF4F7FF),
                              child: Text(t.initial, style: const TextStyle(color: BreesColors.primary)),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Stack(
                                children: [
                                  Positioned(left: 0, top: 0, right: 0, child: Text(t.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontSize: 12))),
                                  Positioned(left: 0, bottom: 0, right: 0, child: Text(t.subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFFC7C0FF), fontSize: 10))),
                                ],
                              ),
                            ),
                            Text(t.amountLabel, style: TextStyle(color: t.isIncome ? const Color(0xFF25F58B) : Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _CircleIcon extends StatelessWidget {
  const _CircleIcon({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: const Color(0xFF321EB2),
        child: Icon(icon, color: const Color(0xFFB7ACFF), size: 20),
      ),
    );
  }
}

class _BalanceRow extends StatelessWidget {
  const _BalanceRow({required this.name, required this.amount});

  final String name;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(name, style: const TextStyle(color: Colors.white, fontSize: 12)),
        const Spacer(),
        Text(amount, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

class _SortIcon extends StatelessWidget {
  const _SortIcon();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 38,
          height: 38,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: const Color(0xFF6852FF), borderRadius: BorderRadius.circular(10)),
          child: const Icon(Icons.settings_suggest_outlined, color: Colors.white, size: 22),
        ),
        const Positioned(right: -5, top: -5, child: CircleAvatar(radius: 6, backgroundColor: Color(0xFFFFAE4A))),
      ],
    );
  }
}
