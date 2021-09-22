import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_template/model/webservice/member/member.dart';

part 'activity.g.dart';

@JsonSerializable(explicitToJson: true)
class Activity {
  @JsonKey(name: 'athlete', required: true, includeIfNull: false)
  final Member athlete;
  @JsonKey(name: 'name', required: true, includeIfNull: false)
  final String name;
  @JsonKey(name: 'distance', required: true, includeIfNull: false)
  final double distance;
  @JsonKey(name: 'moving_time', required: true, includeIfNull: false)
  final int movingTime;
  @JsonKey(name: 'elapsed_time', required: true, includeIfNull: false)
  final int elapsedTime;
  @JsonKey(name: 'total_elevation_gain', required: true, includeIfNull: false)
  final double totalElevationGain;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;

  const Activity({
    required this.athlete,
    required this.name,
    required this.distance,
    required this.movingTime,
    required this.elapsedTime,
    required this.totalElevationGain,
    this.type,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityToJson(this);

}
