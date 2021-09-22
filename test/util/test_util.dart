import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/styles/theme_fonts.dart';
import 'package:flutter_test/flutter_test.dart';

class TestUtil {
  // This method should be used when taking screenshot tests of a widget that should not display text
  // Widget snapshot tests
  static Future<Widget> loadWidget(WidgetTester tester, Widget widget) async {
    return _internalLoadWidget(tester, Center(child: widget));
  }

  // This method should be used when taking screenshot tests of a widget that should display text
  // Widget snapshot tests
  static Future<Widget> loadWidgetWithText(WidgetTester tester, Widget widget) async {
    return _internalLoadWidget(
      tester,
      MaterialApp(
        theme: ThemeData(fontFamily: ThemeFonts.OpenSans),
        home: Center(
          child: Material(
            child: widget,
            color: Colors.transparent,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  // This method should be used when taking screenshot tests of a single screen
  // Screen integration tests
  static Future<Widget> loadScreen(WidgetTester tester, Widget widget) async {
    return _internalLoadWidget(
      tester,
      InternalApp(
        home: widget,
      ),
    );
  }

  // This method should be used when taking screenshot tests of the full app
  // Full integration tests
  static Future<Widget> loadgeluidshuisApp(WidgetTester tester) async {
    return _internalLoadWidget(tester, const MyApp());
  }

  static Future<Widget> _internalLoadWidget(WidgetTester tester, Widget widget) async {
    final testWidget = TestWrapper(child: widget);
    tester.allWidgets.toList().clear();
    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(testWidget);
    });
    await tester.pumpAndSettle();
    return testWidget;
  }

  static Future<void> takeScreenshotForAllSizes(WidgetTester tester, Widget widget, String snapshotName) async {
    for (final screen in ScreenType.values) {
      await takeScreenshotForScreenType(tester, widget, snapshotName, screen: screen);
    }
  }

  static Future<void> takeLandscapeTabletScreenShot(WidgetTester tester, Widget testWidget, String name) async {
    const size = Size(2732 * 1.5 - 40, 2048 * 1.5);
    await TestUtil.takeScreenshotForScreenSize(tester, testWidget, name, size: size, name: 'ipad_pro_landscape');
  }

  static Future<void> takeScreenshotForScreenType(WidgetTester tester, Widget widget, String snapshotName, {ScreenType screen = ScreenType.IPHONE11}) async {
    await takeScreenshotForScreenSize(tester, widget, snapshotName, size: screen.size, name: screen.name);
  }

  static Future<void> takeScreenshotForScreenSize(WidgetTester tester, Widget widget, String snapshotName, {required Size size, required String name}) async {
    tester.binding.window.physicalSizeTestValue = size;
    expect(widget.runtimeType, equals(TestWrapper));
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
    await takeScreenshot(tester, '${snapshotName}_$name');
    tester.binding.window.clearPhysicalSizeTestValue();
  }

  static Future<void> takeScreenshot(WidgetTester tester, String snapshotName) async {
    expect(find.byType(TestWrapper), findsOneWidget);
    await expectLater(
      find.byType(TestWrapper),
      matchesGoldenFile('img/$snapshotName.png'),
    );
  }

  static Future<void> pumpAndSettleWithDuration(WidgetTester tester) async {
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  static Future<void> loadFonts() async {
    await _loadFont('assets/fonts/sf_pro_display/SFProDisplay-Regular.ttf', ThemeFonts.SFProfDisplay);
  }

  static Future<void> _loadFont(String fontPath, String fontName) async {
    File fontFile;
    //Thanks android studio to run the tests from root instead of /test
    if (Directory.current.path.endsWith('test')) {
      fontFile = File('../$fontPath');
    } else {
      fontFile = File(fontPath);
    }
    final bytes = fontFile.readAsBytesSync();
    final fontData = ByteData.view(bytes.buffer);
    final fontLoader = FontLoader(fontName)..addFont(Future.value(fontData));
    await fontLoader.load();
  }

  static String getVariableString() {
    return 'Title';
  }
}

class TestWrapper extends StatelessWidget {
  final Widget child;

  const TestWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: RepaintBoundary(
        child: child,
      ),
    );
  }
}
