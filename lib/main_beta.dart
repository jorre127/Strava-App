import 'package:flutter/material.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/main_common.dart';
import 'package:flutter_template/util/env/flavor_config.dart';

Future<void> main() async {
  await wrapMain(() async {
    const values = FlavorValues(
      baseUrl: 'https://www.strava.com/api/v3',
      logNetworkInfo: false,
      showFullErrorMessages: true,
    );
    FlavorConfig(
      flavor: Flavor.BETA,
      name: 'BETA',
      color: Colors.blue,
      values: values,
    );
    await configureDependencies(Environments.PROD);
    runApp(MyApp());
  }, enableCrashLogging: true);
}
