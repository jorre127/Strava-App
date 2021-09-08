import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/model/webservice/club/club.dart';
import 'package:flutter_template/util/app_constants.dart';

class WebserviceTest {
  String baseUrl = 'https://www.strava.com/api/v3';

  Future<Club> getClub(String id) async {
    try {
      final url = '$baseUrl/clubs/$id';
      print(url);
      print(AppConstants.ACCESS_TOKEN);
      final _result = await Dio().get<Map<String,dynamic>>(url, options: Options(headers: <String, String>{'Authorization': 'Bearer ${AppConstants.ACCESS_TOKEN}'}));
      final value = Club.fromJson(_result.data!);
      return value;
    } catch (e) {
      print(e);
      return const Club();
    }
  }
}
