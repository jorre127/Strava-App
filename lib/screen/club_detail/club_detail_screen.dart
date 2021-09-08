import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/member/member.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/viewmodel/club_detail/club_detail_viewmodel.dart';
import 'package:flutter_template/navigator/mixin/back_navigator.dart';
import 'package:flutter_template/navigator/mixin/error_navigator.dart';
import 'package:flutter_template/widget/club_detail/club_banner.dart';
import 'package:flutter_template/widget/club_detail/club_header.dart';
import 'package:flutter_template/widget/club_detail/member_list.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:get_it/get_it.dart';

class ClubDetailScreen extends StatefulWidget {
  static const routeName = 'club_detail';
  final String clubId;
  const ClubDetailScreen({
    Key? key,
    required this.clubId,
  }) : super(key: key);

  @override
  ClubDetailScreenState createState() => ClubDetailScreenState();
}

@visibleForTesting
class ClubDetailScreenState extends State<ClubDetailScreen> with BackNavigatorMixin, ErrorNavigatorMixin implements ClubDetailViewNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ClubDetailViewModel>(
      create: () => GetIt.I()..init(this, widget.clubId),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) {
        return Scaffold(
          backgroundColor: theme.colorsTheme.backgroundDark,
          body: viewModel.club == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(children: [
                  Stack(
                    children: [
                      ClubBanner(imgUrl: viewModel.club!.coverPhoto!),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(ThemeDimens.padding56, 270, ThemeDimens.padding56, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClubHeader(
                              club: viewModel.club!,
                            ),
                            const SizedBox(
                              height: ThemeDimens.padding16,
                            ),
                            viewModel.members == null
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : MemberList(
                                    title: 'Members',
                                    memberList: viewModel.members!,
                                  ),
                            const SizedBox(
                              height: ThemeDimens.padding16,
                            ),
                            viewModel.admins == null
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : MemberList(
                                    title: 'Admins',
                                    memberList: viewModel.admins!,
                                  )
                          ],
                        ),
                      )
                    ],
                  ),
                ]),
        );
      },
    );
  }

  @override
  void goToHome() {
    // TODO: implement goToHome
  }
}
