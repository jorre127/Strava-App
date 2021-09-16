import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/member_stats/member_stats.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/widget/general/section_card.dart';
import 'package:flutter_template/widget/general/section_title.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class LeaderBoard extends StatefulWidget {
  final String title;
  final List<MemberStats> memberStats;
  final Localization localization;
  const LeaderBoard({
    required this.memberStats,
    required this.title,
    required this.localization,
    Key? key,
  }) : super(key: key);

  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  var currentSortColumn = 0;
  var isAscending = false;

  void onSortDistance(int columnIndex, bool boolean) {
    setState(() {
      isAscending = !isAscending;
    });
    currentSortColumn = columnIndex;
    if (isAscending) {
      widget.memberStats.sort((memberA, memberB) => memberB.totalDistance.compareTo(memberA.totalDistance));
    } else {
      widget.memberStats.sort((memberA, memberB) => memberA.totalDistance.compareTo(memberB.totalDistance));
    }
  }

  void onSortElapsedTime(int columnIndex, bool boolean) {
    setState(() {
      isAscending = !isAscending;
    });
    currentSortColumn = columnIndex;
    if (isAscending) {
      widget.memberStats.sort((memberA, memberB) => memberB.totalElapsedTime.compareTo(memberA.totalElapsedTime));
    } else {
      widget.memberStats.sort((memberA, memberB) => memberA.totalElapsedTime.compareTo(memberB.totalElapsedTime));
    }
  }

  void onSortMovingTime(int columnIndex, bool boolean) {
    setState(() {
      isAscending = !isAscending;
    });
    currentSortColumn = columnIndex;
    if (isAscending) {
      widget.memberStats.sort((memberA, memberB) => memberB.totalMovingTime.compareTo(memberA.totalMovingTime));
    } else {
      widget.memberStats.sort((memberA, memberB) => memberA.totalMovingTime.compareTo(memberB.totalMovingTime));
    }
  }

  void onSortElevationGain(int columnIndex, bool boolean) {
    setState(() {
      isAscending = !isAscending;
    });
    currentSortColumn = columnIndex;
    if (isAscending) {
      widget.memberStats.sort((memberA, memberB) => memberB.totalElevatiionGain.compareTo(memberA.totalElevatiionGain));
    } else {
      widget.memberStats.sort((memberA, memberB) => memberA.totalElevatiionGain.compareTo(memberB.totalElevatiionGain));
    }
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
                  child: Expanded(
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
                              label: const Text('Total distance'),
                            ),
                            DataColumn(
                              onSort: onSortElapsedTime,
                              label: const Text('Total elapsed time'),
                            ),
                            DataColumn(
                              onSort: onSortMovingTime,
                              label: const Text('Total moving time'),
                            ),
                            DataColumn(
                              onSort: onSortElevationGain,
                              label: const Text('Total elevation gain'),
                            ),
                          ],
                          rows: widget.memberStats
                              .map((member) => DataRow(cells: [
                                    DataCell(Text('${member.firstname} ${member.lastname}')),
                                    DataCell(Text('${(member.totalDistance / 1000).toStringAsFixed(2)} Km')),
                                    DataCell(Text('${((member.totalElapsedTime / 60) / 60).toStringAsFixed(2)} Hours')),
                                    DataCell(Text('${((member.totalMovingTime / 60) / 60).toStringAsFixed(2)} Hours')),
                                    DataCell(Text('${member.totalElevatiionGain} metres')),
                                  ]))
                              .toList(),
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
