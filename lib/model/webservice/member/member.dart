import 'package:json_annotation/json_annotation.dart';

part 'member.g.dart';

@JsonSerializable(explicitToJson: true)
class Member {
  @JsonKey(name: 'firstname', includeIfNull: false)
  final String? firstname;
  @JsonKey(name: 'lastname', includeIfNull: false)
  final String? lastname;

  const Member({
    this.firstname,
    this.lastname,
  });

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);

}
