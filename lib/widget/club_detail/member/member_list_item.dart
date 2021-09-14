import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/model/webservice/member/member.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class MemberListItem extends StatelessWidget {
  final Member member;
  final int selectedMember;
  final int index;
  const MemberListItem({
    required this.selectedMember,
    required this.index,
    required this.member,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeDimens.padding8,
          ),
          child: Container(
            width: 110,
            height: 70,
            decoration: BoxDecoration(
              color: theme.colorsTheme.accent.withOpacity(
                index == selectedMember ? 0.4 : 0.15,
              ),
              borderRadius: BorderRadius.circular(ThemeDimens.largeCardBorderRadius),
              boxShadow: [
                BoxShadow(blurRadius: 10, color: theme.colorsTheme.shadow),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(ThemeDimens.padding12),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: theme.colorsTheme.accent,
                    child: Text(
                      member.firstname[0],
                      style: theme.lightTextTheme.titleSmall.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: ThemeDimens.padding8,
                  ),
                  Container(
                    child: Text(
                      '${member.firstname} ${member.lastname}',
                      style: theme.lightTextTheme.titleSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
