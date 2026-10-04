import 'package:brees_mobile_app/src/app/brees_app.dart';
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
    await tester.pump(const Duration(milliseconds: 700));
  }

  testWidgets('launch screen matches the 375x812 design canvas', (tester) async {
    setReferenceViewport(tester);
    await tester.pumpWidget(const BreesApp());
    await tester.pump(const Duration(milliseconds: 1100));

    expect(find.byKey(const Key('launch-logo')), findsOneWidget);
    expect(
      tester.getSize(find.byKey(const Key('brees-design-canvas'))),
      const Size(375, 812),
    );

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();
  });

  testWidgets('onboarding contains the three Figma messages', (tester) async {
    await pumpStep(tester, BreesStep.onboarding);

    expect(find.text('You ought to know where\nyour money goes'), findsOneWidget);

    await tester.drag(
      find.byKey(const Key('onboarding-page-view')),
      const Offset(-330, 0),
    );
    await tester.pumpAndSettle();

    expect(find.text('Gain total\ncontrol of your money'), findsOneWidget);
  });

  testWidgets('sign up validates terms and reaches success', (tester) async {
    await pumpStep(tester, BreesStep.signUp);

    expect(find.text('Welcome to Brees'), findsOneWidget);

    await tester.tap(find.byKey(const Key('terms-checkbox')));
    await tester.tap(find.byKey(const Key('register-button')));
    await tester.pump(const Duration(milliseconds: 1000));

    expect(find.textContaining('Hi!'), findsOneWidget);
    expect(find.byKey(const Key('success-continue')), findsOneWidget);
  });

  testWidgets('verification guide opens email verification flow', (tester) async {
    await pumpStep(tester, BreesStep.guidePreVerification);

    expect(find.text('Get started'), findsOneWidget);
    expect(find.text('Setup a security pin'), findsOneWidget);

    await tester.tap(find.text('Verify your email address'));
    await tester.pumpAndSettle();

    expect(
      find.text('We have sent an email\nverification link to your email'),
      findsOneWidget,
    );
    expect(find.text('Open Email'), findsOneWidget);
  });

  testWidgets('login opens forgot password screen', (tester) async {
    await pumpStep(tester, BreesStep.login);

    expect(find.text('Welcome back'), findsOneWidget);
    await tester.tap(find.text('Forgot Password?'));
    await tester.pumpAndSettle();

    expect(find.text('Forgot Password'), findsOneWidget);
    expect(find.textContaining('Enter your email'), findsOneWidget);
  });

  testWidgets('compact home exposes budget, accounts and sorting entry', (tester) async {
    await pumpStep(tester, BreesStep.homeCompact);
    await tester.pumpAndSettle();

    expect(find.text('Hello '), findsNothing);
    expect(find.textContaining('John'), findsWidgets);
    expect(find.text('N20,983'), findsOneWidget);
    expect(find.text('Sort your transactions\n'), findsNothing);
    expect(find.byKey(const Key('home-sort-transactions')), findsOneWidget);
    expect(find.byKey(const Key('home-open-extended')), findsOneWidget);
  });

  testWidgets('account list opens Kuda account details', (tester) async {
    await pumpStep(tester, BreesStep.accountList);
    await tester.pumpAndSettle();

    expect(find.text('Account'), findsOneWidget);
    expect(find.text('Kuda bank'), findsOneWidget);

    await tester.tap(find.text('Kuda bank'));
    await tester.pumpAndSettle();

    expect(find.text('My Account'), findsOneWidget);
    expect(find.text('1234567890'), findsOneWidget);
  });

  testWidgets('transaction sorter matches first-card content', (tester) async {
    await pumpStep(tester, BreesStep.transactionSort);

    expect(find.text('Sort your transactions'), findsOneWidget);
    expect(find.text('1 of 20'), findsOneWidget);
    expect(find.text('Utilities'), findsOneWidget);
    expect(find.text('Lawma'), findsOneWidget);
    expect(find.byKey(const Key('sort-approve')), findsOneWidget);
  });
}
