import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/member_stats/member_stats.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/club_detail/leader_board/leader_board_avatar.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class LeaderBoardSection extends StatelessWidget {
  final List<MemberStats> memberStats;
  final String title;
  final double conversion;
  final String symbol;
  const LeaderBoardSection({
    this.conversion = 0,
    required this.symbol,
    required this.memberStats,
    required this.title,
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
                memberStats: memberStats[1],
                color: Colors.grey,
                conversion: conversion,
                stat: memberStats[1].totalDistance,
                symbol: symbol,
              ),
              const SizedBox(
                width: ThemeDimens.padding24,
              ),
              LeaderBoardAvatar(
                memberStats: memberStats[0],
                color: Colors.yellow,
                conversion: conversion,
                stat: memberStats[0].totalDistance,
                symbol: symbol,
              ),
              const SizedBox(
                width: ThemeDimens.padding24,
              ),
              LeaderBoardAvatar(
                memberStats: memberStats[2],
                color: Colors.brown,
                conversion: conversion,
                stat: memberStats[2].totalDistance,
                symbol: symbol,
              )
            ],
          ),
        ],
      ),
    );
  }
}
