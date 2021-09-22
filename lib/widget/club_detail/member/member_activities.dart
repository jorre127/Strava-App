import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/club_detail/activity/activity_list_item.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class MemberActivites extends StatelessWidget {
  final List<Activity> activities;
  const MemberActivites({
    required this.activities,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: activities.length,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.symmetric(horizontal: ThemeDimens.padding12),
          width: 300,
          child: ActivityListItem(
            index: index,
            activity: activities[index],
          ),
        ),
      ),
    );
  }
}
