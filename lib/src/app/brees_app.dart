import 'package:flutter/material.dart';

import '../core/theme/brees_theme.dart';
import '../features/onboarding/presentation/pages/brees_flow.dart';

class BreesApp extends StatelessWidget {
  const BreesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brees',
      debugShowCheckedModeBanner: false,
      theme: BreesTheme.light,
      home: const BreesFlow(),
    );
  }
}
