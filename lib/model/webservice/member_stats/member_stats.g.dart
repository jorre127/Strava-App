// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberStats _$MemberStatsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'firstname',
      'lastname',
      'total_distance',
      'total_moving_time',
      'total_elapsed_time',
      'total_elevatiion_gain'
    ],
  );
  return MemberStats(
    firstname: json['firstname'] as String,
    lastname: json['lastname'] as String,
    totalDistance: (json['total_distance'] as num).toDouble(),
    totalMovingTime: json['total_moving_time'] as int,
    totalElapsedTime: json['total_elapsed_time'] as int,
    totalElevatiionGain: (json['total_elevatiion_gain'] as num).toDouble(),
    id: json['id'] as String?,
  );
}

Map<String, dynamic> _$MemberStatsToJson(MemberStats instance) {
  final val = <String, dynamic>{
    'firstname': instance.firstname,
    'lastname': instance.lastname,
    'total_distance': instance.totalDistance,
    'total_moving_time': instance.totalMovingTime,
    'total_elapsed_time': instance.totalElapsedTime,
    'total_elevatiion_gain': instance.totalElevatiionGain,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}
