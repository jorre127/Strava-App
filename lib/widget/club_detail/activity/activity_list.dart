import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/club_detail/activity/activity_list_item.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> activities;
  final String title;
  const ActivityList({
    required this.activities,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Container(
        width: 800,
        height: 900,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.lightTextTheme.titleNormal.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: ThemeDimens.padding16,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: activities.length,
                itemBuilder: (context, index) => ActivityListItem(
                  activity: activities[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
