import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/app/brees_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const BreesApp());
}
