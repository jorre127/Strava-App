import 'package:dio/dio.dart';
import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/model/webservice/club/club.dart';
import 'package:flutter_template/model/webservice/member/member.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'club_webservice.g.dart';

@RestApi()
@singleton
abstract class ClubWebService {
  @factoryMethod
  factory ClubWebService(Dio dio) = _ClubWebService;

  @GET('/clubs/{clubId}')
  Future<Club> getClub(@Path('clubId') String id);

  @GET('/clubs/{clubId}/members')
  Future<List<Member>> getClubMembers(@Path('clubId') String id);

  @GET('/clubs/{clubId}/admins')
  Future<List<Member>> getClubAdmins(@Path('clubId') String id);

  @GET('/clubs/{clubId}/activities')
  Future<List<Activity>> getClubActivities(@Path('clubId') String id);
}
