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

  testWidgets('previously dead primary controls now navigate', (tester) async {
    await pumpStep(tester, BreesStep.login);

    await tester.tap(find.byKey(const Key('login-register')));
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.text('Welcome to Brees'), findsOneWidget);

    await tester.pumpWidget(const MaterialApp(home: BreesFlow(initialStep: BreesStep.accountList)));
    await tester.pump(const Duration(milliseconds: 450));
    await tester.tap(find.text('+ Add new account'));
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.text('Let’s get your account set up!'), findsOneWidget);

    expectNoFlutterException(tester, 'interaction must not produce a Flutter exception');
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
}
