import 'package:flutter/material.dart';

import '../core/theme/brees_theme.dart';
import '../features/onboarding/presentation/pages/brees_flow.dart';
import 'dependencies/brees_dependencies.dart';

class BreesApp extends StatelessWidget {
  const BreesApp({
    super.key,
    this.dependencies,
  });

  final BreesDependencies? dependencies;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brees',
      debugShowCheckedModeBanner: false,
      theme: BreesTheme.light,
      home: BreesFlow(dependencies: dependencies),
    );
  }
}
