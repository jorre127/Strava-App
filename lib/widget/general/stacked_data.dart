import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class StackedData extends StatelessWidget {
  final String label;
  final String value;
  final double height;
  final double width;

  const StackedData({
    required this.label,
    required this.value,
    Key? key,
    this.height = 70,
    this.width = 110,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Container(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: theme.lightTextTheme.bodyUltraSmall.copyWith(
                color: theme.colorsTheme.secondary.withOpacity(0.7),
                fontSize: 11,
              ),
            ),
            const SizedBox(
              height: ThemeDimens.padding4,
            ),
            Text(
              value,
              style: theme.lightTextTheme.titleSmall.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
