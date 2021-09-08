import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/club/club.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class ClubHeader extends StatelessWidget {
  const ClubHeader({required this.club, Key? key}) : super(key: key);
  final Club club;
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
                color: Colors.white,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  club.name!,
                  style: theme.lightTextTheme.titleNormal,
                ),
                const SizedBox(
                  width: ThemeDimens.padding16,
                ),
                Text(
                  club.memberCount.toString(),
                  style: theme.lightTextTheme.bodySmall,
                ),
                const Icon(
                  Icons.accessibility,
                  color: Colors.white,
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
                  '${club.state!}, ',
                  style: theme.lightTextTheme.bodySmall,
                ),
                Text(
                  club.country!,
                  style: theme.lightTextTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(
              height: ThemeDimens.padding24,
            ),
            Text(
              club.description!,
              style: theme.lightTextTheme.bodyNormal,
            ),
          ],
        ),
      ),
    );
  }
}
