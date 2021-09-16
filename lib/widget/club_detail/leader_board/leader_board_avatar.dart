import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/leader_board_spot/leader_board_spot.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class LeaderBoardAvatar extends StatelessWidget {
  final LeaderBoardSpot leaderBoardSpot;
  final double conversion;
  final String symbol;
  final Color color;
  const LeaderBoardAvatar({
    required this.symbol,
    required this.leaderBoardSpot,
    required this.color,
    this.conversion = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  spreadRadius: 4,
                  color: color.withOpacity(0.3),
                ),
              ],
            ),
            child: CircleAvatar(
              child: Text(
                leaderBoardSpot.firstname[0],
                style: theme.lightTextTheme.titleSmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              radius: 35,
              backgroundColor: color,
            ),
          ),
          const SizedBox(height: ThemeDimens.padding8),
          Text(
            '${leaderBoardSpot.firstname} ${leaderBoardSpot.lastname}',
            style: theme.lightTextTheme.titleSmall,
          ),
          Text(
            '${(leaderBoardSpot.stat / conversion).toStringAsFixed(2)} $symbol',
            style: theme.lightTextTheme.titleSmall.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorsTheme.accent,
            ),
          )
        ],
      ),
    );
  }
}
