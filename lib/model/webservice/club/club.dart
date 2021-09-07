import 'package:json_annotation/json_annotation.dart';

part 'club.g.dart';

@JsonSerializable(explicitToJson: true)
class Club {
  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'profile_medium', includeIfNull: false)
  final String? profileMedium;
  @JsonKey(name: 'profile', includeIfNull: false)
  final String? profile;
  @JsonKey(name: 'cover_photo', includeIfNull: false)
  final String? coverPhoto;
  @JsonKey(name: 'cover_photo_small', includeIfNull: false)
  final String? coverPhotoSmall;
  @JsonKey(name: 'sport_type', includeIfNull: false)
  final String? sportType;
  @JsonKey(name: 'city', includeIfNull: false)
  final String? city;
  @JsonKey(name: 'state', includeIfNull: false)
  final String? state;
  @JsonKey(name: 'country', includeIfNull: false)
  final String? country;
  @JsonKey(name: 'private', includeIfNull: false)
  final bool? private;
  @JsonKey(name: 'member_count', includeIfNull: false)
  final int? memberCount;
  @JsonKey(name: 'featured', includeIfNull: false)
  final bool? featured;
  @JsonKey(name: 'verified', includeIfNull: false)
  final bool? verified;
  @JsonKey(name: 'url', includeIfNull: false)
  final String? url;
  @JsonKey(name: 'membership', includeIfNull: false)
  final String? membership;
  @JsonKey(name: 'admin', includeIfNull: false)
  final bool? admin;
  @JsonKey(name: 'owner', includeIfNull: false)
  final bool? owner;
  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;
  @JsonKey(name: 'club_type', includeIfNull: false)
  final String? clubType;
  @JsonKey(name: 'post_count', includeIfNull: false)
  final int? postCount;
  @JsonKey(name: 'owner_id', includeIfNull: false)
  final int? ownerId;
  @JsonKey(name: 'following_count', includeIfNull: false)
  final int? followingCount;

  const Club({
    this.id,
    this.name,
    this.profileMedium,
    this.profile,
    this.coverPhoto,
    this.coverPhotoSmall,
    this.sportType,
    this.city,
    this.state,
    this.country,
    this.private,
    this.memberCount,
    this.featured,
    this.verified,
    this.url,
    this.membership,
    this.admin,
    this.owner,
    this.description,
    this.clubType,
    this.postCount,
    this.ownerId,
    this.followingCount,
  });

  factory Club.fromJson(Map<String, dynamic> json) => _$ClubFromJson(json);

  Map<String, dynamic> toJson() => _$ClubToJson(this);

}
