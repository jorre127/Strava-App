// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'athlete',
      'name',
      'distance',
      'moving_time',
      'elapsed_time',
      'total_elevation_gain'
    ],
  );
  return Activity(
    athlete: Member.fromJson(json['athlete'] as Map<String, dynamic>),
    name: json['name'] as String,
    distance: (json['distance'] as num).toDouble(),
    movingTime: json['moving_time'] as int,
    elapsedTime: json['elapsed_time'] as int,
    totalElevationGain: (json['total_elevation_gain'] as num).toDouble(),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ActivityToJson(Activity instance) {
  final val = <String, dynamic>{
    'athlete': instance.athlete.toJson(),
    'name': instance.name,
    'distance': instance.distance,
    'moving_time': instance.movingTime,
    'elapsed_time': instance.elapsedTime,
    'total_elevation_gain': instance.totalElevationGain,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  return val;
}
