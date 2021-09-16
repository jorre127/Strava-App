import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/widget/club_detail/activity/activity_list.dart';
import 'package:flutter_template/widget/club_detail/activity/activity_overview.dart';
import 'package:flutter_template/widget/general/conditional_shower.dart';

class RightColumn extends StatelessWidget {
  final List<Activity>? activities;
  final int selectedActivity;
  final Function setSelectedActivity;
  final Localization localization;
  const RightColumn({
    required this.activities,
    required this.selectedActivity,
    required this.setSelectedActivity,
    required this.localization,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConditionalShower<List<Activity>>(
          data: activities,
          builder: (context, activities) => ActivityOverview(
            title: activities[selectedActivity].name,
            activity: activities[selectedActivity],
            localization: localization,
          ),
        ),
        const SizedBox(
          height: ThemeDimens.padding16,
        ),
        ConditionalShower<List<Activity>>(
          data: activities,
          placeholderHeight: 765,
          builder: (context, activities) => ActivityList(
            title: localization.clubDetailActivityTitle,
            activities: activities,
            selectedActivity: selectedActivity,
            setSelectedActivity: setSelectedActivity,
            localization: localization,
          ),
        ),
      ],
    );
  }
}
