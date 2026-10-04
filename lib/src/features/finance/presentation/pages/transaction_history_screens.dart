import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_button.dart';
import '../../../../core/widgets/brees_status_bar.dart';
import '../../../../core/widgets/brees_top_nav.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../../../../core/widgets/home_indicator.dart';
import '../../domain/entities/finance_snapshot.dart';
import '../../domain/entities/finance_transaction.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({
    super.key,
    required this.snapshot,
    required this.onBack,
    required this.onFilter,
    required this.onOpenTransaction,
  });

  final FinanceSnapshot snapshot;
  final VoidCallback onBack;
  final VoidCallback onFilter;
  final VoidCallback onOpenTransaction;

  @override
  Widget build(BuildContext context) {
    final transactions = <FinanceTransaction>[
      const FinanceTransaction(
        title: 'Transfer to Phillip',
        subtitle: 'GT Bank 12:03 AM',
        amountLabel: '+N42,209',
        initial: 'P',
        isIncome: true,
      ),
      const FinanceTransaction(
        title: 'Habib Yogurt',
        subtitle: 'GT Bank 12:03 AM',
        amountLabel: '-N42,209',
        initial: 'H',
        isIncome: false,
      ),
      const FinanceTransaction(
        title: 'Transfer to John Ogaga',
        subtitle: 'GT Bank 12:03 AM',
        amountLabel: '-N42,209',
        initial: 'J',
        isIncome: false,
      ),
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
            BreesTopNav(title: 'Transactions', onBack: onBack),
            Positioned(
              right: 16,
              top: 48,
              child: GestureDetector(
                key: const Key('transactions-filter'),
                onTap: onFilter,
                child: const CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(0xFFFAFBFF),
                  child: Icon(Icons.filter_alt_rounded, size: 18),
                ),
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
                  padding: const EdgeInsets.fromLTRB(20, 46, 20, 26),
                  children: [
                    Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAFBFF),
                        border: Border.all(color: const Color(0xFFEBEFFF), width: .5),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Stack(
                        children: [
                          Positioned(
                            left: 18,
                            top: 16.5,
                            child: Icon(
                              Icons.search_rounded,
                              color: Color(0xFF9DAEFF),
                              size: 19,
                            ),
                          ),
                          Positioned(
                            left: 53,
                            top: 16,
                            right: 18,
                            child: Text(
                              'Search transactions',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xFF97969E),
                                fontSize: 14,
                                height: 18 / 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text('Today', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                    const SizedBox(height: 19),
                    ...transactions.map(
                      (transaction) => Padding(
                        padding: const EdgeInsets.only(bottom: 27),
                        child: _TransactionListRow(
                          transaction: transaction,
                          onTap: onOpenTransaction,
                        ),
                      ),
                    ),
                    const Text('Yesterday', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                    const SizedBox(height: 19),
                    ...transactions.map(
                      (transaction) => Padding(
                        padding: const EdgeInsets.only(bottom: 27),
                        child: _TransactionListRow(
                          transaction: transaction,
                          onTap: onOpenTransaction,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: .3,
                      child: _TransactionListRow(
                        transaction: transactions.first,
                        onTap: onOpenTransaction,
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

class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen({
    super.key,
    required this.onBack,
  });

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: Colors.white,
      child: ColoredBox(
        color: Colors.white,
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              child: BreesStatusBar(
                foreground: Color(0xFF161719),
                assetPath: 'assets/images/status_dark.png',
              ),
            ),
            BreesTopNav(title: 'Transactions Details', onBack: onBack),
            const Positioned(
              left: 0,
              right: 0,
              top: 120,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: Color(0xFFEEF2F8),
                    child: Text(
                      'J',
                      style: TextStyle(
                        color: Color(0xFF005CEE),
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Transfer to Phillip',
                    style: TextStyle(
                      color: Color(0xFF111827),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 32),
                  _CategoryPill(),
                ],
              ),
            ),
            const Positioned(
              left: 24,
              top: 317,
              width: 327,
              height: 112,
              child: _DetailCard(
                rows: [
                  _DetailRowData('Type', 'Credit', valueColor: Color(0xFF1B7A00)),
                  _DetailRowData('Description', 'Payment for Coffee'),
                ],
              ),
            ),
            const Positioned(
              left: 24,
              top: 453,
              width: 327,
              height: 112,
              child: _DetailCard(
                rows: [
                  _DetailRowData('Bank', 'Guaranty Trust Bank'),
                  _DetailRowData('Amount', '+N42,209', valueColor: Color(0xFF1B7A00), bold: true),
                ],
              ),
            ),
            const Positioned(
              left: 24,
              top: 589,
              width: 327,
              height: 112,
              child: _DetailCard(
                rows: [
                  _DetailRowData('Date', '10 Sep, 2021'),
                  _DetailRowData('Time', '12:03 AM'),
                ],
              ),
            ),
            const HomeIndicator(),
          ],
        ),
      ),
    );
  }
}

class TransactionFilterScreen extends StatefulWidget {
  const TransactionFilterScreen({
    super.key,
    required this.onBack,
    required this.onContinue,
  });

  final VoidCallback onBack;
  final VoidCallback onContinue;

  @override
  State<TransactionFilterScreen> createState() => _TransactionFilterScreenState();
}

class _TransactionFilterScreenState extends State<TransactionFilterScreen> {
  bool kuda = false;
  bool gtb = true;
  bool cowrywise = true;
  RangeValues range = const RangeValues(.14, .55);

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: const Color(0xFF9BA0AB),
      child: Stack(
        children: [
          ColoredBox(
            color: const Color(0xFFB1B6C1),
            child: Stack(
              children: [
                const Positioned(
                  top: 0,
                  child: BreesStatusBar(
                    foreground: Color(0xFF161719),
                    assetPath: 'assets/images/status_dark.png',
                  ),
                ),
                BreesTopNav(title: 'Transactions', onBack: widget.onBack),
                const Positioned(
                  right: 16,
                  top: 48,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Color(0xFFC8CBD3),
                    child: Icon(Icons.filter_alt_rounded, size: 18),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 129,
            width: 375,
            height: 683,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    left: 164,
                    top: 17,
                    width: 47,
                    height: 5,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color(0xFFE3E6ED),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 48,
                    child: GestureDetector(
                      onTap: widget.onBack,
                      child: const Icon(Icons.close_rounded, color: Color(0xFF6C7482)),
                    ),
                  ),
                  const Positioned(
                    left: 0,
                    right: 0,
                    top: 49,
                    child: Text(
                      'Filters',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Positioned(
                    right: 24,
                    top: 51,
                    child: GestureDetector(
                      onTap: () => setState(() {
                        kuda = false;
                        gtb = false;
                        cowrywise = false;
                        range = const RangeValues(0, 1);
                      }),
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                          color: BreesColors.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 114,
                    width: 335,
                    height: 64,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 12, 18, 9),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F7FF),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Text('Date', style: TextStyle(color: Color(0xFF5C616F), fontSize: 10)),
                          ),
                          Positioned(
                            left: 0,
                            bottom: 2,
                            child: Text('01 Sep 2021 - 10 Sep 2021', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                          ),
                          Positioned(
                            right: 0,
                            top: 12,
                            child: Icon(Icons.calendar_month_rounded, color: BreesColors.primary),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 20,
                    top: 222,
                    child: Text('Account', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  Positioned(
                    left: 20,
                    top: 255,
                    width: 335,
                    child: Column(
                      children: [
                        _FilterAccountRow(
                          name: 'Kuda Bank',
                          label: 'K',
                          color: const Color(0xFF4A287C),
                          value: kuda,
                          onChanged: (value) => setState(() => kuda = value),
                        ),
                        _FilterAccountRow(
                          name: 'GTB',
                          label: 'GT',
                          color: const Color(0xFFD94F00),
                          value: gtb,
                          onChanged: (value) => setState(() => gtb = value),
                        ),
                        _FilterAccountRow(
                          name: 'Cowrywise',
                          label: 'C',
                          color: const Color(0xFF0070F3),
                          value: cowrywise,
                          onChanged: (value) => setState(() => cowrywise = value),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    left: 20,
                    top: 462,
                    child: Text('Price Range', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  const Positioned(
                    right: 20,
                    top: 462,
                    child: Text(
                      'N10 - N250,000',
                      style: TextStyle(color: BreesColors.primary, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    right: 8,
                    top: 503,
                    child: RangeSlider(
                      values: range,
                      onChanged: (value) => setState(() => range = value),
                      activeColor: BreesColors.primary,
                      inactiveColor: const Color(0xFFE3E6E8),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 603,
                    child: BreesButton(
                      label: 'Continue',
                      width: 335,
                      onPressed: widget.onContinue,
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

class _FilterAccountRow extends StatelessWidget {
  const _FilterAccountRow({
    required this.name,
    required this.label,
    required this.color,
    required this.value,
    required this.onChanged,
  });

  final String name;
  final String label;
  final Color color;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: Row(
        children: [
          Container(
            width: 29,
            height: 29,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
            child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(name, style: const TextStyle(color: Color(0xFF42527A), fontSize: 14, fontWeight: FontWeight.w500))),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: const Color(0xFF456CF5),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xFFE5E7EB),
          ),
        ],
      ),
    );
  }
}

class _TransactionListRow extends StatelessWidget {
  const _TransactionListRow({
    required this.transaction,
    required this.onTap,
  });

  final FinanceTransaction transaction;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 48,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 2.5,
              width: 43,
              height: 43,
              child: CircleAvatar(
                radius: 21.5,
                backgroundColor: const Color(0xFFEEF2F8),
                child: Text(
                  transaction.initial,
                  style: const TextStyle(
                    color: Color(0xFF005CEE),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 55,
              right: 86,
              top: 3,
              child: Text(
                transaction.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF131313),
                  fontSize: 14,
                  height: 18 / 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              left: 55,
              right: 86,
              top: 27,
              child: Text(
                transaction.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0x80131313),
                  fontSize: 12,
                  height: 16 / 12,
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 14,
              width: 78,
              child: Text(
                transaction.amountLabel,
                maxLines: 1,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: transaction.isIncome ? const Color(0xFF1B7A00) : const Color(0xFF050D2A),
                  fontSize: 14,
                  height: 18 / 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryPill extends StatelessWidget {
  const _CategoryPill();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 46,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7FD),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Stack(
        children: [
          Positioned(left: 18, top: 13, child: Text('🍔', style: TextStyle(fontSize: 14, height: 18 / 14))),
          Positioned(
            left: 48,
            top: 13,
            width: 70,
            child: Text(
              'Eating out',
              maxLines: 1,
              style: TextStyle(
                color: Color(0xFF6875B7),
                fontSize: 14,
                height: 18 / 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 11,
            child: Icon(Icons.arrow_drop_down_rounded, color: Color(0xFFB4BCD7), size: 24),
          ),
        ],
      ),
    );
  }
}

class _DetailRowData {
  const _DetailRowData(this.label, this.value, {this.valueColor = const Color(0xFF121826), this.bold = false});
  final String label;
  final String value;
  final Color valueColor;
  final bool bold;
}

class _DetailCard extends StatelessWidget {
  const _DetailCard({required this.rows});
  final List<_DetailRowData> rows;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: List.generate(rows.length, (index) {
          final row = rows[index];
          final top = 24.0 + index * 40.0;
          return Stack(
            children: [
              Positioned(
                left: 24,
                top: top,
                width: 124,
                height: 24,
                child: Text(
                  row.label,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Color(0xFF6C727F),
                    fontSize: 14,
                    height: 24 / 14,
                  ),
                ),
              ),
              Positioned(
                right: 24,
                top: top,
                width: 150,
                height: 24,
                child: Text(
                  row.value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: row.valueColor,
                    fontSize: 14,
                    height: 24 / 14,
                    fontWeight: row.bold ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
