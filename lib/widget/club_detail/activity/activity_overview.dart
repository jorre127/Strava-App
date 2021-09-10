import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(ThemeDimens.padding12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(
                title: title,
              ),
              Row(
                children: [
                  StackedData(
                    width: 150,
                    label: 'Total Distance',
                    value: '${(activity.distance / 1000).toStringAsFixed(2)} Km',
                  ),
                  StackedData(
                    width: 150,
                    label: 'Total Moving Time',
                    value: '${((activity.movingTime / 60) / 60).toStringAsFixed(2)} Hours',
                  ),
                  StackedData(
                    width: 150,
                    label: 'Total Elapsed Time',
                    value: '${((activity.elapsedTime / 60) / 60).toStringAsFixed(2)} Hours',
                  ),
                  StackedData(
                    width: 150,
                    label: 'Total Elevation Gain',
                    value: '${activity.totalElevationGain} Meters',
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
