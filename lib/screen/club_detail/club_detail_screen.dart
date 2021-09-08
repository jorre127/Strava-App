import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/viewmodel/club_detail/club_detail_viewmodel.dart';
import 'package:flutter_template/navigator/mixin/back_navigator.dart';
import 'package:flutter_template/navigator/mixin/error_navigator.dart';
import 'package:flutter_template/viewmodel/clubs/clubs_viewmodel.dart';
import 'package:flutter_template/widget/club_detail/club_banner.dart';
import 'package:flutter_template/widget/club_detail/club_header.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:get_it/get_it.dart';

class ClubDetailScreen extends StatefulWidget {
  static const routeName = 'club_detail';
  const ClubDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  ClubDetailScreenState createState() => ClubDetailScreenState();
}

@visibleForTesting
class ClubDetailScreenState extends State<ClubDetailScreen> with BackNavigatorMixin, ErrorNavigatorMixin implements ClubDetailViewNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ClubDetailViewModel>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) {
        return Scaffold(
          backgroundColor: theme.colorsTheme.backgroundDark,
          body: viewModel.club == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Stack(
                    children: [
                      ClubBanner(imgUrl: viewModel.club!.coverPhoto!),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(ThemeDimens.padding56, 270, ThemeDimens.padding56, 0),
                        child: Column(
                          children: [
                            ClubHeader(
                              club: viewModel.club!,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }

  @override
  void goToHome() {
    // TODO: implement goToHome
  }
}
