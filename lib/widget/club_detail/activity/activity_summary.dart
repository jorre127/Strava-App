import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/activity_summary/activity_summary.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/club_detail/activity/summary_row.dart';
import 'package:flutter_template/widget/general/section_card.dart';
import 'package:flutter_template/widget/general/section_title.dart';
import 'package:flutter_template/widget/general/stacked_data.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class ActivitySummmarySection extends StatelessWidget {
  final String title;
  final ActivitySummary activitySummary;
  const ActivitySummmarySection({
    required this.activitySummary,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => SectionCard(
        child: Padding(
          padding: const EdgeInsets.all(ThemeDimens.padding12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionTitle(title: title),
              SummaryRow(
                totalElevationGain: activitySummary.totalElevatiionGain,
                distance: activitySummary.totalDistance,
                movingTime: activitySummary.totalMovingTime,
                elapsedTime: activitySummary.totalElapsedTime,
              )
            ],
          ),
        ),
      ),
    );
  }
}
