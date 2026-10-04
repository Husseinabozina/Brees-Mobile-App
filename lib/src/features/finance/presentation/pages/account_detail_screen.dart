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
              height: 83,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(account.assetPath, width: 48, height: 48),
                  const Positioned(
                    top: 64,
                    child: Text(
                      'Kuda Bank',
                      style: TextStyle(
                        color: Color(0xFF111827),
                        fontSize: 16,
                        height: 19 / 16,
                        fontWeight: FontWeight.w600,
                      ),
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Stack(
                  children: [
                    Positioned(
                      left: 16,
                      right: 16,
                      top: 24,
                      height: 24,
                      child: _InfoRow(
                        label: 'Type of account',
                        value: 'Savings',
                      ),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      top: 64,
                      height: 24,
                      child: _InfoRow(
                        label: 'Account No',
                        value: '1234567890',
                      ),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      top: 104,
                      height: 24,
                      child: _InfoRow(
                        label: 'Avaliable Balance',
                        value: 'N12,000.00',
                        valueColor: Color(0xFF1B7A00),
                        bold: true,
                      ),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      top: 144,
                      height: 24,
                      child: _InfoRow(
                        label: 'Date added',
                        value: '15/05/20, 10:03 AM',
                      ),
                    ),
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    const Positioned(
                      left: 16,
                      right: 16,
                      top: 17,
                      height: 24,
                      child: Row(
                        children: [
                          Text(
                            'Recent Transactions',
                            style: TextStyle(
                              color: Color(0xFF444444),
                              fontSize: 12,
                              height: 16 / 12,
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
                    ),
                    ...List.generate(snapshot.transactions.length, (index) {
                      final transaction = snapshot.transactions[index];
                      return Positioned(
                        left: 16,
                        right: 16,
                        top: 55 + index * 53,
                        height: 42,
                        child: _TransactionRow(transaction: transaction),
                      );
                    }),
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
            maxLines: 1,
            style: const TextStyle(
              color: Color(0xFF6C727F),
              fontSize: 14,
              height: 24 / 14,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            maxLines: 1,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: valueColor,
              fontSize: 14,
              height: 24 / 14,
              fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class _TransactionRow extends StatelessWidget {
  const _TransactionRow({required this.transaction});

  final dynamic transaction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 19,
          backgroundColor: const Color(0xFFF1F5FC),
          child: Text(
            transaction.initial as String,
            style: const TextStyle(color: BreesColors.primary),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 1,
                right: 0,
                child: Text(
                  transaction.title as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 14,
                    height: 17 / 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 23,
                right: 0,
                child: Text(
                  transaction.subtitle as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF9197A3),
                    fontSize: 12,
                    height: 15 / 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(
          transaction.amountLabel as String,
          style: TextStyle(
            color: transaction.isIncome as bool
                ? const Color(0xFF1B7A00)
                : const Color(0xFF050D2A),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
