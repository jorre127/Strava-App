// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Club _$ClubFromJson(Map<String, dynamic> json) => Club(
      id: json['id'] as int?,
      name: json['name'] as String?,
      profileMedium: json['profile_medium'] as String?,
      profile: json['profile'] as String?,
      coverPhoto: json['cover_photo'] as String?,
      coverPhotoSmall: json['cover_photo_small'] as String?,
      sportType: json['sport_type'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      private: json['private'] as bool?,
      memberCount: json['member_count'] as int?,
      featured: json['featured'] as bool?,
      verified: json['verified'] as bool?,
      url: json['url'] as String?,
      membership: json['membership'] as String?,
      admin: json['admin'] as bool?,
      owner: json['owner'] as bool?,
      description: json['description'] as String?,
      clubType: json['club_type'] as String?,
      postCount: json['post_count'] as int?,
      ownerId: json['owner_id'] as int?,
      followingCount: json['following_count'] as int?,
    );

Map<String, dynamic> _$ClubToJson(Club instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('profile_medium', instance.profileMedium);
  writeNotNull('profile', instance.profile);
  writeNotNull('cover_photo', instance.coverPhoto);
  writeNotNull('cover_photo_small', instance.coverPhotoSmall);
  writeNotNull('sport_type', instance.sportType);
  writeNotNull('city', instance.city);
  writeNotNull('state', instance.state);
  writeNotNull('country', instance.country);
  writeNotNull('private', instance.private);
  writeNotNull('member_count', instance.memberCount);
  writeNotNull('featured', instance.featured);
  writeNotNull('verified', instance.verified);
  writeNotNull('url', instance.url);
  writeNotNull('membership', instance.membership);
  writeNotNull('admin', instance.admin);
  writeNotNull('owner', instance.owner);
  writeNotNull('description', instance.description);
  writeNotNull('club_type', instance.clubType);
  writeNotNull('post_count', instance.postCount);
  writeNotNull('owner_id', instance.ownerId);
  writeNotNull('following_count', instance.followingCount);
  return val;
}
