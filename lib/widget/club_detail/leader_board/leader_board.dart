import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/member_stats/member_stats.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/distance_formatter.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/util/time_formatter.dart';
import 'package:flutter_template/widget/general/section_card.dart';
import 'package:flutter_template/widget/general/section_title.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class LeaderBoard extends StatefulWidget {
  final String title;
  final List<MemberStats> memberStats;
  const LeaderBoard({
    required this.memberStats,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  var currentSortColumn = 1;
  var isAscending = false;

  void onSortDistance(int columnIndex, bool boolean) {
    setState(() {
      currentSortColumn = columnIndex;
      widget.memberStats.sort((memberA, memberB) => memberB.totalDistance.compareTo(memberA.totalDistance));
    });
  }

  void onSortElapsedTime(int columnIndex, bool boolean) {
    setState(() {
      currentSortColumn = columnIndex;
      widget.memberStats.sort((memberA, memberB) => memberB.totalElapsedTime.compareTo(memberA.totalElapsedTime));
    });
  }

  void onSortMovingTime(int columnIndex, bool boolean) {
    setState(() {
      currentSortColumn = columnIndex;
      widget.memberStats.sort((memberA, memberB) => memberB.totalMovingTime.compareTo(memberA.totalMovingTime));
    });
  }

  void onSortElevationGain(int columnIndex, bool boolean) {
    setState(() {
      currentSortColumn = columnIndex;
      widget.memberStats.sort((memberA, memberB) => memberB.totalElevatiionGain.compareTo(memberA.totalElevatiionGain));
    });
  }

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => SectionCard(
        child: Padding(
          padding: const EdgeInsets.all(ThemeDimens.padding12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: widget.title),
              SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  child: SizedBox(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 30,
                        sortColumnIndex: currentSortColumn,
                        sortAscending: isAscending,
                        dataTextStyle: theme.lightTextTheme.bodySmall,
                        headingTextStyle: theme.lightTextTheme.bodySmall.copyWith(fontWeight: FontWeight.bold),
                        columns: [
                          const DataColumn(
                            label: Text(''),
                          ),
                          DataColumn(
                            onSort: onSortDistance,
                            label: Text(Localization.of(context).clubDetailTotalDistanceTitle),
                          ),
                          DataColumn(
                            onSort: onSortElapsedTime,
                            label: Text(Localization.of(context).clubDetailTotalElapsedTimeTitle),
                          ),
                          DataColumn(
                            onSort: onSortMovingTime,
                            label: Text(Localization.of(context).clubDetailTotalMovingTimeTitle),
                          ),
                          DataColumn(
                            onSort: onSortElevationGain,
                            label: Text(Localization.of(context).clubDetailTotalElevationGainTitle),
                          ),
                        ],
                        rows: List.generate(
                          widget.memberStats.length,
                          (index) => DataRow(
                            color: MaterialStateColor.resolveWith((states) {
                              switch (index) {
                                case 0:
                                  return Colors.yellow.withOpacity(0.2);
                                case 1:
                                  return Colors.grey.withOpacity(0.2);
                                case 2:
                                  return Colors.brown.withOpacity(0.3);
                                default:
                                  return theme.colorsTheme.backgroundDark.withOpacity(0.2);
                              }
                            }),
                            cells: [
                              DataCell(Text('${widget.memberStats[index].firstname} ${widget.memberStats[index].lastname}')),
                              DataCell(Text(DistanceFormatter.format(widget.memberStats[index].totalDistance))),
                              DataCell(Text(TimeFormatter.format(widget.memberStats[index].totalElapsedTime))),
                              DataCell(Text(TimeFormatter.format(widget.memberStats[index].totalMovingTime))),
                              DataCell(Text(DistanceFormatter.format(widget.memberStats[index].totalElevatiionGain))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
