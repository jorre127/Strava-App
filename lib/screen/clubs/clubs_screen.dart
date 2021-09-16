import 'package:flutter/material.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
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
                    'assets/images/icappsGroup.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  const AnimatedGradiant(gradiantRatio: 0.2),
                ],
              );
              if (constraints.maxWidth > 1100) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    background,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClubCard(
                          onClick: () => viewModel.onRunningCardClicked(viewModel.runningClub),
                          title: localization.clubSelectionRunningTitle,
                          url: viewModel.runningPicture,
                        ),
                        const SizedBox(width: ThemeDimens.padding128),
                        ClubCard(
                          onClick: () => viewModel.onCyclingCardClicked(viewModel.cyclingClub),
                          title: localization.clubSelectionCyclingTitle,
                          url: viewModel.cyclingPicture,
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/icappsGroup.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    const AnimatedGradiant(gradiantRatio: 0.2),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClubCard(
                          onClick: () => viewModel.onRunningCardClicked(viewModel.runningClub),
                          width: 350,
                          height: 350,
                          title: localization.clubSelectionRunningTitle,
                          url: viewModel.runningPicture,
                        ),
                        const SizedBox(height: ThemeDimens.padding56),
                        ClubCard(
                          onClick: () => viewModel.onCyclingCardClicked(viewModel.cyclingClub),
                          width: 350,
                          height: 350,
                          title: localization.clubSelectionCyclingTitle,
                          url: viewModel.cyclingPicture,
                        ),
                      ],
                    ),
                  ],
                );
              }
            }),
          ),
        );
      },
    );
  }

  @override
  void goToClubDetail(String clubId) => MainNavigatorWidget.of(context).goToClubDetail(clubId);
}
