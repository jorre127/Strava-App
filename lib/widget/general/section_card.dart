import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class SectionCard extends StatelessWidget {
  final Widget child;
  const SectionCard({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Container(
        decoration: BoxDecoration(
          color: theme.colorsTheme.disabledWidget,
          borderRadius: BorderRadius.circular(
            ThemeDimens.largeCardBorderRadius,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: theme.colorsTheme.shadow,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
