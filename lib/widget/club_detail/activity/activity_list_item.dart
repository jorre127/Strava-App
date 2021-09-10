import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/general/stacked_data.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:flutter_template/styles/theme_durations.dart';

class ActivityListItem extends StatelessWidget {
  final Activity activity;
  final int selectedActivity;
  final int index;
  const ActivityListItem({
    required this.selectedActivity,
    required this.index,
    required this.activity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: ThemeDurations.shortAnimationDuration(),
          decoration: BoxDecoration(
            color: selectedActivity == index ? theme.colorsTheme.accent : theme.colorsTheme.accent.withOpacity(0.15),
            borderRadius: BorderRadius.circular(ThemeDimens.largeCardBorderRadius),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: theme.colorsTheme.shadow,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              ThemeDimens.padding16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.name,
                  style: theme.lightTextTheme.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: ThemeDimens.padding16,
                ),
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  children: [
                    StackedData(
                      label: 'Distance',
                      value: activity.distance.toString(),
                    ),
                    StackedData(
                      label: 'Moving Time',
                      value: activity.movingTime.toString(),
                    ),
                    StackedData(
                      label: 'Elapsed Time',
                      value: activity.elapsedTime.toString(),
                    ),
                    StackedData(
                      label: 'Total Elevation Gain',
                      value: activity.totalElevationGain.toString(),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  'By ${activity.athlete.firstname} ${activity.athlete.lastname}',
                  style: theme.lightTextTheme.bodyUltraSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
