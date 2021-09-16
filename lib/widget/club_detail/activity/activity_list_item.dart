import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/widget/general/stacked_data.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:flutter_template/styles/theme_durations.dart';

class ActivityListItem extends StatelessWidget {
  final Activity activity;
  final int selectedActivity;
  final int index;
  final Localization localization;
  const ActivityListItem({
    required this.index,
    required this.activity,
    required this.localization,
    this.selectedActivity = -1,
    Key? key,
  }) : super(key: key);

  bool get isSelected => selectedActivity == index;

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: ThemeDurations.shortAnimationDuration(),
          decoration: BoxDecoration(
            color: isSelected ? theme.colorsTheme.accent : theme.colorsTheme.accent.withOpacity(0.15),
            borderRadius: BorderRadius.circular(ThemeDimens.largeCardBorderRadius),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 3,
                color: isSelected ? theme.colorsTheme.accent.withOpacity(0.2) : theme.colorsTheme.shadow,
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
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StackedData(
                            label: localization.clubDetailTotalDistanceTitle,
                            value: '${(activity.distance / 1000).toStringAsFixed(2)} Km',
                          ),
                          const SizedBox(height: ThemeDimens.padding8),
                          StackedData(
                            label: localization.clubDetailTotalMovingTimeTitle,
                            value: '${((activity.movingTime / 60) / 60).toStringAsFixed(2)} Hours',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StackedData(
                            label: localization.clubDetailTotalElapsedTimeTitle,
                            value: '${((activity.elapsedTime / 60) / 60).toStringAsFixed(2)} Hours',
                          ),
                          const SizedBox(height: ThemeDimens.padding8),
                          StackedData(
                            label: localization.clubDetailTotalElevationGainTitle,
                            value: '${activity.totalElevationGain} metres',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Text(
                  'By ${activity.athlete.firstname} ${activity.athlete.lastname}',
                  style: theme.lightTextTheme.bodyUltraSmall,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
