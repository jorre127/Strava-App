import 'package:dio/dio.dart';
import 'package:flutter_template/model/webservice/club/club.dart';
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
}
