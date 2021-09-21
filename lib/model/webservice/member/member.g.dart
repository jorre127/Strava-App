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
    isAdmin: json['isAdmin'] as bool?,
  );
}

Map<String, dynamic> _$MemberToJson(Member instance) {
  final val = <String, dynamic>{
    'firstname': instance.firstname,
    'lastname': instance.lastname,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('isAdmin', instance.isAdmin);
  return val;
}
