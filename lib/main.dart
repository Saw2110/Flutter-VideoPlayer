import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app.dart';
import 'core/core.dart';

Future<void> main() async {
  ///
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await loadEnv();

      /// Lock device orientation to portrait
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]).then((_) {
        runApp(const MainApp());
      });
    },
    (error, stack) {
      // Handle any uncaught errors here
      debugPrint("Uncaught error: $error");
      debugPrint("Stack trace: $stack");
    },
  );
}
