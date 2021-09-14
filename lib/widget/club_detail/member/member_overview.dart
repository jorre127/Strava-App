import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/model/webservice/member_stats/member_stats.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/widget/club_detail/activity/summary_row.dart';
import 'package:flutter_template/widget/club_detail/member/member_activities.dart';
import 'package:flutter_template/widget/general/section_card.dart';
import 'package:flutter_template/widget/general/section_title.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class MemberOverview extends StatelessWidget {
  final MemberStats member;
  final List<Activity> activities;
  final Localization localization;
  const MemberOverview({
    required this.member,
    required this.activities,
    required this.localization,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => SectionCard(
        child: Padding(
          padding: const EdgeInsets.all(ThemeDimens.padding12),
          child: Column(
            children: [
              Row(
                children: [
                  SectionTitle(title: '${member.firstname} ${member.lastname}'),
                  const Spacer(),
                  SummaryRow(
                    distance: member.totalDistance,
                    movingTime: member.totalMovingTime,
                    elapsedTime: member.totalElapsedTime,
                    totalElevationGain: member.totalElevatiionGain,
                    localization: localization,
                  ),
                ],
              ),
              const SizedBox(
                height: ThemeDimens.padding12,
              ),
              Container(
                height: 200,
                width: double.infinity,
                child: MemberActivites(
                  localization: localization,
                  activities: activities.where((activity) => activity.athlete.firstname == member.firstname && activity.athlete.lastname == member.lastname).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
