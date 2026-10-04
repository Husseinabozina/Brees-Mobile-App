import 'package:brees_mobile_app/src/features/onboarding/presentation/pages/brees_flow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  void setReferenceViewport(WidgetTester tester) {
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  }

  Future<void> pumpStep(WidgetTester tester, BreesStep step) async {
    setReferenceViewport(tester);
    await tester.pumpWidget(
      MaterialApp(home: BreesFlow(initialStep: step)),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 450));
  }

  void expectNoFlutterException(WidgetTester tester, String reason) {
    final exception = tester.takeException();
    if (exception is FlutterError) {
      debugPrint(exception.toStringDeep());
    }
    expect(exception, isNull, reason: reason);
  }

  const regressionSteps = <BreesStep>[
    BreesStep.homeExtended,
    BreesStep.transactionSorted,
    BreesStep.notification,
    BreesStep.homeWelcome,
    BreesStep.budgetEmpty,
    BreesStep.transactions,
    BreesStep.transactionDetail,
    BreesStep.transactionFilter,
    BreesStep.homeSearch,
    BreesStep.budgetIntro,
    BreesStep.budgetCreateInitial,
    BreesStep.budgetCycleMonthly,
    BreesStep.budgetCycleWeekly,
    BreesStep.budgetCreateConfigured,
    BreesStep.budgetAmount,
    BreesStep.budgetPreviewOff,
    BreesStep.budgetPreviewOn,
    BreesStep.budgetCreatedSuccess,
    BreesStep.budgetDetailEmpty,
    BreesStep.budgetDetailInUse,
    BreesStep.budgetList,
    BreesStep.insightIntro,
    BreesStep.insights,
    BreesStep.reportExpense,
    BreesStep.reportIncome,
    BreesStep.reportBudget,
    BreesStep.reportQuote,
    BreesStep.profile,
    BreesStep.editProfile,
    BreesStep.settings,
    BreesStep.passwordSettings,
    BreesStep.notificationSettings,
    BreesStep.helpCenter,
    BreesStep.helpTopic,
    BreesStep.homeLoading,
  ];

  for (final step in regressionSteps) {
    testWidgets('$step renders without layout exceptions', (tester) async {
      await pumpStep(tester, step);

      expectNoFlutterException(
        tester,
        '$step must not produce RenderFlex overflow or other layout exceptions.',
      );

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
    });
  }

  testWidgets('Gmail visible back arrow returns to inbox', (tester) async {
    await pumpStep(tester, BreesStep.emailVerificationSent);

    await tester.tap(find.text('Open Email'));
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.text('Search in mail'), findsOneWidget);

    await tester.tap(find.text('Brees:  Forgot password'));
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.byKey(const Key('gmail-open-back')), findsOneWidget);

    await tester.tap(find.byKey(const Key('gmail-open-back')));
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.text('Search in mail'), findsOneWidget);
    expectNoFlutterException(tester, 'interaction must not produce a Flutter exception');
  });

  testWidgets('Android system back follows in-app Brees history', (tester) async {
    await pumpStep(tester, BreesStep.emailVerificationSent);

    await tester.tap(find.text('Open Email'));
    await tester.pump(const Duration(milliseconds: 350));
    await tester.tap(find.text('Brees:  Forgot password'));
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.byKey(const Key('gmail-open-back')), findsOneWidget);

    await tester.binding.handlePopRoute();
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.text('Search in mail'), findsOneWidget);
    expectNoFlutterException(tester, 'interaction must not produce a Flutter exception');
  });

  testWidgets('sign up login action opens login instead of submitting registration', (tester) async {
    await pumpStep(tester, BreesStep.signUp);

    expect(find.byKey(const Key('signup-login')), findsOneWidget);
    await tester.tap(find.byKey(const Key('signup-login')));
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.text('Welcome back'), findsOneWidget);
    expectNoFlutterException(
      tester,
      'sign up login interaction must not produce a Flutter exception',
    );
  });

  testWidgets('login register action now navigates', (tester) async {
    await pumpStep(tester, BreesStep.login);

    await tester.tap(find.byKey(const Key('login-register')));
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.text('Welcome to Brees'), findsOneWidget);

    expectNoFlutterException(
      tester,
      'login register interaction must not produce a Flutter exception',
    );
  });

  testWidgets('account add action now navigates', (tester) async {
    await pumpStep(tester, BreesStep.accountList);

    expect(find.byKey(const Key('account-add-new')), findsOneWidget);
    await tester.tap(find.byKey(const Key('account-add-new')));
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.text('Let’s get your account set up!'), findsOneWidget);

    expectNoFlutterException(
      tester,
      'account add interaction must not produce a Flutter exception',
    );
  });

  testWidgets('home notification and search actions are interactive', (tester) async {
    await pumpStep(tester, BreesStep.homeCompact);

    await tester.tap(find.byKey(const Key('home-notifications')));
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.text('Notification'), findsOneWidget);

    await tester.binding.handlePopRoute();
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.byKey(const Key('home-search')), findsOneWidget);

    await tester.tap(find.byKey(const Key('home-search')));
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.text('James'), findsOneWidget);

    expectNoFlutterException(tester, 'interaction must not produce a Flutter exception');
  });

  testWidgets('budget creation controls traverse the new flow', (tester) async {
    await pumpStep(tester, BreesStep.budgetEmpty);

    await tester.tap(find.byKey(const Key('budget-add-new')));
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.byKey(const Key('budget-intro-create')), findsOneWidget);

    await tester.tap(find.byKey(const Key('budget-intro-create')));
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.byKey(const Key('budget-cycle-field')), findsOneWidget);

    await tester.tap(find.byKey(const Key('budget-cycle-field')));
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.text('Monthly'), findsOneWidget);

    await tester.tap(find.byKey(const Key('budget-cycle-frequency')));
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.text('Weekly'), findsOneWidget);

    expectNoFlutterException(tester, 'interaction must not produce a Flutter exception');
  });

  testWidgets('insights report story traverses all four report screens', (tester) async {
    await pumpStep(tester, BreesStep.insightIntro);

    expect(find.text('Get your insights'), findsOneWidget);
    await tester.tap(find.text('View Insights'));
    await tester.pumpAndSettle();

    final insightsScreen = find.byKey(const ValueKey('insights'));
    expect(
      find.descendant(
        of: insightsScreen,
        matching: find.text('Recent updates'),
      ),
      findsOneWidget,
    );
    await tester.tap(
      find.descendant(
        of: insightsScreen,
        matching: find.text('Brees'),
      ),
    );
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.text('You Spend 💸'), findsOneWidget);
    await tester.tapAt(const Offset(180, 400));
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.text('You Earned 💰'), findsOneWidget);

    await tester.tapAt(const Offset(180, 400));
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.text('2 of 12 Budget is\nexceeds the limit'), findsOneWidget);

    await tester.tapAt(const Offset(180, 400));
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.textContaining('Financial freedom'), findsOneWidget);

    expectNoFlutterException(
      tester,
      'insight report story must not produce a Flutter exception',
    );
  });

  testWidgets('profile settings and help center actions navigate', (tester) async {
    await pumpStep(tester, BreesStep.profile);

    expect(find.text('Donye Collins'), findsOneWidget);
    await tester.tap(find.text('Settings'));
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.text('Reset Password'), findsOneWidget);

    await tester.binding.handlePopRoute();
    await tester.pump(const Duration(milliseconds: 350));
    await tester.tap(find.text('Help Center'));
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.text('Have a burning Question?'), findsOneWidget);
    await tester.tap(find.text('How to add bank account to Brees?').first);
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.text('Topic details'), findsOneWidget);

    expectNoFlutterException(
      tester,
      'profile and help center flow must not produce a Flutter exception',
    );
  });

}
