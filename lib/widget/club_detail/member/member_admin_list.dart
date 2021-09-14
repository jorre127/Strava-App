import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/member/member.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/widget/club_detail/member/member_list.dart';
import 'package:flutter_template/widget/general/conditional_shower.dart';
import 'package:flutter_template/widget/general/section_card.dart';

class MemberAdminList extends StatelessWidget {
  final List<Member>? members;
  final List<Member>? admins;
  final Function setSelectedMember;
  final int selectedMember;
  final Localization localization;
  const MemberAdminList({
    required this.setSelectedMember,
    required this.selectedMember,
    required this.members,
    required this.admins,
    required this.localization,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        children: [
          ConditionalShower<List<Member>>(
            data: members,
            builder: (context, members) => MemberList(
              title: localization.clubDetailMemberTitle,
              selectedMember: selectedMember,
              setSelectedMember: setSelectedMember,
              memberList: members,
            ),
          ),
          const SizedBox(
            height: ThemeDimens.padding16,
          ),
          ConditionalShower<List<Member>>(
            data: admins,
            builder: (context, admins) => MemberList(
              title: localization.clubDetailAdminTitle,
              selectedMember: selectedMember,
              setSelectedMember: setSelectedMember,
              memberList: admins,
              memberOffset: members!.length,
            ),
          ),
        ],
      ),
    );
  }
}
