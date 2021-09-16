import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/leader_board_spot/leader_board_spot.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/club_detail/leader_board/leader_board_avatar.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class LeaderBoardSection extends StatelessWidget {
  final List<LeaderBoardSpot> memberStats;
  final String title;
  final double conversion;
  final String symbol;
  const LeaderBoardSection({
    required this.symbol,
    required this.memberStats,
    required this.title,
    this.conversion = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.lightTextTheme.titleNormal,
          ),
          const SizedBox(
            height: ThemeDimens.padding24,
          ),
          Row(
            children: [
              LeaderBoardAvatar(
                color: Colors.grey,
                conversion: conversion,
                leaderBoardSpot: memberStats[1],
                symbol: symbol,
              ),
              const SizedBox(
                width: ThemeDimens.padding24,
              ),
              LeaderBoardAvatar(
                color: Colors.yellow,
                conversion: conversion,
                leaderBoardSpot: memberStats[0],
                symbol: symbol,
              ),
              const SizedBox(
                width: ThemeDimens.padding24,
              ),
              LeaderBoardAvatar(
                color: Colors.brown,
                conversion: conversion,
                leaderBoardSpot: memberStats[2],
                symbol: symbol,
              )
            ],
          ),
        ],
      ),
    );
  }
}
