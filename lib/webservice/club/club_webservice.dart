import 'package:dio/dio.dart';
import 'package:flutter_template/model/webservice/Club/Club.dart';
import 'package:flutter_template/webservice/Club/Club_service.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'club_webservice.g.dart';

@dev
@prod
@Singleton(as: ClubService)
@RestApi()
abstract class ClubWebService extends ClubService  {
  @factoryMethod
  factory ClubWebService(Dio dio) = _ClubWebService;

}
