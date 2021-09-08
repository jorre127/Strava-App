import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/member/member.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/club_detail/member_list_item.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class MemberList extends StatelessWidget {
  final List<Member> memberList;
  const MemberList({required this.memberList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Members',
                style: theme.lightTextTheme.titleBig,
              ),
            ),
            const SizedBox(
              height: ThemeDimens.padding16,
            ),
            Container(
              height: 300,
              width: 800,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(blurRadius: 10, color: theme.colorsTheme.shadow),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(ThemeDimens.cardBorderRadius),
                child: ListView(
                  children: memberList
                      .map(
                        (member) => MemberListItem(
                          member: member,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
