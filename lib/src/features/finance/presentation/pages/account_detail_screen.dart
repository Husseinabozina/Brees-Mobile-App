import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_status_bar.dart';
import '../../../../core/widgets/brees_top_nav.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../../../../core/widgets/home_indicator.dart';
import '../../domain/entities/finance_snapshot.dart';

class AccountDetailScreen extends StatelessWidget {
  const AccountDetailScreen({
    super.key,
    required this.snapshot,
    required this.onBack,
  });

  final FinanceSnapshot snapshot;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final account = snapshot.accounts.first;

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
            BreesTopNav(title: 'My Account', onBack: onBack),
            Positioned(
              left: 126.5,
              top: 120,
              width: 122,
              child: Column(
                children: [
                  Image.asset(account.assetPath, width: 48, height: 48),
                  const SizedBox(height: 16),
                  const Text(
                    'Kuda Bank',
                    style: TextStyle(
                      color: Color(0xFF111827),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              top: 243,
              width: 335,
              height: 192,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  children: [
                    _InfoRow(label: 'Type of account', value: 'Savings'),
                    SizedBox(height: 16),
                    _InfoRow(label: 'Account No', value: '1234567890'),
                    SizedBox(height: 16),
                    _InfoRow(
                      label: 'Avaliable Balance',
                      value: 'N12,000.00',
                      valueColor: Color(0xFF1B7A00),
                      bold: true,
                    ),
                    SizedBox(height: 16),
                    _InfoRow(label: 'Date added', value: '15/05/20, 10:03 AM'),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 459,
              width: 335,
              height: 293,
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Recent Transactions',
                          style: TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 11,
                          backgroundColor: Color(0xFFF8F8F8),
                          child: Icon(Icons.chevron_right_rounded, size: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ...snapshot.transactions.map(
                      (t) => Padding(
                        padding: const EdgeInsets.only(bottom: 13),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 19,
                              backgroundColor: const Color(0xFFF1F5FC),
                              child: Text(
                                t.initial,
                                style: const TextStyle(color: BreesColors.primary),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    t.title,
                                    style: const TextStyle(
                                      color: Color(0xFF111827),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    t.subtitle,
                                    style: const TextStyle(
                                      color: Color(0xFF9197A3),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              t.amountLabel,
                              style: TextStyle(
                                color: t.isIncome
                                    ? const Color(0xFF1B7A00)
                                    : const Color(0xFF050D2A),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    this.valueColor = const Color(0xFF121826),
    this.bold = false,
  });

  final String label;
  final String value;
  final Color valueColor;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 145,
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF6C727F),
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: valueColor,
              fontSize: 14,
              fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
