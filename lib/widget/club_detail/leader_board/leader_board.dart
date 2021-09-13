import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/member_stats/member_stats.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/widget/club_detail/leader_board/leader_board_section.dart';
import 'package:flutter_template/widget/general/section_card.dart';
import 'package:flutter_template/widget/general/section_title.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class LeaderBoard extends StatelessWidget {
  final String title;
  final List<MemberStats> memberStats;
  final Localization localization;
  const LeaderBoard({
    required this.memberStats,
    required this.title,
    required this.localization,
    Key? key,
  }) : super(key: key);

  List<MemberStats> getTopMembersDistance() {
    final tempMemberStats = [...memberStats];
    // ignore: cascade_invocations
    tempMemberStats.sort(
      (a, b) => b.totalDistance.compareTo(a.totalDistance),
    );
    return tempMemberStats;
  }

  List<MemberStats> getTopMembersElevationGain() {
    final tempMemberStats = [...memberStats];
    // ignore: cascade_invocations
    tempMemberStats.sort(
      (a, b) => b.totalElevatiionGain.compareTo(a.totalElevatiionGain),
    );
    return tempMemberStats;
  }

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => SectionCard(
        child: Padding(
          padding: const EdgeInsets.all(ThemeDimens.padding12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: title),
              Row(
                children: [
                  LeaderBoardSection(
                    memberStats: getTopMembersDistance(),
                    title: localization.clubDetailTotalDistanceTitle,
                    symbol: 'Km',
                    conversion: 1000,
                  ),
                  const Spacer(),
                  LeaderBoardSection(
                    memberStats: getTopMembersElevationGain(),
                    title: localization.clubDetailTotalElevationGainTitle,
                    symbol: 'Km',
                    conversion: 1000,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
