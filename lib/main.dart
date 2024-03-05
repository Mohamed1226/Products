import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ready_structure/app.dart';
import 'package:ready_structure/core/networking/errors/app_error_reporter/app_error_reporter.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:ready_structure/core/shared_prefs/app_shared_prefs.dart';
import 'core/di/locator.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      setupLocator();
      await firebaseInit();
      await locator<AppSharedPrefs>().init();
      await AppErrorReporter.init(appRunner: () => runApp(const MyApp()));
    },
    (Object error, StackTrace stack) {
      AppErrorReporter.recordError(error, stackTrace: stack);
      AppErrorReporter.onStackError(stack);
    },
  );
}

Future<void> firebaseInit() async {
  await Firebase.initializeApp();
  if (!kDebugMode) {
    await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.playIntegrity,
      appleProvider: AppleProvider.appAttest,
    );
  } else {
    await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.debug,
      appleProvider: AppleProvider.debug,
    );
  }
}
