import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_status_bar.dart';
import '../../../../core/widgets/brees_top_nav.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../../../../core/widgets/home_indicator.dart';

class TransactionSortScreen extends StatefulWidget {
  const TransactionSortScreen({
    super.key,
    required this.onBack,
    required this.onFinished,
  });

  final VoidCallback onBack;
  final VoidCallback onFinished;

  @override
  State<TransactionSortScreen> createState() => _TransactionSortScreenState();
}

class _TransactionSortScreenState extends State<TransactionSortScreen> {
  bool liked = false;
  bool rejected = false;

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
            BreesTopNav(
              title: 'Sort your transactions',
              subtitle: '1 of 20',
              onBack: widget.onBack,
            ),
            Positioned(
              left: 16,
              top: 111,
              width: 343,
              height: 186,
              child: Container(
                decoration: BoxDecoration(
                  color: BreesColors.canvas,
                  border: Border.all(color: BreesColors.primary, width: 1.4),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A2C14DD),
                      blurRadius: 0,
                      spreadRadius: 8,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    const Positioned(
                      left: 20,
                      top: 17,
                      child: Text(
                        'Transaction Details',
                        style: TextStyle(
                          color: Color(0xFF747A88),
                          fontSize: 10,
                          height: 12 / 10,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 39,
                      width: 37,
                      height: 37,
                      child: Image.asset('assets/images/bank_kuda.png'),
                    ),
                    const Positioned(
                      left: 67,
                      top: 38,
                      width: 130,
                      child: Text(
                        'Kuda Bank',
                        style: TextStyle(
                          color: Color(0xFF111827),
                          fontSize: 14,
                          height: 17 / 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 67,
                      top: 59,
                      child: Text(
                        '2175836514',
                        style: TextStyle(
                          color: Color(0xFF545B68),
                          fontSize: 10,
                          height: 12 / 10,
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 20,
                      top: 38,
                      child: Text(
                        'N12,000.00',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          height: 17 / 14,
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 20,
                      top: 59,
                      child: Text(
                        'Sep 01 at 2:24 PM',
                        style: TextStyle(
                          color: Color(0xFF545B68),
                          fontSize: 10,
                          height: 12 / 10,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 20,
                      top: 104,
                      child: Text(
                        'Transaction Remark',
                        style: TextStyle(
                          color: Color(0xFF747A88),
                          fontSize: 10,
                          height: 12 / 10,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 20,
                      right: 20,
                      top: 124,
                      height: 45,
                      child: Text(
                        'Mc Loc Pos Prch-2134555666--Funds &\nElectronic T La Lang-',
                        maxLines: 2,
                        style: TextStyle(
                          color: Color(0xFF24272D),
                          fontSize: 14,
                          height: 20 / 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 336,
              child: Text(
                'Does this category match the transaction',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: BreesColors.navy,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 366,
              width: 311,
              height: 300,
              child: AnimatedScale(
                scale: liked ? 1.025 : 1,
                duration: const Duration(milliseconds: 180),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x224C36ED),
                        blurRadius: 0,
                        spreadRadius: 11,
                        offset: Offset(0, 13),
                      ),
                    ],
                  ),
                  child: const Stack(
                    children: [
                      Positioned(
                        left: 131.5,
                        top: 41,
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Color(0xFFFFEADD),
                          child: Text('☎️', style: TextStyle(fontSize: 22)),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 106,
                        child: Text(
                          'Utilities',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF0E0646),
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Positioned(left: 72, top: 167, child: _Tag('Lawma')),
                      Positioned(left: 170, top: 167, child: _Tag('Power')),
                      Positioned(left: 72, top: 225, child: _Tag('Water')),
                      Positioned(left: 170, top: 225, child: _Tag('Rent')),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 124,
              top: 708,
              child: GestureDetector(
                onTap: () => setState(() => rejected = !rejected),
                child: AnimatedScale(
                  scale: rejected ? 0.9 : 1,
                  duration: const Duration(milliseconds: 140),
                  child: const CircleAvatar(
                    radius: 28,
                    backgroundColor: Color(0xFFF8F8F8),
                    child: Icon(Icons.close_rounded, size: 34),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 195,
              top: 708,
              child: GestureDetector(
                key: const Key('sort-approve'),
                onTap: () {
                  setState(() => liked = true);
                  Future<void>.delayed(
                    const Duration(milliseconds: 240),
                    widget.onFinished,
                  );
                },
                child: AnimatedScale(
                  scale: liked ? 0.92 : 1,
                  duration: const Duration(milliseconds: 140),
                  child: const CircleAvatar(
                    radius: 28,
                    backgroundColor: Color(0xFFFFE4E4),
                    child: Icon(
                      Icons.favorite_rounded,
                      color: Color(0xFFF16C63),
                      size: 28,
                    ),
                  ),
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

class _Tag extends StatelessWidget {
  const _Tag(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFE5F9FE),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF0093B9),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
