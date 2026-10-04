import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/app/brees_app.dart';
import 'src/app/dependencies/brees_runtime_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  final dependencies = BreesRuntimeConfig.buildDependencies();

  runApp(
    BreesApp(dependencies: dependencies),
  );
}
