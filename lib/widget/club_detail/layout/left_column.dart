import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/model/webservice/activity_summary/activity_summary.dart';
import 'package:flutter_template/model/webservice/member/member.dart';
import 'package:flutter_template/model/webservice/member_stats/member_stats.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/widget/club_detail/activity/activity_summary.dart';
import 'package:flutter_template/widget/club_detail/leader_board/leader_board.dart';
import 'package:flutter_template/widget/club_detail/member/member_list.dart';
import 'package:flutter_template/widget/club_detail/member/member_overview.dart';
import 'package:flutter_template/widget/general/conditional_shower.dart';

class LeftColumn extends StatelessWidget {
  final ActivitySummary? activitySummary;
  final List<Member>? members;
  final List<Member>? admins;
  final List<Activity>? activities;
  final List<MemberStats>? memberStats;
  final String? selectedMember;
  final Function onMemberSelected;
  final Localization localization;
  const LeftColumn({
    required this.activities,
    required this.onMemberSelected,
    required this.selectedMember,
    required this.activitySummary,
    required this.members,
    required this.admins,
    required this.memberStats,
    required this.localization,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ConditionalShower<ActivitySummary>(
          data: activitySummary,
          builder: (context, activitySummary) => ActivitySummmarySection(
            activitySummary: activitySummary,
            title: localization.clubDetailSummaryTitle,
          ),
        ),
        const SizedBox(height: ThemeDimens.padding16),
        ConditionalShower<List<MemberStats>>(
          data: memberStats,
          placeholderHeight: 330,
          builder: (context, memberStats) => LeaderBoard(
            memberStats: memberStats,
            title: 'Top Performers',
          ),
        ),
        const SizedBox(height: ThemeDimens.padding16),
        ConditionalShower<List<MemberStats>>(
          data: memberStats,
          placeholderHeight: 200,
          builder: (context, members) => MemberOverview(
            member: members.where((member) => member.id == selectedMember).first,
            activities: activities ?? [],
          ),
        ),
        const SizedBox(height: ThemeDimens.padding16),
        ConditionalShower<List<Member>>(
          data: members,
          builder: (context, members) => MemberList(
            title: localization.clubDetailMemberTitle,
            selectedMember: selectedMember,
            onMemberSelected: onMemberSelected,
            memberList: members,
          ),
        ),
      ],
    );
  }
}
