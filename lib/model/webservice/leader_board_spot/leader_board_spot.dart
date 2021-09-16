import 'package:json_annotation/json_annotation.dart';

part 'leader_board_spot.g.dart';

@JsonSerializable(explicitToJson: true)
class LeaderBoardSpot {
  @JsonKey(name: 'firstname', required: true, includeIfNull: false)
  String firstname;
  @JsonKey(name: 'lastname', required: true, includeIfNull: false)
  String lastname;
  @JsonKey(name: 'stat', required: true, includeIfNull: false)
  double stat;

  LeaderBoardSpot({
    required this.firstname,
    required this.lastname,
    required this.stat,
  });

  factory LeaderBoardSpot.fromJson(Map<String, dynamic> json) => _$LeaderBoardSpotFromJson(json);

  Map<String, dynamic> toJson() => _$LeaderBoardSpotToJson(this);

}
