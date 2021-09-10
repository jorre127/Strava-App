import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Column(
        children: [
          Text(
            title,
            style: theme.lightTextTheme.titleNormal.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: ThemeDimens.padding16,
          ),
        ],
      ),
    );
  }
}
