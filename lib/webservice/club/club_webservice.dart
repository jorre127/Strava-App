import 'package:dio/dio.dart';
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

  @GET('/clubs/{id}')
  Future<Club> getClub(@Path('id') String id);

  @GET('/clubs/{id}/members')
  Future<List<Member>> getClubMembers(@Path('id') String id);

  @GET('/clubs/{id}/admins')
  Future<List<Member>> getClubAdmins(@Path('id') String id);
}
