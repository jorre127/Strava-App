import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/club/club.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/general/section_title.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class ClubHeader extends StatelessWidget {
  final Club club;
  const ClubHeader({required this.club, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              club.profile!,
              errorBuilder: (context, object, trace) => Container(
                width: 30,
                height: 30,
                color: theme.colorsTheme.secondary.withOpacity(0.8),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SectionTitle(title: club.name!),
                Text(
                  club.memberCount.toString(),
                  style: theme.lightTextTheme.bodySmall,
                ),
                Icon(
                  Icons.accessibility,
                  color: theme.colorsTheme.secondary.withOpacity(0.8),
                  size: 17,
                )
              ],
            ),
            const SizedBox(
              height: ThemeDimens.padding4,
            ),
            Row(
              children: [
                Text(
                  '${club.state == null ? 'unkown' : club.state!}, ',
                  style: theme.lightTextTheme.bodySmall,
                ),
                Text(
                  club.country == null ? 'unkown' : club.country!,
                  style: theme.lightTextTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(
              height: ThemeDimens.padding24,
            ),
            Text(
              club.description == null ? 'no description' : club.description!,
              style: theme.lightTextTheme.bodyNormal,
            ),
          ],
        ),
      ),
    );
  }
}
