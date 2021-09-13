import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/widget/club_detail/activity/summary_row.dart';
import 'package:flutter_template/widget/general/section_card.dart';
import 'package:flutter_template/widget/general/section_title.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class ActivityOverview extends StatelessWidget {
  final String title;
  final Activity activity;
  final Localization localization;
  const ActivityOverview({
    required this.activity,
    required this.title,
    required this.localization,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => SectionCard(
        child: Padding(
          padding: const EdgeInsets.all(ThemeDimens.padding12),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(
                  title: title,
                ),
                SummaryRow(
                  totalElevationGain: activity.totalElevationGain,
                  distance: activity.distance,
                  movingTime: activity.movingTime,
                  elapsedTime: activity.elapsedTime,
                  localization: localization,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
