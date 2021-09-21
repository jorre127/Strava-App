// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivitySummary _$ActivitySummaryFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'total_distance',
      'total_moving_time',
      'total_elapsed_time',
      'total_elevatiion_gain'
    ],
  );
  return ActivitySummary(
    totalDistance: (json['total_distance'] as num).toDouble(),
    totalMovingTime: (json['total_moving_time'] as num).toDouble(),
    totalElapsedTime: (json['total_elapsed_time'] as num).toDouble(),
    totalElevatiionGain: (json['total_elevatiion_gain'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ActivitySummaryToJson(ActivitySummary instance) =>
    <String, dynamic>{
      'total_distance': instance.totalDistance,
      'total_moving_time': instance.totalMovingTime,
      'total_elapsed_time': instance.totalElapsedTime,
      'total_elevatiion_gain': instance.totalElevatiionGain,
    };
