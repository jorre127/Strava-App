import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/widget/general/section_card.dart';
import 'package:flutter_template/widget/general/section_title.dart';
import 'package:flutter_template/widget/general/stacked_data.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class ActivityOverview extends StatelessWidget {
  final String title;
  final Activity activity;
  const ActivityOverview({
    required this.activity,
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
            SectionTitle(
              title: title,
            ),
            Row(
              children: [
                StackedData(
                  label: 'Total Distance',
                  value: activity.distance.round().toString(),
                ),
                StackedData(
                  label: 'Total Moving Time',
                  value: activity.movingTime.toString(),
                ),
                StackedData(
                  label: 'Total Elapsed Time',
                  value: activity.elapsedTime.toString(),
                ),
                StackedData(
                  label: 'Total Elevation Gain',
                  value: activity.totalElevationGain.toString(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
