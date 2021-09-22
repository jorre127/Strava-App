import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/distance_formatter.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/util/time_formatter.dart';
import 'package:flutter_template/widget/general/stacked_data.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:flutter_template/styles/theme_durations.dart';

class ActivityListItem extends StatelessWidget {
  final Activity activity;
  final int? selectedActivityIndex;
  final int index;

  const ActivityListItem({
    required this.index,
    required this.activity,
    this.selectedActivityIndex,
    Key? key,
  }) : super(key: key);

  bool get isSelected => selectedActivityIndex == index;

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
                          LabeledDataCell(
                            label: Localization.of(context).clubDetailTotalDistanceTitle,
                            value: DistanceFormatter.format(activity.distance),
                          ),
                          const SizedBox(height: ThemeDimens.padding8),
                          LabeledDataCell(
                            label: Localization.of(context).clubDetailTotalMovingTimeTitle,
                            value: TimeFormatter.format(activity.movingTime),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabeledDataCell(
                            label: Localization.of(context).clubDetailTotalElapsedTimeTitle,
                            value: TimeFormatter.format(activity.elapsedTime),
                          ),
                          const SizedBox(height: ThemeDimens.padding8),
                          LabeledDataCell(
                            label: Localization.of(context).clubDetailTotalElevationGainTitle,
                            value: DistanceFormatter.format(activity.totalElevationGain),
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
