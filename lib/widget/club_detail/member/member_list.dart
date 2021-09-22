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
  final String? selectedMember;
  final Function onMemberSelected;
  const MemberList({
    required this.onMemberSelected,
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
                    itemBuilder: (context, index) {
                      print(memberList[index].id);
                      final currentMember = memberList[index];
                      return GestureDetector(
                        onTap: () => onMemberSelected(currentMember.id),
                        child: MemberListItem(
                          selectedMember: selectedMember ?? '',
                          member: currentMember,
                        ),
                      );
                    },
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
