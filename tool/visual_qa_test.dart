import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:brees_mobile_app/src/core/theme/brees_theme.dart';
import 'package:brees_mobile_app/src/features/onboarding/presentation/pages/brees_flow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class _VisualCase {
  const _VisualCase(
    this.number,
    this.nodeId,
    this.step, {
    this.onboardingPage,
    this.captureDelayMs = 650,
  });

  final int number;
  final String nodeId;
  final BreesStep step;
  final int? onboardingPage;
  final int captureDelayMs;

  String get fileStem =>
      '${number.toString().padLeft(2, '0')}_${nodeId.replaceAll(':', '-')}';

  String get referencePath => 'references/visual_qa/$fileStem.png';
}

class _Metrics {
  const _Metrics({
    required this.similarity,
    required this.meanAbsoluteError,
    required this.changedPixelRatio,
    required this.width,
    required this.height,
  });

  final double similarity;
  final double meanAbsoluteError;
  final double changedPixelRatio;
  final int width;
  final int height;
}

const _cases = <_VisualCase>[
  _VisualCase(1, '3:1820', BreesStep.launch, captureDelayMs: 1000),
  _VisualCase(2, '3:1853', BreesStep.onboarding, onboardingPage: 0),
  _VisualCase(3, '3:1878', BreesStep.onboarding, onboardingPage: 1),
  _VisualCase(4, '3:1903', BreesStep.onboarding, onboardingPage: 2),
  _VisualCase(5, '3:1932', BreesStep.signUp),
  _VisualCase(6, '3:2001', BreesStep.signUpSuccess),
  _VisualCase(7, '3:2036', BreesStep.guidePreVerification),
  _VisualCase(8, '3:2093', BreesStep.emailVerificationSent),
  _VisualCase(9, '3:2136', BreesStep.gmailInboxVerification),
  _VisualCase(10, '3:2249', BreesStep.openMailVerification),
  _VisualCase(11, '3:2338', BreesStep.browserVerified),
  _VisualCase(12, '3:2363', BreesStep.login),
  _VisualCase(13, '3:2427', BreesStep.forgotPassword),
  _VisualCase(14, '3:2471', BreesStep.forgotEmailSent),
  _VisualCase(15, '3:2514', BreesStep.gmailInboxReset),
  _VisualCase(16, '3:2627', BreesStep.openMailReset),
  _VisualCase(17, '3:2716', BreesStep.browserCreatePassword),
  _VisualCase(18, '3:2757', BreesStep.browserPasswordCreated),
  _VisualCase(19, '3:2796', BreesStep.guidePostLogin),
  _VisualCase(20, '3:2848', BreesStep.setupAccount),
  _VisualCase(21, '3:2893', BreesStep.monoConnect, captureDelayMs: 500),
  _VisualCase(22, '3:2922', BreesStep.homeCompact),
  _VisualCase(23, '3:3077', BreesStep.homeExtended),
  _VisualCase(24, '3:3210', BreesStep.accountList),
  _VisualCase(25, '3:3287', BreesStep.accountDetail),
  _VisualCase(26, '3:3343', BreesStep.transactionSort),
  _VisualCase(27, '3:3419', BreesStep.transactionSorted),
  _VisualCase(28, '3:3500', BreesStep.notification),
  _VisualCase(29, '3:3731', BreesStep.homeWelcome),
  _VisualCase(30, '3:3792', BreesStep.budgetEmpty),
  _VisualCase(31, '3:3935', BreesStep.transactions),
  _VisualCase(32, '3:4073', BreesStep.transactionDetail),
  _VisualCase(33, '3:4141', BreesStep.transactionFilter),
  _VisualCase(34, '3:4362', BreesStep.homeSearch),
  _VisualCase(35, '3:4532', BreesStep.budgetIntro),
  _VisualCase(36, '3:4685', BreesStep.budgetCreateInitial),
  _VisualCase(37, '3:4757', BreesStep.budgetCycleMonthly),
  _VisualCase(38, '3:4898', BreesStep.budgetCycleWeekly),
  _VisualCase(39, '3:5041', BreesStep.budgetCreateConfigured),
  _VisualCase(40, '3:5113', BreesStep.budgetAmount),
  _VisualCase(41, '3:5193', BreesStep.budgetPreviewOff),
  _VisualCase(42, '3:5291', BreesStep.budgetPreviewOn),
  _VisualCase(43, '3:5390', BreesStep.budgetCreatedSuccess),
  _VisualCase(44, '3:5437', BreesStep.budgetDetailEmpty),
  _VisualCase(45, '3:5509', BreesStep.budgetDetailInUse),
  _VisualCase(46, '3:5618', BreesStep.budgetList),
  _VisualCase(47, '3:5770', BreesStep.insightIntro),
  _VisualCase(48, '3:6026', BreesStep.insights),
  _VisualCase(49, '3:6180', BreesStep.reportExpense),
  _VisualCase(50, '3:6230', BreesStep.reportIncome),
  _VisualCase(51, '3:6281', BreesStep.reportBudget),
  _VisualCase(52, '3:6333', BreesStep.reportQuote),
  _VisualCase(53, '3:6370', BreesStep.profile),
  _VisualCase(54, '3:6442', BreesStep.editProfile),
  _VisualCase(55, '3:6485', BreesStep.settings),
  _VisualCase(56, '3:6518', BreesStep.passwordSettings),
  _VisualCase(57, '3:6553', BreesStep.notificationSettings),
  _VisualCase(58, '3:6575', BreesStep.helpCenter),
  _VisualCase(59, '3:6701', BreesStep.helpTopic),
  _VisualCase(60, '3:6731', BreesStep.homeLoading, captureDelayMs: 500),
];

void main() {
  testWidgets('capture all 60 Brees screens and compare with Figma', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await _loadVisualQaFonts(tester);

    final root = Directory('build/visual_qa');
    final runtime = Directory('${root.path}/runtime');
    final referenceOutput = Directory('${root.path}/reference');
    runtime.createSync(recursive: true);
    referenceOutput.createSync(recursive: true);

    final rows = <String>[
      'screen,node,step,similarity,mae,changed_pixel_ratio,width,height',
    ];
    final metricsByCase = <(_VisualCase, _Metrics)>[];
    final infrastructureFailures = <String>[];

    for (final visualCase in _cases) {
      try {
        await _pumpCase(tester, visualCase);
        await tester.runAsync<void>(() async {
          await Future<void>.delayed(const Duration(milliseconds: 90));
        });
        await tester.pump();

        final flutterException = tester.takeException();
        if (flutterException != null) {
          throw StateError('Flutter exception: $flutterException');
        }

        final boundaryFinder = find.byKey(
          const Key('brees-capture-boundary'),
        );
        expect(boundaryFinder, findsOneWidget);

        final boundary = tester.renderObject<RenderRepaintBoundary>(
          boundaryFinder,
        );

        final metrics = await tester.runAsync<_Metrics>(() async {
          final actualImage = await boundary.toImage(pixelRatio: 1);
          final actualPng = await actualImage.toByteData(
            format: ui.ImageByteFormat.png,
          );
          if (actualPng == null) {
            throw StateError('Could not encode runtime screenshot.');
          }

          final runtimeFile = File(
            '${runtime.path}/${visualCase.fileStem}.png',
          );
          runtimeFile.writeAsBytesSync(
            actualPng.buffer.asUint8List(),
            flush: true,
          );

          final referenceBytes = File(
            visualCase.referencePath,
          ).readAsBytesSync();
          File(
            '${referenceOutput.path}/${visualCase.fileStem}.png',
          ).writeAsBytesSync(referenceBytes, flush: true);
          final referenceImage = await _decodeReferenceImage(
            referenceBytes,
            targetWidth: actualImage.width,
            targetHeight: actualImage.height,
          );

          return _compareImages(actualImage, referenceImage);
        });

        if (metrics == null) {
          throw StateError('Visual QA capture returned no metrics.');
        }
        metricsByCase.add((visualCase, metrics));

        rows.add([
          visualCase.number,
          visualCase.nodeId,
          visualCase.step.name,
          metrics.similarity.toStringAsFixed(6),
          metrics.meanAbsoluteError.toStringAsFixed(6),
          metrics.changedPixelRatio.toStringAsFixed(6),
          metrics.width,
          metrics.height,
        ].join(','));

        debugPrint(
          'VISUAL_QA '
          '${visualCase.number.toString().padLeft(2, '0')} '
          '${visualCase.nodeId} '
          'similarity=${metrics.similarity.toStringAsFixed(4)} '
          'changed=${(metrics.changedPixelRatio * 100).toStringAsFixed(1)}%',
        );
      } catch (error, stackTrace) {
        infrastructureFailures.add(
          '${visualCase.number} ${visualCase.nodeId}: $error',
        );
        debugPrint(
          'VISUAL_QA_ERROR ${visualCase.number} '
          '${visualCase.nodeId}: $error\n$stackTrace',
        );
      } finally {
        await tester.pumpWidget(const SizedBox.shrink());
        await tester.pump();
        tester.takeException();
      }
    }

    File('${root.path}/report.csv').writeAsStringSync(
      '${rows.join('\n')}\n',
      flush: true,
    );

    metricsByCase.sort(
      (a, b) => a.$2.similarity.compareTo(b.$2.similarity),
    );
    final markdown = StringBuffer()
      ..writeln('# Brees visual QA')
      ..writeln()
      ..writeln(
        'Pixel similarity is a diagnostic ranking, not a claim of '
        'human-perceived pixel perfection.',
      )
      ..writeln()
      ..writeln('| # | Figma node | Flutter state | Similarity | Changed pixels |')
      ..writeln('|---:|---|---|---:|---:|');

    for (final entry in metricsByCase) {
      markdown.writeln(
        '| ${entry.$1.number} | ${entry.$1.nodeId} | '
        '${entry.$1.step.name} | '
        '${(entry.$2.similarity * 100).toStringAsFixed(2)}% | '
        '${(entry.$2.changedPixelRatio * 100).toStringAsFixed(2)}% |',
      );
    }

    if (infrastructureFailures.isNotEmpty) {
      markdown
        ..writeln()
        ..writeln('## Capture failures');
      for (final failure in infrastructureFailures) {
        markdown.writeln('- $failure');
      }
    }

    File('${root.path}/report.md').writeAsStringSync(
      markdown.toString(),
      flush: true,
    );

    expect(
      infrastructureFailures,
      isEmpty,
      reason: 'Every Figma target must produce a runtime screenshot.',
    );
  });
}


Future<void> _loadVisualQaFonts(WidgetTester tester) async {
  final fonts = <(String, String?)>[
    ('Inter', Platform.environment['VISUAL_QA_FONT_PATH']),
    (
      'MaterialIcons',
      Platform.environment['VISUAL_QA_MATERIAL_ICONS_PATH'],
    ),
  ];

  await tester.runAsync<void>(() async {
    for (final (family, path) in fonts) {
      if (path == null || path.isEmpty || !File(path).existsSync()) {
        debugPrint('Visual QA font unavailable: $family ($path)');
        continue;
      }

      final bytes = File(path).readAsBytesSync();
      final loader = FontLoader(family);
      loader.addFont(
        Future<ByteData>.value(ByteData.sublistView(bytes)),
      );
      await loader.load();
    }
  });
}

Future<void> _pumpCase(
  WidgetTester tester,
  _VisualCase visualCase,
) async {
  await tester.pumpWidget(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: BreesTheme.light,
      home: BreesFlow(initialStep: visualCase.step),
    ),
  );
  await tester.pump();

  if (visualCase.onboardingPage != null) {
    await tester.pump(const Duration(milliseconds: 650));
    for (var i = 0; i < visualCase.onboardingPage!; i++) {
      await tester.drag(
        find.byKey(const Key('onboarding-page-view')),
        const Offset(-350, 0),
      );
      await tester.pump(const Duration(milliseconds: 600));
    }
    return;
  }

  await tester.pump(
    Duration(milliseconds: visualCase.captureDelayMs),
  );
}

Future<ui.Image> _decodeReferenceImage(
  Uint8List bytes, {
  required int targetWidth,
  required int targetHeight,
}) async {
  final codec = await ui.instantiateImageCodec(bytes);
  final frame = await codec.getNextFrame();
  final original = frame.image;

  if (original.width == targetWidth && original.height == targetHeight) {
    return original;
  }

  final rgba = await original.toByteData(
    format: ui.ImageByteFormat.rawRgba,
  );
  if (rgba == null) {
    throw StateError('Could not inspect Figma reference pixels.');
  }

  final pixels = rgba.buffer.asUint8List();
  var minX = original.width;
  var minY = original.height;
  var maxX = -1;
  var maxY = -1;

  for (var y = 0; y < original.height; y++) {
    for (var x = 0; x < original.width; x++) {
      final alpha = pixels[(y * original.width + x) * 4 + 3];
      if (alpha < 128) continue;
      minX = math.min(minX, x);
      minY = math.min(minY, y);
      maxX = math.max(maxX, x);
      maxY = math.max(maxY, y);
    }
  }

  ui.Rect sourceRect;
  if (maxX >= minX && maxY >= minY) {
    final opaqueWidth = maxX - minX + 1;
    final opaqueHeight = maxY - minY + 1;
    final widthClose = (opaqueWidth - targetWidth).abs() <= 3;
    final heightClose = (opaqueHeight - targetHeight).abs() <= 3;

    if (widthClose && heightClose) {
      sourceRect = ui.Rect.fromLTWH(
        minX.toDouble(),
        minY.toDouble(),
        opaqueWidth.toDouble(),
        opaqueHeight.toDouble(),
      );
    } else {
      final sourceHeight = math.min(
        original.height.toDouble(),
        targetHeight * original.width / targetWidth,
      );
      sourceRect = ui.Rect.fromLTWH(
        0,
        0,
        original.width.toDouble(),
        sourceHeight,
      );
    }
  } else {
    final sourceHeight = math.min(
      original.height.toDouble(),
      targetHeight * original.width / targetWidth,
    );
    sourceRect = ui.Rect.fromLTWH(
      0,
      0,
      original.width.toDouble(),
      sourceHeight,
    );
  }

  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  canvas.drawImageRect(
    original,
    sourceRect,
    ui.Rect.fromLTWH(
      0,
      0,
      targetWidth.toDouble(),
      targetHeight.toDouble(),
    ),
    Paint(),
  );
  final picture = recorder.endRecording();
  return picture.toImage(targetWidth, targetHeight);
}

Future<_Metrics> _compareImages(
  ui.Image actual,
  ui.Image reference,
) async {
  final actualData = await actual.toByteData(
    format: ui.ImageByteFormat.rawRgba,
  );
  final referenceData = await reference.toByteData(
    format: ui.ImageByteFormat.rawRgba,
  );

  if (actualData == null || referenceData == null) {
    throw StateError('Could not access raw RGBA pixels.');
  }

  final a = actualData.buffer.asUint8List();
  final b = referenceData.buffer.asUint8List();
  if (a.length != b.length) {
    throw StateError(
      'RGBA length mismatch: actual=${a.length}, reference=${b.length}',
    );
  }

  var absoluteError = 0;
  var changedPixels = 0;
  final pixelCount = actual.width * actual.height;

  for (var index = 0; index < a.length; index += 4) {
    final red = (a[index] - b[index]).abs();
    final green = (a[index + 1] - b[index + 1]).abs();
    final blue = (a[index + 2] - b[index + 2]).abs();
    absoluteError += red + green + blue;

    if (math.max(red, math.max(green, blue)) > 24) {
      changedPixels++;
    }
  }

  final mae = absoluteError / (pixelCount * 3 * 255);
  return _Metrics(
    similarity: 1 - mae,
    meanAbsoluteError: mae,
    changedPixelRatio: changedPixels / pixelCount,
    width: actual.width,
    height: actual.height,
  );
}
