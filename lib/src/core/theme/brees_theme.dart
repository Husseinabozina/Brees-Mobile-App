import 'package:flutter/material.dart';

import 'brees_colors.dart';

abstract final class BreesTheme {
  static ThemeData get light {
    final base = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: BreesColors.canvas,
      fontFamily: 'Inter',
      colorScheme: ColorScheme.fromSeed(
        seedColor: BreesColors.primary,
        brightness: Brightness.light,
        primary: BreesColors.primary,
        surface: BreesColors.canvas,
      ),
    );

    return base.copyWith(
      textTheme: base.textTheme.apply(
        bodyColor: BreesColors.ink,
        displayColor: BreesColors.ink,
      ),
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
    );
  }
}
