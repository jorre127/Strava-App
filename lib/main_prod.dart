import 'package:flutter/material.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/architecture.dart';
import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/main_common.dart';
import 'package:flutter_template/util/env/flavor_config.dart';

Future<void> main() async {
  await wrapMain(() async {
    await initArchitecture();
    const values = FlavorValues(
      baseUrl: 'https://www.strava.com/api/v3',
      logNetworkInfo: false,
      showFullErrorMessages: false,
    );
    FlavorConfig(
      flavor: Flavor.PROD,
      name: 'PROD',
      color: Colors.transparent,
      values: values,
    );
    await configureDependencies(Environments.PROD);
    runApp(MyApp());
  }, enableCrashLogging: true);
}
