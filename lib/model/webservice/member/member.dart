import 'package:json_annotation/json_annotation.dart';

part 'member.g.dart';

@JsonSerializable(explicitToJson: true)
class Member {
  @JsonKey(name: 'firstname', required: true, includeIfNull: false)
  String firstname;
  @JsonKey(name: 'lastname', required: true, includeIfNull: false)
  String lastname;

  Member({
    required this.firstname,
    required this.lastname,
  });

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);

}
