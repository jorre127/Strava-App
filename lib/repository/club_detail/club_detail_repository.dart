import 'package:flutter_template/model/webservice/club/club.dart';
import 'package:flutter_template/model/webservice/member/member.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:flutter_template/webservice/club/club_webservice.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class ClubDetailRepository {
  @factoryMethod
  factory ClubDetailRepository(AuthStorage storage, ClubWebService webserviceTest) = _ClubDetailRepository;

  Future<Club> getClub(String clubId);
  Future<List<Member>> getMembers(String clubId);
  Future<List<Member>> getAdmins(String clubId);
}

class _ClubDetailRepository implements ClubDetailRepository {
  final AuthStorage _authStorage;
  final ClubWebService _clubWebService;
  _ClubDetailRepository(this._authStorage, this._clubWebService);

  @override
  Future<Club> getClub(String clubId) => _clubWebService.getClub(clubId);

  @override
  Future<List<Member>> getMembers(String clubId) => _clubWebService.getClubMembers(clubId);

  @override
  Future<List<Member>> getAdmins(String clubId) => _clubWebService.getClubAdmins(clubId);
}
