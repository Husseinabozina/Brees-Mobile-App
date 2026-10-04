import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_button.dart';
import '../../../../core/widgets/brees_status_bar.dart';
import '../../../../core/widgets/brees_top_nav.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../../../../core/widgets/home_indicator.dart';
import '../../domain/entities/finance_snapshot.dart';

class AccountListScreen extends StatelessWidget {
  const AccountListScreen({
    super.key,
    required this.snapshot,
    required this.onBack,
    required this.onOpenKuda,
    required this.onAddAccount,
  });

  final FinanceSnapshot snapshot;
  final VoidCallback onBack;
  final VoidCallback onOpenKuda;
  final VoidCallback onAddAccount;

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
            BreesTopNav(title: 'Account', onBack: onBack),
            Positioned(
              left: 0,
              right: 0,
              top: 148,
              child: Column(
                children: [
                  const Text(
                    'Your available balance is',
                    style: TextStyle(
                      color: Color(0xFF91919F),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    snapshot.availableBalanceLabel,
                    style: const TextStyle(
                      color: Color(0xFF161719),
                      fontSize: 36,
                      height: 32 / 36,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 292,
              child: Column(
                children: List.generate(snapshot.accounts.length, (index) {
                  final account = snapshot.accounts[index];
                  return GestureDetector(
                    onTap: index == 0 ? onOpenKuda : null,
                    child: Container(
                      width: 375,
                      height: 80,
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0x0A000000)),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            account.assetPath,
                            width: 48,
                            height: 48,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            account.name,
                            style: const TextStyle(
                              color: Color(0xFF212325),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            account.balanceLabel,
                            style: const TextStyle(
                              color: Color(0xFF212325),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            Positioned(
              left: 20,
              top: 691,
              child: BreesButton(
                key: const Key('account-add-new'),
                label: '+ Add new account',
                width: 335,
                onPressed: onAddAccount,
              ),
            ),
            const HomeIndicator(),
          ],
        ),
      ),
    );
  }
}
