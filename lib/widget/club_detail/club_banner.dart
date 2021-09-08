import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/widget/general/animated_gradiant.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class ClubBanner extends StatelessWidget {
  final String imgUrl;
  const ClubBanner({required this.imgUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Container(
        height: 400,
        width: double.infinity,
        child: Stack(
          children: [
            Image(
              image: NetworkImage(imgUrl),
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, object, trace) => Container(
                color: ThemeColors.white,
              ),
            ),
            const AnimatedGradiant()
          ],
        ),
      ),
    );
  }
}
