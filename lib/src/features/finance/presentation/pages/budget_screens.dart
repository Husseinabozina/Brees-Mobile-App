import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_button.dart';
import '../../../../core/widgets/brees_status_bar.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../../../../core/widgets/home_indicator.dart';
import '../widgets/finance_bottom_nav.dart';

class BudgetEmptyScreen extends StatelessWidget {
  const BudgetEmptyScreen({
    super.key,
    required this.onBack,
    required this.onIntro,
    required this.onHome,
    required this.onBudget,
    required this.onInsights,
    required this.onProfile,
  });

  final VoidCallback onBack;
  final VoidCallback onIntro;
  final VoidCallback onHome;
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
            const Positioned(
              top: 0,
              child: BreesStatusBar(
                foreground: Colors.white,
                assetPath: 'assets/images/status_white.png',
              ),
            ),
            Positioned(
              left: 16,
              top: 48,
              child: _RoundAction(
                icon: Icons.chevron_left_rounded,
                color: const Color(0xFF3B23EB),
                iconColor: const Color(0xFFD9D4FF),
                onTap: onBack,
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 58,
              child: Text(
                'Budget',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            const Positioned(
              right: 16,
              top: 48,
              child: _RoundAction(
                icon: Icons.more_horiz_rounded,
                color: Color(0xFF3B23EB),
                iconColor: Color(0xFFD9D4FF),
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 123,
              child: Column(
                children: [
                  Text('0', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700)),
                  SizedBox(height: 8),
                  Text('You have no budget', style: TextStyle(color: Colors.white, fontSize: 14)),
                ],
              ),
            ),
            Positioned(
              left: 0,
              top: 222,
              width: 375,
              height: 590,
              child: Container(
                decoration: const BoxDecoration(
                  color: BreesColors.canvas,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 124,
                      top: 112,
                      width: 127,
                      height: 127,
                      child: Image.asset('assets/images/budget_piggy.png', fit: BoxFit.contain),
                    ),
                    const Positioned(
                      left: 20,
                      right: 20,
                      top: 246,
                      child: Column(
                        children: [
                          Text('Welcome', style: TextStyle(color: BreesColors.navy, fontSize: 24, fontWeight: FontWeight.w700)),
                          SizedBox(height: 10),
                          Text(
                            'This is an overview of all your Brees\naccount, so come back later',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xFF5C616F), fontSize: 12, height: 1.45),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 109,
                      top: 348,
                      width: 157,
                      height: 46,
                      child: FilledButton(
                        key: const Key('budget-add-new'),
                        onPressed: onIntro,
                        style: FilledButton.styleFrom(
                          backgroundColor: BreesColors.primary,
                          foregroundColor: Colors.white,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('+  Add a new budget', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
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
                activeTab: FinanceTab.budget,
                light: true,
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

class BudgetIntroScreen extends StatelessWidget {
  const BudgetIntroScreen({
    super.key,
    required this.onClose,
    required this.onCreate,
    this.background,
  });

  final VoidCallback onClose;
  final VoidCallback onCreate;
  final Widget? background;

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: const Color(0xFF8D8F95),
      child: Stack(
        children: [
          if (background != null)
            Positioned.fill(
              child: IgnorePointer(child: background!),
            )
          else
            const ColoredBox(
              color: Color(0xFF797A7F),
              child: SizedBox.expand(),
            ),
          Positioned.fill(
            child: ColoredBox(color: Colors.black.withValues(alpha: .42)),
          ),
          Positioned(
            left: 23,
            top: 161,
            width: 328,
            height: 483,
            child: Container(
              decoration: BoxDecoration(
                color: BreesColors.primary,
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 26,
                    offset: Offset(0, 14),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 18,
                    top: 18,
                    child: GestureDetector(
                      key: const Key('budget-intro-close'),
                      onTap: onClose,
                      child: const CircleAvatar(
                        radius: 13,
                        backgroundColor: Color(0xFFC7C0FF),
                        child: Icon(
                          Icons.close_rounded,
                          size: 18,
                          color: BreesColors.primary,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 60,
                    top: 28,
                    width: 208,
                    height: 150,
                    child: Image.asset(
                      'assets/images/budget_intro_illustration.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Positioned(
                    left: 24,
                    right: 24,
                    top: 225,
                    child: Column(
                      children: [
                        Text(
                          'Budget',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Overspend no more',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Get ready to start using budgets for your\ndaily financial app.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            height: 1.55,
                          ),
                        ),
                        SizedBox(height: 22),
                        Text(
                          '●  •  •  •',
                          style: TextStyle(
                            color: Color(0xFFDCD7FF),
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 403,
                    width: 280,
                    height: 57,
                    child: FilledButton(
                      key: const Key('budget-intro-create'),
                      onPressed: onCreate,
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: BreesColors.primary,
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        'Create a New Budget',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
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

class BudgetCreateBasicsScreen extends StatelessWidget {
  const BudgetCreateBasicsScreen({
    super.key,
    required this.onBack,
    required this.onCycle,
    required this.onContinue,
    this.configured = false,
  });

  final VoidCallback onBack;
  final VoidCallback onCycle;
  final VoidCallback onContinue;
  final bool configured;

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
            Positioned(left: 16, top: 48, child: _RoundAction(icon: Icons.chevron_left_rounded, onTap: onBack)),
            Positioned(
              right: 20,
              top: 56,
              child: Text(
                '1 of 3',
                style: TextStyle(
                  color: const Color(0xFF131313).withValues(alpha: configured ? .75 : 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Positioned(
              left: 20,
              top: 112,
              width: 335,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create your budget', style: TextStyle(color: BreesColors.navy, fontSize: 24, fontWeight: FontWeight.w700)),
                  SizedBox(height: 8),
                  Text(
                    'Set the maximum you’d like to spend each week\nor month? Type in the amount below',
                    style: TextStyle(color: Color(0xFF292B2D), fontSize: 14, height: 22 / 14),
                  ),
                ],
              ),
            ),
            const Positioned(left: 20, top: 235, child: _BudgetField(label: 'Name of Budget', value: 'Monthly Budget')),
            Positioned(
              left: 20,
              top: 312,
              child: GestureDetector(
                key: const Key('budget-cycle-field'),
                onTap: onCycle,
                child: _BudgetField(
                  label: 'Cycle of budget',
                  value: configured ? 'Weekly on 2nd' : 'Pick a start date',
                  valueColor: configured ? BreesColors.primary : const Color(0xFF040C22),
                  trailing: const Icon(Icons.calendar_month_rounded, color: BreesColors.primary, size: 21),
                ),
              ),
            ),
            const Positioned(
              left: 20,
              top: 389,
              child: _BudgetField(
                label: 'Select an account',
                value: 'Select an account',
                trailing: Icon(Icons.keyboard_arrow_down_rounded, size: 24),
              ),
            ),
            Positioned(
              left: 20,
              top: configured ? 671 : 706,
              child: BreesButton(label: 'Continue', width: 335, height: 56, onPressed: onContinue),
            ),
            const HomeIndicator(),
          ],
        ),
      ),
    );
  }
}

class BudgetCycleScreen extends StatefulWidget {
  const BudgetCycleScreen({
    super.key,
    required this.onBack,
    required this.onSetCycle,
    required this.onSwitchFrequency,
    required this.weekly,
  });

  final VoidCallback onBack;
  final VoidCallback onSetCycle;
  final VoidCallback onSwitchFrequency;
  final bool weekly;

  @override
  State<BudgetCycleScreen> createState() => _BudgetCycleScreenState();
}

class _BudgetCycleScreenState extends State<BudgetCycleScreen> {
  int selectedDay = 16;

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: BreesColors.canvas,
      child: Stack(
        children: [
          const ColoredBox(color: Color(0xFF55565A), child: SizedBox.expand()),
          Positioned(
            left: 0,
            top: 90,
            width: 375,
            height: 722,
            child: Container(
              decoration: const BoxDecoration(
                color: BreesColors.canvas,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Stack(
                children: [
                  Positioned(left: 16, top: 24, child: _RoundAction(icon: Icons.keyboard_arrow_down_rounded, onTap: widget.onBack)),
                  const Positioned(left: 20, top: 80, child: Text('Edit budget cycle', style: TextStyle(color: BreesColors.navy, fontSize: 24, fontWeight: FontWeight.w700))),
                  Positioned(
                    left: 20,
                    top: 136,
                    width: 335,
                    height: 59,
                    child: InkWell(
                      key: const Key('budget-cycle-frequency'),
                      onTap: widget.onSwitchFrequency,
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                        child: Stack(
                          children: [
                            const Positioned(left: 20, top: 10, child: Text('Frequency', style: TextStyle(color: Color(0xFF5C616F), fontSize: 10))),
                            Positioned(left: 20, top: 31, child: Text(widget.weekly ? 'Weekly' : 'Monthly', style: const TextStyle(color: BreesColors.primary, fontSize: 14))),
                            const Positioned(right: 18, top: 20, child: Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF78808C))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 212,
                    width: 335,
                    height: 346,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(16, 17, 16, 16),
                            child: Text('Pick a start date', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                          ),
                          const Divider(height: 1, color: Color(0xFFE9EBEF)),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 16, 10, 10),
                              child: _BudgetCalendar(
                                selectedDay: selectedDay,
                                weekly: widget.weekly,
                                onSelected: (day) => setState(() => selectedDay = day),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 616,
                    child: BreesButton(label: 'Set cycle', width: 335, height: 56, onPressed: widget.onSetCycle),
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

class BudgetAmountScreen extends StatefulWidget {
  const BudgetAmountScreen({super.key, required this.onBack, required this.onNext});

  final VoidCallback onBack;
  final VoidCallback onNext;

  @override
  State<BudgetAmountScreen> createState() => _BudgetAmountScreenState();
}

class _BudgetAmountScreenState extends State<BudgetAmountScreen> {
  int amount = 0;

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
            Positioned(left: 16, top: 48, child: _RoundAction(icon: Icons.chevron_left_rounded, onTap: widget.onBack)),
            const Positioned(right: 20, top: 56, child: Text('2 of 3', style: TextStyle(fontSize: 14))),
            const Positioned(left: 20, top: 112, child: Text('Set a budget amount', style: TextStyle(color: BreesColors.navy, fontSize: 24, fontWeight: FontWeight.w700))),
            Positioned(
              left: 20,
              top: 162,
              child: Container(
                width: 335,
                height: 87,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                child: const Stack(
                  children: [
                    Positioned(left: 20, top: 11, child: Text('Select an account', style: TextStyle(color: Color(0xFF5C616F), fontSize: 10))),
                    Positioned(left: 20, top: 35, child: _MiniBankLogo()),
                    Positioned(left: 64, top: 42, child: Text('Kuda Bank', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
                    Positioned(right: 56, top: 42, child: Text('N12,000.00', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600))),
                    Positioned(right: 18, top: 36, child: Icon(Icons.keyboard_arrow_down_rounded)),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 37,
              top: 276,
              width: 301,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(color: Color(0xFF212325), fontSize: 12, height: 1.5),
                  children: [
                    TextSpan(text: 'Based on your input, you would have '),
                    TextSpan(text: 'N12,000', style: TextStyle(fontWeight: FontWeight.w700)),
                    TextSpan(text: ' left\nout of '),
                    TextSpan(text: 'N22,000', style: TextStyle(fontWeight: FontWeight.w700)),
                    TextSpan(text: ' in your Kuda Bank account'),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Positioned(left: 0, right: 0, top: 390, child: Text('SET AMOUNT', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF5C616F), fontSize: 12, fontWeight: FontWeight.w600))),
            Positioned(left: 31, top: 440, child: _AmountButton(icon: Icons.remove_rounded, onTap: () => setState(() => amount = (amount - 5000).clamp(0, 999999)))),
            Positioned(right: 31, top: 440, child: _AmountButton(icon: Icons.add_rounded, onTap: () => setState(() => amount = (amount + 5000).clamp(0, 999999)))),
            Positioned(
              left: 103,
              right: 103,
              top: 441,
              child: Column(
                children: [
                  Text(amount == 0 ? '0' : 'N$amount', textAlign: TextAlign.center, style: const TextStyle(color: BreesColors.navy, fontSize: 24, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 14),
                  const Divider(color: Color(0xFFD6DBE5)),
                ],
              ),
            ),
            Positioned(
              left: 46,
              top: 521,
              child: Row(
                children: [
                  _AmountChip(label: 'N5,000', onTap: () => setState(() => amount = 5000)),
                  const SizedBox(width: 12),
                  _AmountChip(label: 'N15,000', onTap: () => setState(() => amount = 15000)),
                  const SizedBox(width: 12),
                  _AmountChip(label: 'N25,000', onTap: () => setState(() => amount = 25000)),
                ],
              ),
            ),
            Positioned(left: 20, top: 706, child: BreesButton(label: 'Next', width: 335, height: 56, onPressed: widget.onNext)),
            const HomeIndicator(),
          ],
        ),
      ),
    );
  }
}

class BudgetPreviewScreen extends StatefulWidget {
  const BudgetPreviewScreen({
    super.key,
    required this.onBack,
    required this.onCreate,
    required this.onAlertChanged,
    required this.alertEnabled,
  });

  final VoidCallback onBack;
  final VoidCallback onCreate;
  final ValueChanged<bool> onAlertChanged;
  final bool alertEnabled;

  @override
  State<BudgetPreviewScreen> createState() => _BudgetPreviewScreenState();
}

class _BudgetPreviewScreenState extends State<BudgetPreviewScreen> {
  late bool enabled;

  @override
  void initState() {
    super.initState();
    enabled = widget.alertEnabled;
  }

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
            Positioned(left: 16, top: 48, child: _RoundAction(icon: Icons.chevron_left_rounded, onTap: widget.onBack)),
            const Positioned(right: 16, top: 50, child: _RoundAction(icon: Icons.edit_rounded)),
            const Positioned(left: 20, top: 108, child: Text('Buget preview', style: TextStyle(color: BreesColors.navy, fontSize: 24, fontWeight: FontWeight.w700))),
            const Positioned(left: 20, top: 157, child: _BudgetCardPreview()),
            const Positioned(left: 20, top: 370, child: Text('Budget source', style: TextStyle(color: Color(0xFF0E1B42), fontSize: 12, fontWeight: FontWeight.w600))),
            const Positioned(left: 20, top: 399, child: _MiniBankLogo()),
            const Positioned(left: 65, top: 402, child: Text('Kuda Bank', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
            const Positioned(left: 65, top: 422, child: Text(r'Account balance: $2,987.56', style: TextStyle(fontSize: 10, color: Color(0xFF5C616F)))),
            const Positioned(right: 20, top: 410, child: Text('Change', style: TextStyle(color: BreesColors.primary, fontSize: 12))),
            const Positioned(left: 20, top: 475, child: Text('Start date', style: TextStyle(color: Color(0xFF0E1B42), fontSize: 12, fontWeight: FontWeight.w600))),
            const Positioned(left: 28, top: 511, child: Icon(Icons.calendar_month_rounded, color: BreesColors.primary, size: 17)),
            const Positioned(left: 65, top: 505, child: Text('Jan 20th 2022', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
            const Positioned(left: 65, top: 526, child: Text('Monthly budget', style: TextStyle(fontSize: 10, color: Color(0xFF5C616F)))),
            const Positioned(right: 20, top: 516, child: Text('Change', style: TextStyle(color: BreesColors.primary, fontSize: 12))),
            const Positioned(left: 20, top: 581, child: Text('Receive Alert', style: TextStyle(color: Color(0xFF0E1B42), fontSize: 14, fontWeight: FontWeight.w600))),
            const Positioned(left: 20, top: 607, width: 180, child: Text('Receive alert when it\nreaches a certain limit', style: TextStyle(color: Color(0xFF8090C0), fontSize: 12, height: 1.4))),
            Positioned(
              right: 20,
              top: 604,
              child: Switch(
                value: enabled,
                onChanged: (value) {
                  setState(() => enabled = value);
                  widget.onAlertChanged(value);
                },
                activeTrackColor: BreesColors.primary,
              ),
            ),
            if (enabled) ...[
              const Positioned(left: 20, right: 20, top: 669, child: LinearProgressIndicator(value: .8, minHeight: 5, backgroundColor: Color(0xFFE1E3E8), valueColor: AlwaysStoppedAnimation(BreesColors.primary))),
              Positioned(
                left: 221,
                top: 659,
                child: Container(
                  width: 49,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: BreesColors.primary, borderRadius: BorderRadius.circular(20)),
                  child: const Text('80%', style: TextStyle(color: Colors.white, fontSize: 10)),
                ),
              ),
            ],
            Positioned(left: 20, top: 706, child: BreesButton(label: 'Create budget', width: 335, height: 56, onPressed: widget.onCreate)),
            const HomeIndicator(),
          ],
        ),
      ),
    );
  }
}

class BudgetCreatedSuccessScreen extends StatelessWidget {
  const BudgetCreatedSuccessScreen({super.key, required this.onSeeBudget});

  final VoidCallback onSeeBudget;

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: const Color(0xFF432DEC),
      child: ColoredBox(
        color: const Color(0xFF432DEC),
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              child: BreesStatusBar(
                foreground: Colors.white,
                assetPath: 'assets/images/status_white.png',
              ),
            ),
            Positioned(left: 68, top: 175, width: 239, height: 239, child: Image.asset('assets/images/budget_success_piggy.png', fit: BoxFit.contain)),
            const Positioned(
              left: 32,
              right: 32,
              top: 426,
              child: Column(
                children: [
                  Text('Mmm... we love your\n“new budget” smell!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30, height: 1.12, fontWeight: FontWeight.w700)),
                  SizedBox(height: 18),
                  Text('Awesome! Your new Monthly Budget is\nup and running.', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFD8D3FF), fontSize: 15, height: 1.5)),
                ],
              ),
            ),
            Positioned(
              left: 24,
              top: 714,
              width: 327,
              height: 56,
              child: FilledButton(
                key: const Key('budget-see-budget'),
                onPressed: onSeeBudget,
                style: FilledButton.styleFrom(backgroundColor: Colors.white, foregroundColor: const Color(0xFF432DEC), shape: const StadiumBorder()),
                child: const Text('See my budget', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
              ),
            ),
            const HomeIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class BudgetDetailScreen extends StatelessWidget {
  const BudgetDetailScreen({super.key, required this.onBack, required this.inUse});

  final VoidCallback onBack;
  final bool inUse;

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: BreesColors.canvas,
      child: ColoredBox(
        color: BreesColors.canvas,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              width: 375,
              height: 278,
              child: ColoredBox(
                color: const Color(0xFF432DEC),
                child: Stack(
                  children: [
                    const Positioned(top: 0, child: BreesStatusBar(foreground: Colors.white, assetPath: 'assets/images/status_white.png')),
                    Positioned(left: 16, top: 48, child: _RoundAction(icon: Icons.chevron_left_rounded, color: const Color(0xFF3B23EB), iconColor: const Color(0xFFD9D4FF), onTap: onBack)),
                    const Positioned(left: 0, right: 0, top: 58, child: Text('Budget', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600))),
                    const Positioned(right: 16, top: 48, child: _RoundAction(icon: Icons.more_horiz_rounded, color: Color(0xFF3B23EB), iconColor: Color(0xFFD9D4FF))),
                    const Positioned(left: 20, top: 137, child: Text('Monthly Budget', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700))),
                    Positioned(left: 20, top: 180, child: Text(inUse ? r'You’ve spent   $392   for the past 7 days' : 'You don\'t have any transactions yet', style: const TextStyle(color: Colors.white, fontSize: 13))),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 227,
              width: 375,
              height: 585,
              child: Container(
                decoration: const BoxDecoration(color: BreesColors.canvas, borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
                child: Stack(
                  children: [
                    const Positioned(left: 20, top: 31, child: Text('What’s left to spend', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
                    Positioned(right: 20, top: 23, child: Text(inUse ? 'N17,041' : 'N18,241', style: const TextStyle(color: Color(0xFF040C22), fontSize: 24, fontWeight: FontWeight.w700))),
                    Positioned(
                      left: 20,
                      top: 73,
                      width: 335,
                      height: 152,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                        child: Stack(
                          children: [
                            const Positioned(left: 0, top: 0, child: Text('You’ve already spent', style: TextStyle(color: Color(0xFF5C616F), fontSize: 12))),
                            Positioned(left: 0, top: 27, child: Text(inUse ? 'N1,200' : 'N0', style: TextStyle(color: inUse ? BreesColors.primary : const Color(0xFF040C22), fontSize: 20, fontWeight: FontWeight.w700))),
                            const Positioned(right: 0, top: 0, child: Text('Spend Limit per Day', style: TextStyle(color: Color(0xFF5C616F), fontSize: 12))),
                            const Positioned(right: 0, top: 27, child: Text(r'$400', style: TextStyle(color: Color(0xFF040C22), fontSize: 20, fontWeight: FontWeight.w700))),
                            Positioned(left: 0, right: 0, top: 72, child: LinearProgressIndicator(value: inUse ? .22 : .01, minHeight: 10, backgroundColor: const Color(0xFFE2EDF7), valueColor: const AlwaysStoppedAnimation(Color(0xFF1EE66A),), borderRadius: BorderRadius.circular(8))),
                            const Positioned(left: 0, bottom: 0, child: Text('😘  Cool! let\'s keep your expense below the budget', style: TextStyle(fontSize: 11))),
                          ],
                        ),
                      ),
                    ),
                    if (inUse) ...[
                      const Positioned(left: 20, top: 247, child: Text('Budget Transactions', style: TextStyle(color: Color(0xFF0E1B42), fontSize: 14, fontWeight: FontWeight.w600))),
                      const Positioned(left: 20, top: 278, width: 335, height: 257, child: _BudgetTransactionsCard()),
                    ],
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

class BudgetListScreen extends StatelessWidget {
  const BudgetListScreen({
    super.key,
    required this.onBack,
    required this.onCreate,
    required this.onOpenBudget,
    required this.onHome,
    required this.onBudget,
    required this.onInsights,
    required this.onProfile,
  });

  final VoidCallback onBack;
  final VoidCallback onCreate;
  final VoidCallback onOpenBudget;
  final VoidCallback onHome;
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
            const Positioned(top: 0, child: BreesStatusBar(foreground: Colors.white, assetPath: 'assets/images/status_white.png')),
            Positioned(left: 16, top: 48, child: _RoundAction(icon: Icons.chevron_left_rounded, color: const Color(0xFF3B23EB), iconColor: const Color(0xFFD9D4FF), onTap: onBack)),
            const Positioned(left: 0, right: 0, top: 58, child: Text('Budget', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600))),
            const Positioned(right: 16, top: 48, child: _RoundAction(icon: Icons.more_horiz_rounded, color: Color(0xFF3B23EB), iconColor: Color(0xFFD9D4FF))),
            const Positioned(
              left: 102,
              top: 124,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(color: Colors.white, fontSize: 30),
                  children: [
                    TextSpan(text: 'N29,880', style: TextStyle(fontWeight: FontWeight.w800)),
                    TextSpan(text: ' left'),
                  ],
                ),
              ),
            ),
            const Positioned(left: 102, top: 174, child: Text('Out of N80,888 budgeted', style: TextStyle(color: Colors.white, fontSize: 14))),
            Positioned(
              left: 116,
              top: 222,
              width: 143,
              height: 37,
              child: FilledButton(
                key: const Key('budget-list-create'),
                onPressed: onCreate,
                style: FilledButton.styleFrom(backgroundColor: Colors.white, foregroundColor: const Color(0xFF0E0646), shape: const StadiumBorder()),
                child: const Text('+  Create new budget', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
              ),
            ),
            Positioned(
              left: 0,
              top: 302,
              width: 375,
              height: 510,
              child: Container(
                decoration: const BoxDecoration(color: BreesColors.canvas, borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
                child: Stack(
                  children: [
                    Positioned(left: 20, top: 29, child: _BudgetListCard(title: 'Monthly Budget', onTap: onOpenBudget)),
                    Positioned(left: 20, top: 217, child: _BudgetListCard(title: 'Weekly Budget', onTap: onOpenBudget)),
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
                activeTab: FinanceTab.budget,
                light: true,
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

class _BudgetListCard extends StatelessWidget {
  const _BudgetListCard({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 335,
        height: 171,
        decoration: BoxDecoration(color: const Color(0xFF4933E9), borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            Positioned(left: 16, top: 18, child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600))),
            const Positioned(left: 16, top: 51, child: CircleAvatar(radius: 20, backgroundColor: Color(0xFFFFEADD), child: Text('🎉'))),
            const Positioned(left: 64, top: 48, child: Text('Flexing Budget', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600))),
            const Positioned(left: 64, top: 70, child: Text('N140 daily', style: TextStyle(color: Color(0xFFDCD8FF), fontSize: 12))),
            const Positioned(right: 16, top: 57, child: Text('N18,241', style: TextStyle(color: Color(0xFF21F46A), fontSize: 14, fontWeight: FontWeight.w700))),
            const Positioned(left: 16, right: 16, top: 105, child: LinearProgressIndicator(value: .76, minHeight: 4, backgroundColor: Color(0xFF6B5AF0), valueColor: AlwaysStoppedAnimation(Color(0xFF21F46A)))),
            const Positioned(left: 16, top: 132, child: Text('😘  You are doing really great!', style: TextStyle(color: Colors.white, fontSize: 10))),
          ],
        ),
      ),
    );
  }
}

class _BudgetTransactionsCard extends StatelessWidget {
  const _BudgetTransactionsCard();

  @override
  Widget build(BuildContext context) {
    const rows = [
      ('J', 'John Ogaga', 'Zenith Bank 12:03 AM', '+N20,983', true),
      ('T', 'The Place Restaurant', 'GT-Bank 12:03 AM', '-N983', false),
      ('P', 'Transfer to Philip', 'GT-Bank 12:03 AM', '-N298', false),
      ('H', 'Habib Yogurt', 'GT-Bank 12:03 AM', '-N4,115', false),
    ];
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: List.generate(rows.length, (index) {
          final row = rows[index];
          return Positioned(
            left: 0,
            right: 0,
            top: index * 58.0,
            height: 50,
            child: Row(
              children: [
                CircleAvatar(radius: 18, backgroundColor: const Color(0xFFEEF2F8), child: Text(row.$1, style: const TextStyle(color: Color(0xFF005CEE)))),
                const SizedBox(width: 12),
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(left: 0, top: 3, right: 0, child: Text(row.$2, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
                      Positioned(left: 0, bottom: 3, right: 0, child: Text(row.$3, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF8F94A3), fontSize: 12))),
                    ],
                  ),
                ),
                Text(row.$4, style: TextStyle(color: row.$5 ? const Color(0xFF1B7A00) : const Color(0xFF050D2A), fontSize: 14, fontWeight: FontWeight.w600)),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _BudgetField extends StatelessWidget {
  const _BudgetField({
    required this.label,
    required this.value,
    this.valueColor = const Color(0xFF040C22),
    this.trailing,
  });

  final String label;
  final String value;
  final Color valueColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 61,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Stack(
        children: [
          Positioned(left: 20, top: 11, child: Text(label, style: const TextStyle(color: Color(0xFF5C616F), fontSize: 10, height: 12 / 10))),
          Positioned(left: 20, top: 31, right: 50, child: Text(value, maxLines: 1, style: TextStyle(color: valueColor, fontSize: 14, height: 17 / 14, fontWeight: FontWeight.w500))),
          if (trailing != null) Positioned(right: 18, top: 19, width: 24, height: 24, child: trailing!),
        ],
      ),
    );
  }
}

class _BudgetCalendar extends StatelessWidget {
  const _BudgetCalendar({required this.selectedDay, required this.weekly, required this.onSelected});

  final int selectedDay;
  final bool weekly;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    const weekdays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    return Column(
      children: [
        SizedBox(
          height: 35,
          child: Row(
            children: weekdays.map((day) => Expanded(child: Text(day, textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFF68708A), fontSize: 14)))).toList(),
          ),
        ),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7, mainAxisSpacing: 2, crossAxisSpacing: 2),
            itemCount: 30,
            itemBuilder: (context, index) {
              final day = index + 1;
              final inWeek = weekly && day >= 16 && day <= 23;
              final selected = day == selectedDay;
              return InkWell(
                onTap: () => onSelected(day),
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selected ? BreesColors.primary : inWeek ? const Color(0xFFE9E5FF) : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(day.toString(), style: TextStyle(color: selected ? Colors.white : const Color(0xFF10162B), fontSize: 14)),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _BudgetCardPreview extends StatelessWidget {
  const _BudgetCardPreview();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 171,
      decoration: BoxDecoration(color: const Color(0xFF4933E9), borderRadius: BorderRadius.circular(16)),
      child: const Stack(
        children: [
          Positioned(left: 16, top: 18, child: Text('Monthly Budget', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600))),
          Positioned(left: 16, top: 51, child: CircleAvatar(radius: 20, backgroundColor: Color(0xFFFFEADD), child: Text('🎉'))),
          Positioned(left: 64, top: 48, child: Text('Flexing Buget', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600))),
          Positioned(left: 64, top: 70, child: Text('N140 daily', style: TextStyle(color: Color(0xFFDCD8FF), fontSize: 12))),
          Positioned(right: 16, top: 57, child: Text('N18,241', style: TextStyle(color: Color(0xFF21F46A), fontSize: 14, fontWeight: FontWeight.w700))),
          Positioned(left: 16, right: 16, top: 105, child: LinearProgressIndicator(value: 0, minHeight: 4, backgroundColor: Color(0xFF6B5AF0), valueColor: AlwaysStoppedAnimation(Color(0xFF21F46A)))),
          Positioned(left: 16, top: 132, child: Text('😘  Ready to get your budget game started!!', style: TextStyle(color: Colors.white, fontSize: 10))),
        ],
      ),
    );
  }
}

class _MiniBankLogo extends StatelessWidget {
  const _MiniBankLogo();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: const Color(0xFF4A287C), borderRadius: BorderRadius.circular(7)),
      child: const Text('K', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
    );
  }
}

class _AmountButton extends StatelessWidget {
  const _AmountButton({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(radius: 18, backgroundColor: const Color(0xFFEAE6FF), child: Icon(icon, color: BreesColors.primary, size: 20)),
    );
  }
}

class _AmountChip extends StatelessWidget {
  const _AmountChip({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 83,
        height: 37,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: const Color(0xFFEAE6FF), borderRadius: BorderRadius.circular(20)),
        child: Text(label, style: const TextStyle(color: BreesColors.primary, fontSize: 14)),
      ),
    );
  }
}

class _RoundAction extends StatelessWidget {
  const _RoundAction({
    required this.icon,
    this.onTap,
    this.color = Colors.white,
    this.iconColor = BreesColors.ink,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Icon(icon, color: iconColor, size: 20),
      ),
    );
  }
}
