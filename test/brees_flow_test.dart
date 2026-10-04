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

  testWidgets('launch screen matches the 375x812 design canvas', (tester) async {
    setReferenceViewport(tester);
    await tester.pumpWidget(const BreesApp());
    await tester.pump(const Duration(milliseconds: 1100));

    expect(find.byKey(const Key('launch-logo')), findsOneWidget);
    expect(
      tester.getSize(find.byKey(const Key('brees-design-canvas'))),
      const Size(375, 812),
    );
  });

  testWidgets('onboarding contains the three Figma messages', (tester) async {
    setReferenceViewport(tester);
    await tester.pumpWidget(
      const MaterialApp(
        home: BreesFlow(initialStep: BreesStep.onboarding),
      ),
    );
    await tester.pump(const Duration(milliseconds: 700));

    expect(find.text('You ought to know where\nyour money goes'), findsOneWidget);

    await tester.drag(
      find.byKey(const Key('onboarding-page-view')),
      const Offset(-330, 0),
    );
    await tester.pumpAndSettle();

    expect(find.text('Gain total\ncontrol of your money'), findsOneWidget);
  });

  testWidgets('sign up validates terms and reaches success', (tester) async {
    setReferenceViewport(tester);
    await tester.pumpWidget(
      const MaterialApp(
        home: BreesFlow(initialStep: BreesStep.signUp),
      ),
    );
    await tester.pump(const Duration(milliseconds: 600));

    expect(find.text('Welcome to Brees'), findsOneWidget);

    await tester.tap(find.byKey(const Key('terms-checkbox')));
    await tester.tap(find.byKey(const Key('register-button')));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.textContaining('Hi!'), findsOneWidget);
    expect(find.byKey(const Key('success-continue')), findsOneWidget);
  });
}
