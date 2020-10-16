import 'dart:io';

const originalProjectName = 'flutter_template';
const originalClassNamePrefix = 'FlutterTemplate';
const originalIOSBundleIdentifier = 'com.icapps.fluttertemplate';
const originalAndroidPackageName = 'com.icapps.fluttertemplate';
const originalAndroidFolderPath = 'com/icapps/fluttertemplate';
const originalAppName = 'Flutter Template';
const originalDescription = 'A Flutter Template to get started quickly';

void main() {
  Logger.info('Enter name Application:');
  final appName = stdin.readLineSync();
  Logger.info('Enter description for the pubspec.yaml:');
  final description = stdin.readLineSync();
  Logger.info('Enter Dart Package Name:');
  final dartPackageName = stdin.readLineSync();
  Logger.info('Enter Dart Class Name Prefix:');
  final classNamePrefix = stdin.readLineSync();

  String androidPackageName;
  String iosBundleIdentifier;
  do {
    Logger.info('\nEnter Android Package Name / iOS Bundle Identifier');
    Logger.info('No uppercase & no underscores:');
    final result = stdin.readLineSync();
    final validResult = result == result.toLowerCase() && !result.contains('_');
    if (validResult) {
      iosBundleIdentifier = result;
      androidPackageName = result;
    }
  } while (iosBundleIdentifier == null && androidPackageName == null);

  bool specificAppCenterIds;
  do {
    Logger.info('\nDo you want to specify the AppCenter ids?\nOr use the default config: $classNamePrefix-iOS/Android-Alpha/Beta (yes/no)');
    final result = stdin.readLineSync();
    final validResult = result == 'y' || result == 'n' || result == 'yes' || result == 'no';
    if (validResult) {
      specificAppCenterIds = result == 'y' || result == 'yes';
    }
  } while (specificAppCenterIds == null);

  _renameAppCenterIds(classNamePrefix, specificAppCenterIds);
  _renameAndroidPackageName(androidPackageName);
  _renameiOSBundleIdentifier(iosBundleIdentifier);
  _renameNiddlerPackageName(androidPackageName, iosBundleIdentifier, appName);
  _renameAppName(appName);
  _renamePackage(dartPackageName, description, classNamePrefix);
  _packagesGet();
  _performFinalCheck();
}

void _renameAppCenterIds(String classNamePrefix, bool specificAppCenterIds) {
  if (specificAppCenterIds) {
    Logger.info('Enter iOS AppCenter Alpha id: (Default is $classNamePrefix-iOS-Alpha)');
    final appCenterIosAlphaId = stdin.readLineSync();
    _renameFastlaneAppCenterIds(AppCenterApp.IOS_ALPHA, classNamePrefix, value: appCenterIosAlphaId);
    Logger.info('Enter iOS AppCenter Beta id: (Default is $classNamePrefix-iOS-Beta)');
    final appCenterIosBetaId = stdin.readLineSync();
    _renameFastlaneAppCenterIds(AppCenterApp.IOS_BETA, classNamePrefix, value: appCenterIosBetaId);
    Logger.info('Enter iOS AppCenter Prod id: (Default is $classNamePrefix-iOS)');
    final appCenterIosProdId = stdin.readLineSync();
    _renameFastlaneAppCenterIds(AppCenterApp.IOS_PROD, classNamePrefix, value: appCenterIosProdId);

    Logger.info('Enter Android AppCenter Alpha id: (Default is $classNamePrefix-Android-Alpha)');
    final appCenterAndroidAlphaId = stdin.readLineSync();
    _renameFastlaneAppCenterIds(AppCenterApp.ANDROID_ALPHA, classNamePrefix, value: appCenterAndroidAlphaId);
    Logger.info('Enter Android AppCenter Beta id: (Default is $classNamePrefix-Android-Beta)');
    final appCenterAndroidBetaId = stdin.readLineSync();
    _renameFastlaneAppCenterIds(AppCenterApp.ANDROID_BETA, classNamePrefix, value: appCenterAndroidBetaId);
    Logger.info('Enter Android AppCenter Prod id: (Default is $classNamePrefix-Android)');
    final appCenterAndroidProdId = stdin.readLineSync();
    _renameFastlaneAppCenterIds(AppCenterApp.ANDROID_PROD, classNamePrefix, value: appCenterAndroidProdId);
  } else {
    Logger.info('Replace the AppCenter ids with default values...');
    _renameFastlaneAppCenterIds(AppCenterApp.IOS_ALPHA, classNamePrefix);
    _renameFastlaneAppCenterIds(AppCenterApp.IOS_BETA, classNamePrefix);
    _renameFastlaneAppCenterIds(AppCenterApp.IOS_PROD, classNamePrefix);
    _renameFastlaneAppCenterIds(AppCenterApp.ANDROID_ALPHA, classNamePrefix);
    _renameFastlaneAppCenterIds(AppCenterApp.ANDROID_BETA, classNamePrefix);
    _renameFastlaneAppCenterIds(AppCenterApp.ANDROID_PROD, classNamePrefix);
  }
}

void _renameAndroidPackageName(String androidPackageName) {
  Logger.info('Replace the android package name ...');
  _replaceInFile('android/app/build.gradle', originalAndroidPackageName, androidPackageName);
  Directory('android/app/src/main').listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    _replaceInFile(element.path, originalAndroidPackageName, androidPackageName);
  });
  Directory('lib').listSync(recursive: true).where((element) {
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    _replaceInFile(element.path, originalAndroidPackageName, androidPackageName);
  });
  Directory('test').listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    _replaceInFile(element.path, originalAndroidPackageName, androidPackageName);
  });
}

void _renameiOSBundleIdentifier(String iosBundleIdentifier) {
  Logger.info('Replace the ios bundle identifier ...');
  _replaceInFile('fastlane/Fastfile', originalIOSBundleIdentifier, iosBundleIdentifier);
  Directory('ios/Configuration').listSync(recursive: true).where((element) {
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    _replaceInFile(element.path, originalIOSBundleIdentifier, iosBundleIdentifier);
  });
  Directory('ios/Runner').listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    _replaceInFile(element.path, originalIOSBundleIdentifier, iosBundleIdentifier);
  });
  Directory('lib').listSync(recursive: true).where((element) {
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    _replaceInFile(element.path, originalIOSBundleIdentifier, iosBundleIdentifier);
  });
  Directory('test').listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    _replaceInFile(element.path, originalIOSBundleIdentifier, iosBundleIdentifier);
  });
}

void _renameAppName(String appName) {
  Logger.info('Replace the app name ...');
  _replaceInFile('fastlane/Fastfile', originalAppName, appName);
  Directory('ios/Configuration').listSync(recursive: true).where((element) {
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    _replaceInFile(element.path, originalAppName, appName);
  });
  Directory('android/app/src').listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    _replaceInFile(element.path, originalAppName, appName);
  });
}

void _renameNiddlerPackageName(String androidPackageName, String iosBundleIdentifier, String appName) {
  Logger.info('Replace text in lib/niddler.dart ...');
  _replaceInFile('lib/niddler.dart', originalAndroidPackageName, androidPackageName);
  _replaceInFile('lib/niddler.dart', originalIOSBundleIdentifier, iosBundleIdentifier);
  _replaceInFile('lib/niddler.dart', originalAppName, appName);
}

void _renamePackage(String packageName, String description, String classNamePrefix) {
  Logger.info('Replace the description & name in the pubspec.yaml...');
  _replaceInFile('pubspec.yaml', 'name: $originalProjectName', 'name: $packageName');
  _replaceInFile('pubspec.yaml', 'description: $originalDescription', 'description: $description');
  _replaceInFile('coverage/filter_test_coverage.dart', originalClassNamePrefix, classNamePrefix);

  Logger.info('Replace the package names & class names in lib ...');
  Directory('lib').listSync(recursive: true).where((element) => !Directory(element.path).existsSync()).forEach((element) {
    _replaceInFile(element.path, originalProjectName, packageName);
    _replaceInFile(element.path, originalClassNamePrefix, classNamePrefix);
    _renameDartFile(element.path, packageName);
  });

  Logger.info('Replace the package names & class names in test ...');
  Directory('test').listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    _replaceInFile(element.path, originalProjectName, packageName);
    _replaceInFile(element.path, originalClassNamePrefix, classNamePrefix);
    _renameDartFile(element.path, packageName);
  });

  Directory('test').listSync(recursive: true).where((element) {
    return element.path.endsWith('.png');
  }).forEach((element) {
    _renameDartFile(element.path, packageName);
  });
}

void _packagesGet() {
  _executeCommand('flutter', ['packages', 'get']);
}

void _performFinalCheck() {
  Logger.debug('Starting the final path reference check...');
  var valid = true;
  Directory('.').listSync(recursive: true).where((element) {
    if (element.path.startsWith('./.git/')) return false;
    return true;
  }).forEach((element) {
    if (element.path.contains(originalProjectName) ||
        element.path.contains(originalClassNamePrefix) ||
        element.path.contains(originalIOSBundleIdentifier) ||
        element.path.contains(originalAndroidPackageName) ||
        element.path.contains(originalAndroidFolderPath) ||
        element.path.contains(originalAppName)) {
      Logger.debug('${element.path} path still contains some template references');
      valid = false;
    }
  });
  Logger.debug('Final path reference check finished');
  Logger.debug('');
  Logger.debug('Starting the final content reference check...');
  Directory('.').listSync(recursive: true).where((element) {
    if (element.path.startsWith('./.git/')) return false;
    if (element.path.endsWith('.png')) return false;
    if (element.path.endsWith('.ttf')) return false;
    if (element.path.endsWith('tool/dart_tool/rename_project.dart')) return false;
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    final content = File(element.path).readAsStringSync();
    if (content.contains(originalProjectName) ||
        content.contains(originalClassNamePrefix) ||
        content.contains(originalIOSBundleIdentifier) ||
        content.contains(originalAndroidPackageName) ||
        content.contains(originalAndroidFolderPath) ||
        content.contains(originalAppName)) {
      Logger.debug('${element.path} content still contains some template references');
      valid = false;
    }
  });
  Logger.debug('Final content reference check finished');
  Logger.debug('');
  if (!valid) {
    Logger.debug('rename_project.dart could not finish successfully');
    exit(-1);
  }
  Logger.debug('rename_project.dart finished successfully');
}

/// ==============
/// UTIL FUNCTIONS
/// ==============
void _replaceInFile(String path, String originalString, String newString) {
  final file = File(path);
  final original = file.readAsStringSync();
  final newContent = original.replaceAll(originalString, newString);
  file.writeAsStringSync(newContent);
}

void _renameDartFile(String path, String newPackageName) {
  final newPath = path.replaceAll(originalProjectName, newPackageName);
  File(path).renameSync(newPath);
}

void _renameFastlaneAppCenterIds(AppCenterApp appCenterApp, String classNamePrefix, {String value}) {
  switch (appCenterApp) {
    case AppCenterApp.ANDROID_ALPHA:
      final newValue = value == null || value.isEmpty ? '$classNamePrefix-Android-Alpha' : value;
      _replaceInFile('fastlane/Fastfile', 'appcenter_app_name = "FlutterTemplate-Android-Alpha"', 'appcenter_app_name = "$newValue"');
      break;
    case AppCenterApp.ANDROID_BETA:
      final newValue = value == null || value.isEmpty ? '$classNamePrefix-Android-Beta' : value;
      _replaceInFile('fastlane/Fastfile', 'appcenter_app_name = "FlutterTemplate-Android-Beta"', 'appcenter_app_name = "$newValue"');
      break;
    case AppCenterApp.ANDROID_PROD:
      final newValue = value == null || value.isEmpty ? '$classNamePrefix-Android' : value;
      _replaceInFile('fastlane/Fastfile', 'appcenter_app_name = "FlutterTemplate-Android"', 'appcenter_app_name = "$newValue"');
      break;
    case AppCenterApp.IOS_ALPHA:
      final newValue = value == null || value.isEmpty ? '$classNamePrefix-iOS-Alpha' : value;
      _replaceInFile('fastlane/Fastfile', 'appcenter_app_name = "FlutterTemplate-iOS-Alpha"', 'appcenter_app_name = "$newValue"');
      break;
    case AppCenterApp.IOS_BETA:
      final newValue = value == null || value.isEmpty ? '$classNamePrefix-iOS-Beta' : value;
      _replaceInFile('fastlane/Fastfile', 'appcenter_app_name = "FlutterTemplate-iOS-Beta"', 'appcenter_app_name = "$newValue"');
      break;
    case AppCenterApp.IOS_PROD:
      final newValue = value == null || value.isEmpty ? '$classNamePrefix-iOS' : value;
      _replaceInFile('fastlane/Fastfile', 'appcenter_app_name = "FlutterTemplate-iOS"', 'appcenter_app_name = "$newValue"');
      break;
  }
}

void _executeCommand(String cmd, List<String> params) {
  final fullCommand = '$cmd ${params.join(' ')}';
  try {
    Logger.info('$fullCommand');
    final result = Process.runSync(cmd, params);
    final output = result.stdout;
    if (output.toString().isNotEmpty) {
      Logger.debug('$output');
    }
  } catch (e) {
    Logger.error('\nFailed to execute command: $fullCommand\n$e');
    exit(-1);
  }
}

enum AppCenterApp {
  ANDROID_ALPHA,
  ANDROID_BETA,
  ANDROID_PROD,
  IOS_ALPHA,
  IOS_BETA,
  IOS_PROD,
}

class Logger {
  Logger._();

  static void debug(value) => print(value); // ignore: avoid_print

  static void info(value) => print(value); // ignore: avoid_print
  static void error(value) => print(value); // ignore: avoid_print
}
