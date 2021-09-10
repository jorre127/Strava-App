import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/activity_summary/activity_summary.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: title),
            Row(
              children: [
                StackedData(
                  label: 'Total Distance',
                  value: activitySummary.totalDistance.round().toString(),
                ),
                StackedData(
                  label: 'Total Moving Time',
                  value: activitySummary.totalMovingTime.toString(),
                ),
                StackedData(
                  label: 'Total Elapsed Time',
                  value: activitySummary.totalElapsedTime.toString(),
                ),
                StackedData(
                  label: 'Total Elevation Gain',
                  value: activitySummary.totalElevatiionGain.toString(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
