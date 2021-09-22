import 'package:flutter/material.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/viewmodel/clubs/clubs_viewmodel.dart';
import 'package:flutter_template/widget/clubs/club_card.dart';
import 'package:flutter_template/navigator/mixin/back_navigator.dart';
import 'package:flutter_template/navigator/mixin/error_navigator.dart';
import 'package:flutter_template/widget/general/animated_gradiant.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:get_it/get_it.dart';

class ClubsScreen extends StatefulWidget {
  static const routeName = 'club_selection';
  const ClubsScreen({
    Key? key,
  }) : super(key: key);

  @override
  ClubsScreenState createState() => ClubsScreenState();
}

@visibleForTesting
class ClubsScreenState extends State<ClubsScreen> with BackNavigatorMixin, ErrorNavigatorMixin implements ClubsViewNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ClubsViewModel>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) {
        return Scaffold(
          backgroundColor: theme.colorsTheme.backgroundDark,
          body: Center(
            child: LayoutBuilder(builder: (context, constraints) {
              final background = Stack(
                children: [
                  Image.asset(
                    ThemeAssets.loginBackground(),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  const AnimatedGradiant(gradiantRatio: 0.15),
                ],
              );
              var isBigLayout = constraints.maxWidth > 1100;
              return Stack(
                alignment: Alignment.center,
                children: [
                  background,
                  Flex(
                    direction: isBigLayout ? Axis.horizontal : Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClubCard(
                        height: isBigLayout ? 450 : 350,
                        width: isBigLayout ? 450 : 350,
                        onClick: () => viewModel.onRunningCardClicked(),
                        title: localization.clubSelectionRunningTitle,
                        url: viewModel.runningPicture,
                      ),
                      SizedBox(height: isBigLayout ? 0 : ThemeDimens.padding56, width: isBigLayout ? ThemeDimens.padding128 : 0),
                      ClubCard(
                        height: isBigLayout ? 450 : 350,
                        width: isBigLayout ? 450 : 350,
                        onClick: () => viewModel.onCyclingCardClicked(),
                        title: localization.clubSelectionCyclingTitle,
                        url: viewModel.cyclingPicture,
                      ),
                    ],
                  ),
                ],
              );
            }),
          ),
        );
      },
    );
  }

  @override
  void goToClubDetail(String clubId) => MainNavigatorWidget.of(context).goToClubDetail(clubId);
}
