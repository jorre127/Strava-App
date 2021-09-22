import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/club_detail/activity/activity_list_item.dart';
import 'package:flutter_template/widget/general/section_card.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class ActivityList extends StatefulWidget {
  final List<Activity> activities;
  final String title;
  final int selectedActivityIndex;
  final Function onActivitySelected;
  const ActivityList({
    required this.onActivitySelected,
    required this.selectedActivityIndex,
    required this.activities,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  _ActivityListState createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => SectionCard(
        child: Container(
          height: 880,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: widget.activities.length,
                  padding: const EdgeInsets.all(ThemeDimens.padding12),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => widget.onActivitySelected(index),
                    child: ActivityListItem(
                      selectedActivityIndex: widget.selectedActivityIndex,
                      index: index,
                      activity: widget.activities[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
