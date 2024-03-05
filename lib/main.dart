import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ready_structure/app.dart';
import 'package:ready_structure/core/networking/errors/app_error_reporter/app_error_reporter.dart';

import 'core/di/locator.dart';

void main() {

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      setupLocator();
      await firebaseInit();
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
}
