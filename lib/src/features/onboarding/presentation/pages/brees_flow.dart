import 'package:flutter/material.dart';

import '../../../auth/data/repositories/demo_auth_repository.dart';
import '../../../auth/domain/usecases/register_user.dart';
import '../../../auth/presentation/controllers/sign_up_controller.dart';
import '../../../auth/presentation/pages/browser_account_screen.dart';
import '../../../auth/presentation/pages/email_notice_screen.dart';
import '../../../auth/presentation/pages/forgot_password_screen.dart';
import '../../../auth/presentation/pages/login_screen.dart';
import '../../../auth/presentation/pages/sign_up_screen.dart';
import '../../../auth/presentation/pages/sign_up_success_screen.dart';
import '../../../finance/data/repositories/demo_finance_repository.dart';
import '../../../finance/domain/usecases/load_finance_snapshot.dart';
import '../../../finance/presentation/controllers/finance_controller.dart';
import '../../../finance/presentation/pages/account_detail_screen.dart';
import '../../../finance/presentation/pages/account_list_screen.dart';
import '../../../finance/presentation/pages/home_dashboard_screen.dart';
import '../../../finance/presentation/pages/transaction_sort_screen.dart';
import '../../../system_preview/presentation/pages/gmail_inbox_screen.dart';
import '../../../system_preview/presentation/pages/gmail_open_mail_screen.dart';
import 'get_started_guide_screen.dart';
import 'launch_screen.dart';
import 'mono_connect_screen.dart';
import 'onboarding_screen.dart';
import 'setup_account_intro_screen.dart';

enum BreesStep {
  launch,
  onboarding,
  signUp,
  signUpSuccess,
  guidePreVerification,
  emailVerificationSent,
  gmailInboxVerification,
  openMailVerification,
  browserVerified,
  login,
  forgotPassword,
  forgotEmailSent,
  gmailInboxReset,
  openMailReset,
  browserCreatePassword,
  browserPasswordCreated,
  guidePostLogin,
  setupAccount,
  monoConnect,
  homeCompact,
  homeExtended,
  accountList,
  accountDetail,
  transactionSort,
}

class BreesFlow extends StatefulWidget {
  const BreesFlow({super.key, this.initialStep = BreesStep.launch});

  final BreesStep initialStep;

  @override
  State<BreesFlow> createState() => _BreesFlowState();
}

class _BreesFlowState extends State<BreesFlow> {
  late BreesStep _step;
  late final SignUpController _signUpController;
  late final FinanceController _financeController;

  @override
  void initState() {
    super.initState();
    _step = widget.initialStep;
    _signUpController = SignUpController(
      RegisterUser(DemoAuthRepository()),
    );
    _financeController = FinanceController(
      LoadFinanceSnapshot(DemoFinanceRepository()),
    )..ensureLoaded();
  }

  @override
  void dispose() {
    _signUpController.dispose();
    _financeController.dispose();
    super.dispose();
  }

  void _go(BreesStep step) => setState(() => _step = step);

  Widget _financeScreen(Widget Function() builder) {
    return AnimatedBuilder(
      animation: _financeController,
      builder: (context, _) {
        if (_financeController.snapshot == null) {
          return const ColoredBox(
            color: Color(0xFF2C14DD),
            child: Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          );
        }
        return builder();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 420),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        transitionBuilder: (child, animation) {
          final offset = Tween(
            begin: const Offset(0.035, 0),
            end: Offset.zero,
          ).animate(animation);
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(position: offset, child: child),
          );
        },
        child: switch (_step) {
          BreesStep.launch => LaunchScreen(
              key: const ValueKey('launch'),
              onFinished: () => _go(BreesStep.onboarding),
            ),
          BreesStep.onboarding => OnboardingScreen(
              key: const ValueKey('onboarding'),
              onCompleted: () => _go(BreesStep.signUp),
            ),
          BreesStep.signUp => SignUpScreen(
              key: const ValueKey('signup'),
              controller: _signUpController,
              onBack: () => _go(BreesStep.onboarding),
              onSuccess: () => _go(BreesStep.signUpSuccess),
            ),
          BreesStep.signUpSuccess => SignUpSuccessScreen(
              key: const ValueKey('signup-success'),
              onContinue: () => _go(BreesStep.guidePreVerification),
            ),
          BreesStep.guidePreVerification => GetStartedGuideScreen(
              key: const ValueKey('guide-pre-verification'),
              includeSecurity: true,
              onEmail: () => _go(BreesStep.emailVerificationSent),
              onAccount: () => _go(BreesStep.emailVerificationSent),
            ),
          BreesStep.emailVerificationSent => EmailNoticeScreen(
              key: const ValueKey('email-verification-sent'),
              title: 'We have sent an email\nverification link to your email',
              body:
                  'Check your email test@test.com and click\nthe link to verify your email address',
              buttonLabel: 'Open Email',
              onPressed: () => _go(BreesStep.gmailInboxVerification),
            ),
          BreesStep.gmailInboxVerification => GmailInboxScreen(
              key: const ValueKey('gmail-verification'),
              onOpenBreesMail: () => _go(BreesStep.openMailVerification),
            ),
          BreesStep.openMailVerification => GmailOpenMailScreen(
              key: const ValueKey('open-mail-verification'),
              actionLabel: 'Verify email',
              onPrimaryAction: () => _go(BreesStep.browserVerified),
            ),
          BreesStep.browserVerified => BrowserAccountScreen(
              key: const ValueKey('browser-verified'),
              message: 'Your account has been verified',
              onPressed: () => _go(BreesStep.login),
            ),
          BreesStep.login => LoginScreen(
              key: const ValueKey('login'),
              onBack: () => _go(BreesStep.signUp),
              onForgotPassword: () => _go(BreesStep.forgotPassword),
              onLogin: () => _go(BreesStep.guidePostLogin),
            ),
          BreesStep.forgotPassword => ForgotPasswordScreen(
              key: const ValueKey('forgot-password'),
              onBack: () => _go(BreesStep.login),
              onContinue: () => _go(BreesStep.forgotEmailSent),
            ),
          BreesStep.forgotEmailSent => EmailNoticeScreen(
              key: const ValueKey('forgot-email-sent'),
              title: 'Your email is on the way',
              body:
                  'Check your email test@test.com and\nfollow the instructions to reset your\npassword',
              buttonLabel: 'Continue',
              onPressed: () => _go(BreesStep.gmailInboxReset),
            ),
          BreesStep.gmailInboxReset => GmailInboxScreen(
              key: const ValueKey('gmail-reset'),
              onOpenBreesMail: () => _go(BreesStep.openMailReset),
            ),
          BreesStep.openMailReset => GmailOpenMailScreen(
              key: const ValueKey('open-mail-reset'),
              onPrimaryAction: () => _go(BreesStep.browserCreatePassword),
            ),
          BreesStep.browserCreatePassword => BrowserAccountScreen(
              key: const ValueKey('browser-create-password'),
              showPasswordForm: true,
              message: '',
              onPressed: () => _go(BreesStep.browserPasswordCreated),
            ),
          BreesStep.browserPasswordCreated => BrowserAccountScreen(
              key: const ValueKey('browser-password-created'),
              message:
                  'Your password has been reset, you can\nnow log back into your brees account',
              onPressed: () => _go(BreesStep.guidePostLogin),
            ),
          BreesStep.guidePostLogin => GetStartedGuideScreen(
              key: const ValueKey('guide-post-login'),
              includeSecurity: false,
              onEmail: () => _go(BreesStep.setupAccount),
              onAccount: () => _go(BreesStep.setupAccount),
            ),
          BreesStep.setupAccount => SetupAccountIntroScreen(
              key: const ValueKey('setup-account'),
              onContinue: () => _go(BreesStep.monoConnect),
            ),
          BreesStep.monoConnect => MonoConnectScreen(
              key: const ValueKey('mono-connect'),
              onFinished: () => _go(BreesStep.homeCompact),
            ),
          BreesStep.homeCompact => _financeScreen(
              () => HomeDashboardScreen(
                key: const ValueKey('home-compact'),
                snapshot: _financeController.snapshot!,
                extended: false,
                onOpenExtended: () => _go(BreesStep.homeExtended),
                onOpenAccounts: () => _go(BreesStep.accountList),
                onSortTransactions: () => _go(BreesStep.transactionSort),
              ),
            ),
          BreesStep.homeExtended => _financeScreen(
              () => HomeDashboardScreen(
                key: const ValueKey('home-extended'),
                snapshot: _financeController.snapshot!,
                extended: true,
                onOpenExtended: () {},
                onOpenAccounts: () => _go(BreesStep.accountList),
                onSortTransactions: () => _go(BreesStep.transactionSort),
              ),
            ),
          BreesStep.accountList => _financeScreen(
              () => AccountListScreen(
                key: const ValueKey('account-list'),
                snapshot: _financeController.snapshot!,
                onBack: () => _go(BreesStep.homeCompact),
                onOpenKuda: () => _go(BreesStep.accountDetail),
              ),
            ),
          BreesStep.accountDetail => _financeScreen(
              () => AccountDetailScreen(
                key: const ValueKey('account-detail'),
                snapshot: _financeController.snapshot!,
                onBack: () => _go(BreesStep.accountList),
              ),
            ),
          BreesStep.transactionSort => TransactionSortScreen(
              key: const ValueKey('transaction-sort'),
              onBack: () => _go(BreesStep.homeCompact),
              onFinished: () => _go(BreesStep.homeCompact),
            ),
        },
      ),
    );
  }
}
