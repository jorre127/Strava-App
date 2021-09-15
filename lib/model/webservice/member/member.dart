import 'package:json_annotation/json_annotation.dart';

part 'member.g.dart';

@JsonSerializable(explicitToJson: true)
class Member {
  @JsonKey(name: 'firstname', required: true, includeIfNull: false)
  String firstname;
  @JsonKey(name: 'lastname', required: true, includeIfNull: false)
  String lastname;
  @JsonKey(name: 'isAdmin', includeIfNull: false)
  bool? isAdmin;

  Member({
    required this.firstname,
    required this.lastname,
    this.isAdmin,
  });

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);

}
