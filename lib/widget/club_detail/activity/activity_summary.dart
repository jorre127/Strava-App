import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/activity_summary/activity_summary.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
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
              Wrap(
                children: [
                  StackedData(
                    width: 150,
                    label: 'Total Distance',
                    value: '${(activitySummary.totalDistance / 1000).toStringAsFixed(2)} Km',
                  ),
                  StackedData(
                    width: 150,
                    label: 'Total Moving Time',
                    value: '${((activitySummary.totalMovingTime / 60) / 60).toStringAsFixed(2)} Hours',
                  ),
                  StackedData(
                    width: 150,
                    label: 'Total Elapsed Time',
                    value: '${((activitySummary.totalElapsedTime / 60) / 60).toStringAsFixed(2)} Hours',
                  ),
                  StackedData(
                    width: 150,
                    label: 'Total Elevation Gain',
                    value: '${activitySummary.totalElevatiionGain} Meters',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
