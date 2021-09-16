import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/member/member.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/club_detail/member/member_list_item.dart';
import 'package:flutter_template/widget/general/section_card.dart';
import 'package:flutter_template/widget/general/section_title.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class MemberList extends StatelessWidget {
  final List<Member> memberList;
  final String title;
  final String selectedMember;
  final Function setSelectedMember;
  const MemberList({
    required this.setSelectedMember,
    required this.selectedMember,
    required this.memberList,
    Key? key,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => SectionCard(
        child: Padding(
          padding: const EdgeInsets.all(ThemeDimens.padding12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: title),
              Container(
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(ThemeDimens.cardBorderRadius),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: memberList.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => setSelectedMember(memberList[index].firstname+ memberList[index].lastname),
                      child: MemberListItem(
                        selectedMember: selectedMember,
                        member: memberList[index],
                      ),
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
