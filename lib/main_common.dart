import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/architecture.dart';
import 'package:pedantic/pedantic.dart';

Future<void> _setupCrashLogging({required bool enabled}) async {
  if (enabled) {
    await Firebase.initializeApp();
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(enabled);
    unawaited(FirebaseCrashlytics.instance.sendUnsentReports());
  }

  final originalOnError = FlutterError.onError;
  FlutterError.onError = (errorDetails) async {
    if (enabled) {
      await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
    originalOnError?.call(errorDetails);
  };
}

FutureOr<R>? wrapMain<R>(FutureOr<R> Function() appCode, {required bool enableCrashLogging}) {
  return runZonedGuarded(() async {
    await _setupCrashLogging(enabled: false);
    await initArchitecture();

    return await appCode();
  }, (object, trace) {
    WidgetsFlutterBinding.ensureInitialized();
    if (enableCrashLogging) {
      FirebaseCrashlytics.instance.recordError(object, trace);
    }
  });
}
