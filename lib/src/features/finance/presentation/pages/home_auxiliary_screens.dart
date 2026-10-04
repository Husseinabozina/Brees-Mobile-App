import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_button.dart';
import '../../../../core/widgets/brees_status_bar.dart';
import '../../../../core/widgets/brees_top_nav.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../../../../core/widgets/home_indicator.dart';
import '../widgets/finance_bottom_nav.dart';

class TransactionsSortedScreen extends StatelessWidget {
  const TransactionsSortedScreen({
    super.key,
    required this.onContinue,
  });

  final VoidCallback onContinue;

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
              left: 0,
              top: 0,
              width: 375,
              height: 441,
              child: IgnorePointer(
                child: Image.asset(
                  'assets/images/sorted_confetti.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              left: 27,
              top: 176,
              width: 242,
              height: 145,
              child: Transform.rotate(
                angle: -0.248,
                child: const _SortedTransactionCard(),
              ),
            ),
            Positioned(
              left: 165,
              top: 218,
              width: 172,
              height: 180,
              child: Transform.rotate(
                angle: 0.239,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x14363B64),
                        blurRadius: 12,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 63,
                        top: 31,
                        width: 48,
                        height: 48,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFEADD),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/sorted_grocery.png',
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 0,
                        right: 0,
                        top: 103,
                        child: Text(
                          'Utilities',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF0E0646),
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 32,
              top: 461,
              width: 311,
              child: Column(
                children: [
                  Text(
                    'Great job!!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: BreesColors.primary,
                      fontSize: 24,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'You matched all 20 transactions,\nyou did great John!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xBF131313),
                      fontSize: 16,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              top: 706,
              child: BreesButton(
                label: 'Keep Swiping',
                width: 335,
                onPressed: onContinue,
              ),
            ),
            const HomeIndicator(),
          ],
        ),
      ),
    );
  }
}

class _SortedTransactionCard extends StatelessWidget {
  const _SortedTransactionCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: BreesColors.primary, width: .8),
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14363B64),
            blurRadius: 12,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: const Stack(
        children: [
          Positioned(
            left: 14,
            top: 14,
            child: Text(
              'Transaction Details',
              style: TextStyle(color: Color(0xFF5C616F), fontSize: 8),
            ),
          ),
          Positioned(
            left: 14,
            top: 37,
            child: CircleAvatar(
              radius: 13,
              backgroundColor: Color(0xFF4A287C),
              child: Text('K', style: TextStyle(color: Colors.white, fontSize: 10)),
            ),
          ),
          Positioned(
            left: 50,
            top: 35,
            child: Text(
              'Kuda Bank',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            left: 50,
            top: 51,
            child: Text('2175836514', style: TextStyle(fontSize: 7)),
          ),
          Positioned(
            right: 14,
            top: 35,
            child: Text(
              'N12,000.00',
              style: TextStyle(color: Colors.red, fontSize: 10),
            ),
          ),
          Positioned(
            right: 14,
            top: 51,
            child: Text('Sep 01 at 2:24 PM', style: TextStyle(fontSize: 7)),
          ),
          Positioned(
            left: 14,
            top: 78,
            child: Text(
              'Transaction Remark',
              style: TextStyle(color: Color(0xFF5C616F), fontSize: 7),
            ),
          ),
          Positioned(
            left: 14,
            right: 14,
            top: 92,
            child: Text(
              'Mc Loc Pos Prch-2134555666--Funds &\nElectronic T La Lang-',
              style: TextStyle(fontSize: 10, height: 1.35, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({
    super.key,
    required this.onBack,
  });

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final yesterday = const [
      _NotificationItem('Shopping budget has exceeds..', 'Your Utilities budget has exceeds....', '3:40 PM', Color(0xFFFFAD5B), Icons.event_note_rounded),
      _NotificationItem('Use TPLACE Promo Code', 'Use Promo Code for The’Place', 'Promo', Color(0xFF137646), Icons.local_offer_rounded),
      _NotificationItem('GetBrees Flex Friday Deal', '10:39 AM', 'Promo', Color(0xFFFFD4AA), Icons.local_offer_outlined),
      _NotificationItem('N250 added successfully to bud..', '6: 14 PM', 'Info', Color(0xFF096D47), Icons.credit_card_rounded),
    ];

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
            BreesTopNav(title: 'Notification', onBack: onBack),
            const Positioned(
              right: 16,
              top: 48,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(Icons.settings_outlined, size: 19),
              ),
            ),
            Positioned(
              left: 0,
              top: 104,
              width: 375,
              height: 708,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(20, 32, 20, 24),
                  children: [
                    const Text('Today', style: TextStyle(color: Color(0xFF8F92A1), fontSize: 14)),
                    const SizedBox(height: 16),
                    Container(
                      height: 96,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F3FC),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: BreesColors.primary,
                            child: Icon(Icons.discount_outlined, color: Colors.white),
                          ),
                          SizedBox(width: 13),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Cashback 50%', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                                SizedBox(height: 4),
                                Text('Get 50% cashback for Pizza Hut', style: TextStyle(color: Color(0xFF8F92A1), fontSize: 12)),
                                SizedBox(height: 6),
                                Text('Claim it now  ›', style: TextStyle(color: BreesColors.primary, fontSize: 14, fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 26),
                    const Text('Yesterday', style: TextStyle(color: Color(0xFF8F92A1), fontSize: 14)),
                    const SizedBox(height: 10),
                    ...yesterday.map(_NotificationRow.new),
                    const SizedBox(height: 22),
                    const Text('Last 7 days', style: TextStyle(color: Color(0xFF8F92A1), fontSize: 14)),
                    const SizedBox(height: 10),
                    ...yesterday.take(2).map(_NotificationRow.new),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationItem {
  const _NotificationItem(this.title, this.subtitle, this.trailing, this.color, this.icon);
  final String title;
  final String subtitle;
  final String trailing;
  final Color color;
  final IconData icon;
}

class _NotificationRow extends StatelessWidget {
  const _NotificationRow(this.item);
  final _NotificationItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: item.color, borderRadius: BorderRadius.circular(10)),
            child: Icon(item.icon, color: Colors.white, size: 23),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(height: 5),
                Text(item.subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(item.trailing, style: TextStyle(color: item.trailing.contains(':') ? const Color(0xFF8F92A1) : const Color(0xFF19B65B), fontSize: 12)),
        ],
      ),
    );
  }
}

class HomeWelcomeScreen extends StatelessWidget {
  const HomeWelcomeScreen({
    super.key,
    required this.onAddAccount,
    required this.onHome,
    required this.onBudget,
    required this.onInsights,
    required this.onProfile,
    required this.onNotifications,
    required this.onSearch,
  });

  final VoidCallback onAddAccount;
  final VoidCallback onHome;
  final VoidCallback onBudget;
  final VoidCallback onInsights;
  final VoidCallback onProfile;
  final VoidCallback onNotifications;
  final VoidCallback onSearch;

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
              left: 20,
              top: 74,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  children: [
                    TextSpan(text: 'Hello '),
                    TextSpan(text: 'John', style: TextStyle(fontWeight: FontWeight.w700)),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Your finances are looking good', style: TextStyle(fontSize: 12, color: Color(0xFFDCD8FF))),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 65,
              top: 73,
              child: GestureDetector(
                onTap: onNotifications,
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFF321EB2),
                  child: Icon(Icons.notifications_none_rounded, color: Color(0xFFB7ACFF), size: 20),
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 73,
              child: GestureDetector(
                onTap: onSearch,
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFF321EB2),
                  child: Icon(Icons.search_rounded, color: Color(0xFFB7ACFF), size: 20),
                ),
              ),
            ),
            Positioned(
              left: 114,
              top: 264,
              width: 148,
              height: 126,
              child: Image.asset('assets/images/home_welcome_illustration.png', fit: BoxFit.contain),
            ),
            const Positioned(
              left: 20,
              right: 20,
              top: 408,
              child: Column(
                children: [
                  Text('Welcome', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700)),
                  SizedBox(height: 10),
                  Text(
                    'This is an overview of all your Brees\naccount, so come back later',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12, height: 1.45),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 109,
              top: 502,
              child: SizedBox(
                width: 157,
                height: 46,
                child: FilledButton(
                  onPressed: onAddAccount,
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFFD8D2FF),
                    foregroundColor: const Color(0xFF0E0646),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('+  Add your account', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 82,
              child: FinanceBottomNav(
                activeTab: FinanceTab.home,
                onHome: onHome,
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

class HomeSearchScreen extends StatelessWidget {
  const HomeSearchScreen({
    super.key,
    required this.onClose,
    required this.onOpenTransactions,
  });

  final VoidCallback onClose;
  final VoidCallback onOpenTransactions;

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: BreesColors.primary,
      child: ColoredBox(
        color: BreesColors.primary,
        child: Stack(
          children: [
            Positioned(
              left: 20,
              top: 140,
              width: 335,
              height: 335,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF24178E),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 226, 20, 0),
                  child: Column(
                    children: [
                      _DimBalance(name: 'Kuda bank', amount: 'N12,000.00'),
                      SizedBox(height: 14),
                      _DimBalance(name: 'GT Bank', amount: 'N950.00'),
                      SizedBox(height: 14),
                      _DimBalance(name: 'PiggyVest', amount: 'N1,050.00'),
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
              child: Container(
                decoration: BoxDecoration(color: const Color(0xFF25178F), borderRadius: BorderRadius.circular(16)),
              ),
            ),
            Positioned(
              left: 20,
              top: 650,
              width: 335,
              height: 155,
              child: Container(
                decoration: BoxDecoration(color: const Color(0xFF3722B0), borderRadius: BorderRadius.circular(16)),
              ),
            ),
            Positioned(
              left: 20,
              top: 68,
              width: 335,
              height: 60,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFC9C0FF)),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search_rounded, color: Colors.white),
                    const SizedBox(width: 16),
                    const Expanded(child: Text('James', style: TextStyle(color: Colors.white, fontSize: 14))),
                    GestureDetector(
                      onTap: onClose,
                      child: const CircleAvatar(
                        radius: 12,
                        backgroundColor: Color(0xFF3821C6),
                        child: Icon(Icons.close_rounded, color: Color(0xFFC7BEFF), size: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 40,
              top: 151,
              width: 295,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SearchSuggestion(text: 'Transfer to “James” UBA', onTap: onOpenTransactions),
                  const SizedBox(height: 22),
                  _SearchSuggestion(text: 'Received cash from James Zenith', onTap: onOpenTransactions),
                  const SizedBox(height: 22),
                  _SearchSuggestion(text: 'Transfer to James GTB', onTap: onOpenTransactions),
                  const SizedBox(height: 34),
                  GestureDetector(
                    onTap: onOpenTransactions,
                    child: const Text('See more ...', style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 0,
              child: BreesStatusBar(
                foreground: Colors.white,
                assetPath: 'assets/images/status_white.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchSuggestion extends StatelessWidget {
  const _SearchSuggestion({required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          const CircleAvatar(radius: 12, backgroundColor: Colors.white),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(color: Color(0xFFDAD4FF), fontSize: 15))),
        ],
      ),
    );
  }
}

class _DimBalance extends StatelessWidget {
  const _DimBalance({required this.name, required this.amount});
  final String name;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(name, style: const TextStyle(color: Color(0xFF9A91D8), fontSize: 12)),
        const Spacer(),
        Text(amount, style: const TextStyle(color: Color(0xFFB1A8EC), fontSize: 12)),
      ],
    );
  }
}
