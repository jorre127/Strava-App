import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/member/member.dart';
import 'package:flutter_template/model/webservice/member_stats/member_stats.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/widget/club_detail/activity/summary_row.dart';
import 'package:flutter_template/widget/general/section_card.dart';
import 'package:flutter_template/widget/general/section_title.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class MemberOverview extends StatelessWidget {
  final MemberStats member;
  final Localization localization;
  const MemberOverview({
    required this.member,
    required this.localization,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => SectionCard(
        child: Padding(
          padding: const EdgeInsets.all(ThemeDimens.padding12),
          child: Row(
            children: [
              SectionTitle(title: '${member.firstname} ${member.lastname}'),
              const Spacer(),
              SummaryRow(
                distance: member.totalDistance,
                movingTime: member.totalMovingTime,
                elapsedTime: member.totalElapsedTime,
                totalElevationGain: member.totalElevatiionGain,
                localization: localization,
              )
            ],
          ),
        ),
      ),
    );
  }
}
