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
import '../../../finance/presentation/pages/budget_screens.dart';
import '../../../finance/presentation/pages/home_auxiliary_screens.dart';
import '../../../finance/presentation/pages/home_dashboard_screen.dart';
import '../../../finance/presentation/pages/insights_screens.dart';
import '../../../finance/presentation/pages/profile_screens.dart';
import '../../../finance/presentation/pages/transaction_history_screens.dart';
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
  transactionSorted,
  notification,
  homeWelcome,
  budgetEmpty,
  transactions,
  transactionDetail,
  transactionFilter,
  homeSearch,
  budgetIntro,
  budgetCreateInitial,
  budgetCycleMonthly,
  budgetCycleWeekly,
  budgetCreateConfigured,
  budgetAmount,
  budgetPreviewOff,
  budgetPreviewOn,
  budgetCreatedSuccess,
  budgetDetailEmpty,
  budgetDetailInUse,
  budgetList,
  insightIntro,
  insights,
  reportExpense,
  reportIncome,
  reportBudget,
  reportQuote,
  profile,
  editProfile,
  settings,
  passwordSettings,
  notificationSettings,
  helpCenter,
  helpTopic,
  homeLoading,
}

class BreesFlow extends StatefulWidget {
  const BreesFlow({super.key, this.initialStep = BreesStep.launch});

  final BreesStep initialStep;

  @override
  State<BreesFlow> createState() => _BreesFlowState();
}

class _BreesFlowState extends State<BreesFlow> {
  late BreesStep _step;
  final List<BreesStep> _history = [];
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

  void _go(BreesStep step, {bool replace = false}) {
    if (_step == step) return;
    setState(() {
      if (!replace) {
        _history.add(_step);
      }
      _step = step;
    });
  }

  void _goRoot(BreesStep step) {
    setState(() {
      _history.clear();
      _step = step;
    });
  }

  void _back() {
    if (_history.isEmpty) return;
    setState(() {
      _step = _history.removeLast();
    });
  }

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

  void _openBudget() => _go(BreesStep.budgetEmpty);
  void _openInsights() => _go(BreesStep.insightIntro);
  void _openProfile() => _go(BreesStep.profile);

  @override
  Widget build(BuildContext context) {
    final screen = switch (_step) {
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
          onBack: _back,
          onSuccess: () => _go(BreesStep.signUpSuccess),
          onLogin: () => _go(BreesStep.login),
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
          onSkip: () => _go(BreesStep.login),
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
          onBack: _back,
          onPrimaryAction: () => _go(BreesStep.browserVerified),
        ),
      BreesStep.browserVerified => BrowserAccountScreen(
          key: const ValueKey('browser-verified'),
          message: 'Your account has been verified',
          onBack: _back,
          onPressed: () => _go(BreesStep.login),
        ),
      BreesStep.login => LoginScreen(
          key: const ValueKey('login'),
          onBack: _back,
          onForgotPassword: () => _go(BreesStep.forgotPassword),
          onLogin: () => _go(BreesStep.guidePostLogin),
          onRegister: () => _go(BreesStep.signUp),
        ),
      BreesStep.forgotPassword => ForgotPasswordScreen(
          key: const ValueKey('forgot-password'),
          onBack: _back,
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
          onBack: _back,
          onPrimaryAction: () => _go(BreesStep.browserCreatePassword),
        ),
      BreesStep.browserCreatePassword => BrowserAccountScreen(
          key: const ValueKey('browser-create-password'),
          showPasswordForm: true,
          message: '',
          onBack: _back,
          onPressed: () => _go(BreesStep.browserPasswordCreated),
        ),
      BreesStep.browserPasswordCreated => BrowserAccountScreen(
          key: const ValueKey('browser-password-created'),
          message:
              'Your password has been reset, you can\nnow log back into your brees account',
          onBack: _back,
          onPressed: () => _go(BreesStep.guidePostLogin),
        ),
      BreesStep.guidePostLogin => GetStartedGuideScreen(
          key: const ValueKey('guide-post-login'),
          includeSecurity: false,
          onEmail: () => _go(BreesStep.setupAccount),
          onAccount: () => _go(BreesStep.setupAccount),
          onSkip: () => _go(BreesStep.homeWelcome),
        ),
      BreesStep.setupAccount => SetupAccountIntroScreen(
          key: const ValueKey('setup-account'),
          onContinue: () => _go(BreesStep.monoConnect),
        ),
      BreesStep.monoConnect => MonoConnectScreen(
          key: const ValueKey('mono-connect'),
          onFinished: () => _goRoot(BreesStep.homeCompact),
        ),
      BreesStep.homeCompact => _financeScreen(
          () => HomeDashboardScreen(
            key: const ValueKey('home-compact'),
            snapshot: _financeController.snapshot!,
            extended: false,
            onOpenExtended: () => _go(BreesStep.homeExtended),
            onOpenAccounts: () => _go(BreesStep.accountList),
            onSortTransactions: () => _go(BreesStep.transactionSort),
            onNotifications: () => _go(BreesStep.notification),
            onSearch: () => _go(BreesStep.homeSearch),
            onTransactions: () => _go(BreesStep.transactions),
            onBudget: _openBudget,
            onInsights: _openInsights,
            onProfile: _openProfile,
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
            onNotifications: () => _go(BreesStep.notification),
            onSearch: () => _go(BreesStep.homeSearch),
            onTransactions: () => _go(BreesStep.transactions),
            onBudget: _openBudget,
            onInsights: () {},
            onProfile: _openProfile,
          ),
        ),
      BreesStep.accountList => _financeScreen(
          () => AccountListScreen(
            key: const ValueKey('account-list'),
            snapshot: _financeController.snapshot!,
            onBack: _back,
            onOpenKuda: () => _go(BreesStep.accountDetail),
            onAddAccount: () => _go(BreesStep.setupAccount),
          ),
        ),
      BreesStep.accountDetail => _financeScreen(
          () => AccountDetailScreen(
            key: const ValueKey('account-detail'),
            snapshot: _financeController.snapshot!,
            onBack: _back,
          ),
        ),
      BreesStep.transactionSort => TransactionSortScreen(
          key: const ValueKey('transaction-sort'),
          onBack: _back,
          onFinished: () => _go(BreesStep.transactionSorted),
        ),
      BreesStep.transactionSorted => TransactionsSortedScreen(
          key: const ValueKey('transaction-sorted'),
          onContinue: () => _goRoot(BreesStep.homeCompact),
        ),
      BreesStep.notification => NotificationScreen(
          key: const ValueKey('notification'),
          onBack: _back,
        ),
      BreesStep.homeWelcome => HomeWelcomeScreen(
          key: const ValueKey('home-welcome'),
          onAddAccount: () => _go(BreesStep.setupAccount),
          onHome: () => _goRoot(BreesStep.homeCompact),
          onBudget: _openBudget,
          onInsights: _openInsights,
          onProfile: _openProfile,
          onNotifications: () => _go(BreesStep.notification),
          onSearch: () => _go(BreesStep.homeSearch),
        ),
      BreesStep.budgetEmpty => BudgetEmptyScreen(
          key: const ValueKey('budget-empty'),
          onBack: _back,
          onIntro: () => _go(BreesStep.budgetIntro),
          onHome: () => _goRoot(BreesStep.homeCompact),
          onBudget: () {},
          onInsights: _openInsights,
          onProfile: _openProfile,
        ),
      BreesStep.transactions => _financeScreen(
          () => TransactionsScreen(
            key: const ValueKey('transactions'),
            snapshot: _financeController.snapshot!,
            onBack: _back,
            onFilter: () => _go(BreesStep.transactionFilter),
            onOpenTransaction: () => _go(BreesStep.transactionDetail),
          ),
        ),
      BreesStep.transactionDetail => TransactionDetailScreen(
          key: const ValueKey('transaction-detail'),
          onBack: _back,
        ),
      BreesStep.transactionFilter => TransactionFilterScreen(
          key: const ValueKey('transaction-filter'),
          onBack: _back,
          onContinue: () => _go(BreesStep.transactions),
        ),
      BreesStep.homeSearch => HomeSearchScreen(
          key: const ValueKey('home-search'),
          onClose: _back,
          onOpenTransactions: () => _go(BreesStep.transactions),
        ),
      BreesStep.budgetIntro => BudgetIntroScreen(
          key: const ValueKey('budget-intro'),
          onClose: _back,
          onCreate: () => _go(BreesStep.budgetCreateInitial),
          background: BudgetEmptyScreen(
            onBack: () {},
            onIntro: () {},
            onHome: () {},
            onBudget: () {},
            onInsights: () {},
            onProfile: () {},
          ),
        ),
      BreesStep.budgetCreateInitial => BudgetCreateBasicsScreen(
          key: const ValueKey('budget-create-initial'),
          onBack: _back,
          onCycle: () => _go(BreesStep.budgetCycleMonthly),
          onContinue: () => _go(BreesStep.budgetCycleMonthly),
        ),
      BreesStep.budgetCycleMonthly => BudgetCycleScreen(
          key: const ValueKey('budget-cycle-monthly'),
          weekly: false,
          onBack: _back,
          onSwitchFrequency: () => _go(BreesStep.budgetCycleWeekly),
          onSetCycle: () => _go(BreesStep.budgetCreateConfigured),
        ),
      BreesStep.budgetCycleWeekly => BudgetCycleScreen(
          key: const ValueKey('budget-cycle-weekly'),
          weekly: true,
          onBack: _back,
          onSwitchFrequency: () => _go(BreesStep.budgetCycleMonthly),
          onSetCycle: () => _go(BreesStep.budgetCreateConfigured),
        ),
      BreesStep.budgetCreateConfigured => BudgetCreateBasicsScreen(
          key: const ValueKey('budget-create-configured'),
          configured: true,
          onBack: _back,
          onCycle: () => _go(BreesStep.budgetCycleWeekly),
          onContinue: () => _go(BreesStep.budgetAmount),
        ),
      BreesStep.budgetAmount => BudgetAmountScreen(
          key: const ValueKey('budget-amount'),
          onBack: _back,
          onNext: () => _go(BreesStep.budgetPreviewOff),
        ),
      BreesStep.budgetPreviewOff => BudgetPreviewScreen(
          key: const ValueKey('budget-preview-off'),
          alertEnabled: false,
          onBack: _back,
          onAlertChanged: (enabled) {
            if (enabled) _go(BreesStep.budgetPreviewOn, replace: true);
          },
          onCreate: () => _go(BreesStep.budgetCreatedSuccess),
        ),
      BreesStep.budgetPreviewOn => BudgetPreviewScreen(
          key: const ValueKey('budget-preview-on'),
          alertEnabled: true,
          onBack: _back,
          onAlertChanged: (enabled) {
            if (!enabled) _go(BreesStep.budgetPreviewOff, replace: true);
          },
          onCreate: () => _go(BreesStep.budgetCreatedSuccess),
        ),
      BreesStep.budgetCreatedSuccess => BudgetCreatedSuccessScreen(
          key: const ValueKey('budget-created-success'),
          onSeeBudget: () => _go(BreesStep.budgetDetailEmpty),
        ),
      BreesStep.budgetDetailEmpty => BudgetDetailScreen(
          key: const ValueKey('budget-detail-empty'),
          inUse: false,
          onBack: () => _go(BreesStep.budgetList),
        ),
      BreesStep.budgetDetailInUse => BudgetDetailScreen(
          key: const ValueKey('budget-detail-in-use'),
          inUse: true,
          onBack: _back,
        ),
      BreesStep.budgetList => BudgetListScreen(
          key: const ValueKey('budget-list'),
          onBack: () => _goRoot(BreesStep.homeCompact),
          onCreate: () => _go(BreesStep.budgetIntro),
          onOpenBudget: () => _go(BreesStep.budgetDetailInUse),
          onHome: () => _goRoot(BreesStep.homeCompact),
          onBudget: () {},
          onInsights: _openInsights,
          onProfile: _openProfile,
        ),
      BreesStep.insightIntro => InsightIntroScreen(
          key: const ValueKey('insight-intro'),
          onClose: _back,
          onViewInsights: () => _go(BreesStep.insights),
          background: InsightsScreen(
            onHome: () {},
            onBudget: () {},
            onProfile: () {},
            onOpenReport: () {},
          ),
        ),
      BreesStep.insights => InsightsScreen(
          key: const ValueKey('insights'),
          onHome: () => _goRoot(BreesStep.homeCompact),
          onBudget: _openBudget,
          onProfile: _openProfile,
          onOpenReport: () => _go(BreesStep.reportExpense),
        ),
      BreesStep.reportExpense => FinancialReportScreen(
          key: const ValueKey('report-expense'),
          kind: FinancialReportKind.expense,
          onNext: () => _go(BreesStep.reportIncome),
        ),
      BreesStep.reportIncome => FinancialReportScreen(
          key: const ValueKey('report-income'),
          kind: FinancialReportKind.income,
          onNext: () => _go(BreesStep.reportBudget),
        ),
      BreesStep.reportBudget => FinancialReportScreen(
          key: const ValueKey('report-budget'),
          kind: FinancialReportKind.budget,
          onNext: () => _go(BreesStep.reportQuote),
        ),
      BreesStep.reportQuote => FinancialReportScreen(
          key: const ValueKey('report-quote'),
          kind: FinancialReportKind.quote,
          onNext: () => _goRoot(BreesStep.insights),
        ),
      BreesStep.profile => ProfileScreen(
          key: const ValueKey('profile'),
          onHome: () => _goRoot(BreesStep.homeCompact),
          onBudget: _openBudget,
          onInsights: _openInsights,
          onEditProfile: () => _go(BreesStep.editProfile),
          onSettings: () => _go(BreesStep.settings),
          onHelpCenter: () => _go(BreesStep.helpCenter),
        ),
      BreesStep.editProfile => EditProfileScreen(
          key: const ValueKey('edit-profile'),
          onBack: _back,
          onSave: _back,
        ),
      BreesStep.settings => SettingsScreen(
          key: const ValueKey('settings'),
          onBack: _back,
          onPassword: () => _go(BreesStep.passwordSettings),
          onNotifications: () => _go(BreesStep.notificationSettings),
        ),
      BreesStep.passwordSettings => PasswordSettingsScreen(
          key: const ValueKey('password-settings'),
          onBack: _back,
          onSave: _back,
        ),
      BreesStep.notificationSettings => NotificationSettingsScreen(
          key: const ValueKey('notification-settings'),
          onBack: _back,
        ),
      BreesStep.helpCenter => HelpCenterScreen(
          key: const ValueKey('help-center'),
          onBack: _back,
          onTopic: () => _go(BreesStep.helpTopic),
        ),
      BreesStep.helpTopic => HelpCenterTopicScreen(
          key: const ValueKey('help-topic'),
          onBack: _back,
        ),
      BreesStep.homeLoading => HomeLoadingScreen(
          key: const ValueKey('home-loading'),
          onFinished: () => _goRoot(BreesStep.homeCompact),
          onHome: () => _goRoot(BreesStep.homeCompact),
          onBudget: _openBudget,
          onInsights: _openInsights,
          onProfile: _openProfile,
        ),
    };

    return PopScope(
      canPop: _history.isEmpty,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) _back();
      },
      child: Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 320),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          transitionBuilder: (child, animation) {
            final offset = Tween(
              begin: const Offset(0.025, 0),
              end: Offset.zero,
            ).animate(animation);
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(position: offset, child: child),
            );
          },
          child: screen,
        ),
      ),
    );
  }
}
