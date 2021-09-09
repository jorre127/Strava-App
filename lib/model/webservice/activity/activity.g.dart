// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      athlete: json['athlete'] == null
          ? null
          : Member.fromJson(json['athlete'] as Map<String, dynamic>),
      name: json['name'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
      movingTime: (json['moving_time'] as num?)?.toDouble(),
      elapsedTime: (json['elapsed_time'] as num?)?.toDouble(),
      totalElevationGain: (json['total_elevation_gain'] as num?)?.toDouble(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('athlete', instance.athlete?.toJson());
  writeNotNull('name', instance.name);
  writeNotNull('distance', instance.distance);
  writeNotNull('moving_time', instance.movingTime);
  writeNotNull('elapsed_time', instance.elapsedTime);
  writeNotNull('total_elevation_gain', instance.totalElevationGain);
  writeNotNull('type', instance.type);
  return val;
}
