import 'package:flutter_template/navigator/main_navigation.dart';
import 'package:flutter_template/screen/club_detail/club_detail_screen.dart';
import 'package:flutter_template/screen/clubs/clubs_screen.dart';
import 'package:flutter_template/screen/login/login_screen.dart';
import 'package:flutter_template/screen/todo/todo_add/todo_add_screen.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/widget/general/flavor_banner.dart';
import 'package:flutter_template/screen/license/license_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/screen/debug/debug_platform_selector_screen.dart';
import 'package:flutter_template/screen/home/home_screen.dart';
import 'package:flutter_template/screen/splash/splash_screen.dart';
import 'package:flutter_template/widget/general/text_scale_factor.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:moor/moor.dart';
import 'package:moor_db_viewer/moor_db_viewer.dart';

class MainNavigatorWidget extends StatefulWidget {
  final Widget child;
  const MainNavigatorWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  MainNavigatorWidgetState createState() => MainNavigatorWidgetState();

  static MainNavigationMixin of(BuildContext context, {bool rootNavigator = false}) {
    final navigator = rootNavigator ? context.findRootAncestorStateOfType<MainNavigationMixin>() : context.findAncestorStateOfType<MainNavigationMixin>();
    assert(() {
      if (navigator == null) {
        throw FlutterError('MainNavigation operation requested with a context that does not include a MainNavigation.\n'
            'The context used to push or pop routes from the MainNavigation must be that of a '
            'widget that is a descendant of a MainNavigatorWidget widget.');
      }
      return true;
    }());
    return navigator!;
  }
}

class MainNavigatorWidgetState extends State<MainNavigatorWidget> with MainNavigationMixin {
  static final navigationKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return TextScaleFactor(
      child: WillPopScope(
        onWillPop: _willPop,
        child: widget.child,
      ),
    );
  }

  static Route? onGenerateRoute(RouteSettings settings) {
    final name = settings.name;
    if (name == null) return null;
    final uri = Uri.parse(name);
    switch (uri.path) {
      case SplashScreen.routeName:
        return MaterialPageRoute<void>(builder: (context) => const FlavorBanner(child: SplashScreen()), settings: settings);
      case LoginScreen.routeName:
        return FadeInRoute<void>(child: const FlavorBanner(child: LoginScreen()), settings: settings);
      case HomeScreen.routeName:
        return FadeInRoute<void>(child: FlavorBanner(child: HomeScreen()), settings: settings);
      case TodoAddScreen.routeName:
        return MaterialPageRoute<void>(builder: (context) => const FlavorBanner(child: TodoAddScreen()), settings: settings);
      case DebugPlatformSelectorScreen.routeName:
        return MaterialPageRoute<void>(builder: (context) => const FlavorBanner(child: DebugPlatformSelectorScreen()), settings: settings);
      case LicenseScreen.routeName:
        return MaterialPageRoute<void>(builder: (context) => const FlavorBanner(child: LicenseScreen()), settings: settings);
      case ClubsScreen.routeName:
        return MaterialPageRoute<void>(builder: (context) => const FlavorBanner(child: ClubsScreen()), settings: settings);
      case ClubDetailScreen.routeName:
        return MaterialPageRoute<void>(builder: (context) => const FlavorBanner(child: ClubDetailScreen()), settings: settings);
      case 'test_route':
        if (!FlavorConfig.isInTest()) return null;
        return MaterialPageRoute<void>(builder: (context) => FlavorBanner(child: Container(color: Colors.grey)), settings: settings);
      default:
        return null;
    }
  }

  Future<bool> _willPop() async {
    final navigationState = navigationKey.currentState;
    if (navigationState == null) {
      logger.warning('WillPop has no navigation state');
      return false;
    }
    return !await navigationState.maybePop();
  }

  @override
  void goToSplash() => navigationKey.currentState?.pushReplacementNamed(SplashScreen.routeName);

  @override
  void goToLogin() => navigationKey.currentState?.pushReplacementNamed(LoginScreen.routeName);

  @override
  void goToHome() => navigationKey.currentState?.pushReplacementNamed(HomeScreen.routeName);

  @override
  void goToAddTodo() => navigationKey.currentState?.pushNamed(TodoAddScreen.routeName);

  @override
  void goToDebugPlatformSelector() => navigationKey.currentState?.pushNamed(DebugPlatformSelectorScreen.routeName);

  @override
  void goToLicense() => navigationKey.currentState?.pushNamed(LicenseScreen.routeName);

  @override
  void closeDialog() => Navigator.of(context, rootNavigator: true).pop();

  @override
  void goToDatabase(GeneratedDatabase db) => Navigator.of(context).push<MaterialPageRoute>(MaterialPageRoute(builder: (context) => MoorDbViewer(db)));

  @override
  void goBack<T>({T? result}) => navigationKey.currentState?.pop(result);

  @override
  void showCustomDialog<T>({required WidgetBuilder builder}) {
    final currentContext = navigationKey.currentContext;
    if (currentContext == null) {
      logger.warning('WillPop has no navigation state');
      return;
    }
    showDialog<T>(context: currentContext, builder: builder);
  }

  @override
  void goToClubs() => navigationKey.currentState?.pushNamed(ClubsScreen.routeName);

  @override
  void goToClubDetail() => navigationKey.currentState?.pushNamed(ClubDetailScreen.routeName);
}
