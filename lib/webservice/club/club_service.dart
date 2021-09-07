import 'package:flutter_template/model/webservice/club/club.dart';

// ignore: one_member_abstracts
abstract class ClubService {
  Future<List<Club>> getClub();
}
