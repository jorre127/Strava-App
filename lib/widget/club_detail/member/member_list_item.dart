import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/member/member.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class MemberListItem extends StatelessWidget {
  final Member member;
  const MemberListItem({
    required this.member,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Container(
        color: theme.colorsTheme.disabledWidget,
        child: Padding(
          padding: const EdgeInsets.all(ThemeDimens.padding12),
          child: Container(
            child: Text(
              '${member.firstname!} ${member.lastname}',
              style: theme.lightTextTheme.titleSmall,
            ),
          ),
        ),
      ),
    );
  }
}
