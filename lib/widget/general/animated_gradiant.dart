import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class AnimatedGradiant extends StatelessWidget {
  final double gradiantRatio;
  const AnimatedGradiant({
    Key? key,
    this.isActive = false,
    this.gradiantRatio = 0.05,
  }) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => AnimatedContainer(
        duration: ThemeDurations.shortAnimationDuration(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [isActive ? 0.2 : gradiantRatio, 1],
            colors: const [ThemeColors.primary, Colors.transparent],
          ),
        ),
      ),
    );
  }
}
