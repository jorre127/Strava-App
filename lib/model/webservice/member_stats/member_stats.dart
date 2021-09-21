import 'package:json_annotation/json_annotation.dart';

part 'member_stats.g.dart';

@JsonSerializable(explicitToJson: true)
class MemberStats {
  @JsonKey(name: 'firstname', required: true, includeIfNull: false)
  String firstname;
  @JsonKey(name: 'lastname', required: true, includeIfNull: false)
  String lastname;
  @JsonKey(name: 'total_distance', required: true, includeIfNull: false)
  double totalDistance;
  @JsonKey(name: 'total_moving_time', required: true, includeIfNull: false)
  double totalMovingTime;
  @JsonKey(name: 'total_elapsed_time', required: true, includeIfNull: false)
  double totalElapsedTime;
  @JsonKey(name: 'total_elevatiion_gain', required: true, includeIfNull: false)
  double totalElevatiionGain;

  MemberStats({
    required this.firstname,
    required this.lastname,
    required this.totalDistance,
    required this.totalMovingTime,
    required this.totalElapsedTime,
    required this.totalElevatiionGain,
  });

  factory MemberStats.fromJson(Map<String, dynamic> json) => _$MemberStatsFromJson(json);

  Map<String, dynamic> toJson() => _$MemberStatsToJson(this);

}
