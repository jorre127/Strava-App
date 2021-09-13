import 'package:json_annotation/json_annotation.dart';

part 'activity_summary.g.dart';

@JsonSerializable(explicitToJson: true)
class ActivitySummary {
  @JsonKey(name: 'total_distance', required: true, includeIfNull: false)
  double totalDistance;
  @JsonKey(name: 'total_moving_time', required: true, includeIfNull: false)
  double totalMovingTime;
  @JsonKey(name: 'total_elapsed_time', required: true, includeIfNull: false)
  double totalElapsedTime;
  @JsonKey(name: 'total_elevatiion_gain', required: true, includeIfNull: false)
  double totalElevatiionGain;

  ActivitySummary({
    required this.totalDistance,
    required this.totalMovingTime,
    required this.totalElapsedTime,
    required this.totalElevatiionGain,
  });

  factory ActivitySummary.fromJson(Map<String, dynamic> json) => _$ActivitySummaryFromJson(json);

  Map<String, dynamic> toJson() => _$ActivitySummaryToJson(this);

}
