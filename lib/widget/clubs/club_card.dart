import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/widget/general/animated_gradiant.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class ClubCard extends StatefulWidget {
  const ClubCard({
    required this.onClick,
    Key? key,
    this.width = 450,
    this.height = 450,
    this.title = '',
    this.url = 'https://thumbs.dreamstime.com/b/healthy-lifestyle-fitness-sports-woman-running-sunrise-road-39709089.jpg',
  }) : super(key: key);
  final double width;
  final double height;
  final String title;
  final String url;
  final VoidCallback onClick;

  @override
  _ClubCardState createState() => _ClubCardState();
}

class _ClubCardState extends State<ClubCard> {
  bool isHovered = false;
  double scaleFactor = 1.1;
  double currentScale = 1;

  void _onEnter(PointerEnterEvent event) {
    setState(() {
      currentScale = scaleFactor;
      isHovered = true;
    });
  }

  void _onExit(PointerExitEvent event) {
    setState(() {
      currentScale = 1;
      isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(childBuilderTheme: (context, theme) {
      return GestureDetector(
        onTap: widget.onClick,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: _onEnter,
          onExit: _onExit,
          child: TweenAnimationBuilder(
            curve: Curves.easeIn,
            duration: ThemeDurations.shortAnimationDuration(),
            tween: Tween(begin: 1, end: currentScale),
            builder: (context, value, child) {
              return Transform.scale(
                scale: value as double,
                child: Container(
                  width: widget.width,
                  height: widget.height,
                  decoration: const BoxDecoration(boxShadow: [BoxShadow(color: ThemeColors.shadow, blurRadius: 10, spreadRadius: 5)]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(ThemeDimens.largeCardBorderRadius),
                    child: Stack(
                      children: [
                        Image.network(
                          widget.url,
                          fit: BoxFit.cover,
                          width: widget.width,
                          height: widget.height,
                        ),
                        AnimatedGradiant(
                          isActive: isHovered,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(ThemeDimens.padding24),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              widget.title,
                              style: theme.lightTextTheme.titleBig.copyWith(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
