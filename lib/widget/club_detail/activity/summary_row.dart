import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/widget/general/stacked_data.dart';

class SummaryRow extends StatelessWidget {
  final double distance;
  final double movingTime;
  final double elapsedTime;
  final double totalElevationGain;
  final Localization localization;
  const SummaryRow({
    required this.distance,
    required this.movingTime,
    required this.elapsedTime,
    required this.totalElevationGain,
    required this.localization,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        StackedData(
          label: localization.clubDetailTotalDistanceTitle,
          value: '${(distance / 1000).toStringAsFixed(2)} Km',
        ),
        const SizedBox(width: ThemeDimens.padding16),
        StackedData(
          label: localization.clubDetailTotalMovingTimeTitle,
          value: '${((movingTime / 60) / 60).toStringAsFixed(2)} Hours',
        ),
        const SizedBox(width: ThemeDimens.padding16),
        StackedData(
          label: localization.clubDetailTotalElapsedTimeTitle,
          value: '${((elapsedTime / 60) / 60).toStringAsFixed(2)} Hours',
        ),
        const SizedBox(width: ThemeDimens.padding16),
        StackedData(
          label: localization.clubDetailTotalElevationGainTitle,
          value: '${totalElevationGain.toStringAsFixed(2)} Meters',
        ),
      ],
    );
  }
}
