import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_template/model/webservice/member/member.dart';

part 'activity.g.dart';

@JsonSerializable(explicitToJson: true)
class Activity {
  @JsonKey(name: 'athlete', includeIfNull: false)
  final Member? athlete;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'distance', includeIfNull: false)
  final double? distance;
  @JsonKey(name: 'moving_time', includeIfNull: false)
  final double? movingTime;
  @JsonKey(name: 'elapsed_time', includeIfNull: false)
  final double? elapsedTime;
  @JsonKey(name: 'total_elevation_gain', includeIfNull: false)
  final double? totalElevationGain;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;

  const Activity({
    this.athlete,
    this.name,
    this.distance,
    this.movingTime,
    this.elapsedTime,
    this.totalElevationGain,
    this.type,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityToJson(this);

}
