// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leader_board_spot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaderBoardSpot _$LeaderBoardSpotFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['firstname', 'lastname', 'stat'],
  );
  return LeaderBoardSpot(
    firstname: json['firstname'] as String,
    lastname: json['lastname'] as String,
    stat: (json['stat'] as num).toDouble(),
  );
}

Map<String, dynamic> _$LeaderBoardSpotToJson(LeaderBoardSpot instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'stat': instance.stat,
    };
