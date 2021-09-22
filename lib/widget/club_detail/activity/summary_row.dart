import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/distance_formatter.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/util/time_formatter.dart';
import 'package:flutter_template/widget/general/stacked_data.dart';

class SummaryRow extends StatelessWidget {
  final double distance;
  final int movingTime;
  final int elapsedTime;
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
        LabeledDataCell(
          label: Localization.of(context).clubDetailTotalDistanceTitle,
          value: DistanceFormatter.format(distance),
        ),
        const SizedBox(width: ThemeDimens.padding16),
        LabeledDataCell(
          label: Localization.of(context).clubDetailTotalMovingTimeTitle,
          value: TimeFormatter.format(movingTime),
        ),
        const SizedBox(width: ThemeDimens.padding16),
        LabeledDataCell(
          label: Localization.of(context).clubDetailTotalElapsedTimeTitle,
          value: TimeFormatter.format(elapsedTime),
        ),
        const SizedBox(width: ThemeDimens.padding16),
        LabeledDataCell(
          label: Localization.of(context).clubDetailTotalElevationGainTitle,
          value: DistanceFormatter.format(totalElevationGain),
        ),
      ],
    );
  }
}
