// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['firstname', 'lastname'],
  );
  return Member(
    firstname: json['firstname'] as String,
    lastname: json['lastname'] as String,
  );
}

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };
