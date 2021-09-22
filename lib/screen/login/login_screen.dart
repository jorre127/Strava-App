import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/general/animated_gradiant.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/navigator/mixin/error_navigator.dart';
import 'package:flutter_template/viewmodel/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/widget/general/status_bar.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_button.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

@visibleForTesting
class LoginScreenState extends State<LoginScreen> with ErrorNavigatorMixin implements LoginNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LoginViewModel>(
      create: () => GetIt.I()..init(this),
      childBuilder: (context, theme, _) => Consumer<LoginViewModel>(
        builder: (context, viewModel, child) => StatusBar.light(
          child: Scaffold(
            backgroundColor: theme.colorsTheme.backgroundDark,
            body: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  ThemeAssets.loginBackground(),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                const AnimatedGradiant(gradiantRatio: 0.15),
                Container(
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '/CAPPS',
                        style: theme.lightTextTheme.titleHuge.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Clubs',
                        style: theme.lightTextTheme.titleBig,
                      ),
                      const SizedBox(height: ThemeDimens.padding128),
                      FlutterTemplateButton(
                        key: Keys.loginButton,
                        color: theme.colorsTheme.stravaOrange,
                        isEnabled: true,
                        text: 'Login with Strava',
                        onClick: viewModel.onLoginClicked,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void goToClubSelection() => MainNavigatorWidget.of(context).goToClubs();
}
