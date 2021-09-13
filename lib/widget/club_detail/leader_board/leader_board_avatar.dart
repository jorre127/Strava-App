import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/member_stats/member_stats.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class LeaderBoardAvatar extends StatelessWidget {
  final MemberStats memberStats;
  final double stat;
  final double conversion;
  final String symbol;
  final Color color;
  const LeaderBoardAvatar({
    required this.stat,
    required this.symbol,
    required this.memberStats,
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
                memberStats.firstname[0],
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
            '${memberStats.firstname} ${memberStats.lastname}',
            style: theme.lightTextTheme.titleSmall,
          ),
          Text(
            '${(stat / conversion).toStringAsFixed(2)} ${symbol}',
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
