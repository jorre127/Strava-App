import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/model/webservice/club/club.dart';
import 'package:flutter_template/model/webservice/member/member.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/viewmodel/club_detail/club_detail_viewmodel.dart';
import 'package:flutter_template/navigator/mixin/back_navigator.dart';
import 'package:flutter_template/navigator/mixin/error_navigator.dart';
import 'package:flutter_template/widget/club_detail/activity/activity_list.dart';
import 'package:flutter_template/widget/club_detail/club_banner.dart';
import 'package:flutter_template/widget/club_detail/club_header.dart';
import 'package:flutter_template/widget/club_detail/member/member_list.dart';
import 'package:flutter_template/widget/general/conditional_shower.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:get_it/get_it.dart';

class ClubDetailScreen extends StatefulWidget {
  static const routeName = 'club_detail';
  final String clubId;
  const ClubDetailScreen({
    required this.clubId,
    Key? key,
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
          body: ConditionalShower<Club>(
            data: viewModel.club,
            builder: (context, club) => ListView(
              children: [
                Stack(
                  children: [
                    ClubBanner(imgUrl: club.coverPhoto!),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        ThemeDimens.padding56,
                        270,
                        ThemeDimens.padding56,
                        0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClubHeader(
                            club: club,
                          ),
                          const SizedBox(
                            height: ThemeDimens.padding16,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(children: [
                                ConditionalShower<List<Member>>(
                                  data: viewModel.members,
                                  builder: (context, members) => MemberList(
                                    title: localization.clubDetailMemberTitle,
                                    memberList: members,
                                  ),
                                ),
                                const SizedBox(
                                  height: ThemeDimens.padding16,
                                ),
                                ConditionalShower<List<Member>>(
                                  data: viewModel.admins,
                                  builder: (context, admins) => MemberList(
                                    title: localization.clubDetailAdminTitle,
                                    memberList: admins,
                                  ),
                                ),
                              ]),
                              const SizedBox(
                                width: ThemeDimens.padding32,
                              ),
                              Column(
                                children: [
                                  ConditionalShower<List<Activity>>(
                                    data: viewModel.activities,
                                    builder: (context, activities) => ActivityList(
                                      title: localization.clubDetailActivityTitle,
                                      activities: activities,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: ThemeDimens.padding32,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
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
