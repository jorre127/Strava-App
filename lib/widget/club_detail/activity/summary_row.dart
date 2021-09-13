import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/general/stacked_data.dart';

class SummaryRow extends StatelessWidget {
  final double distance;
  final double movingTime;
  final double elapsedTime;
  final double totalElevationGain;
  const SummaryRow({
    required this.distance,
    required this.movingTime,
    required this.elapsedTime,
    required this.totalElevationGain,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        StackedData(
          label: 'Total Distance',
          value: '${(distance / 1000).toStringAsFixed(2)} Km',
        ),
        const SizedBox(width: ThemeDimens.padding16),
        StackedData(
          label: 'Total Moving Time',
          value: '${((movingTime / 60) / 60).toStringAsFixed(2)} Hours',
        ),
        const SizedBox(width: ThemeDimens.padding16),
        StackedData(
          label: 'Total Elapsed Time',
          value: '${((elapsedTime / 60) / 60).toStringAsFixed(2)} Hours',
        ),
        const SizedBox(width: ThemeDimens.padding16),
        StackedData(
          label: 'Total Elevation Gain',
          value: '$totalElevationGain Meters',
        ),
      ],
    );
  }
}
