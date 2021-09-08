import 'package:flutter_template/model/webservice/club/club.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:flutter_template/webservice/club/club_webservice_test.dart';
import 'package:flutter_template/webservice/todo/todo_webservice.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class ClubDetailRepository {
  @factoryMethod
  factory ClubDetailRepository(AuthStorage storage) = _ClubDetailRepository;

  Future<Club> getClub(String id);

}

class _ClubDetailRepository implements ClubDetailRepository {
  final AuthStorage _authStorage;

  _ClubDetailRepository(this._authStorage);

  @override
  Future<Club> getClub(String id) async => WebserviceTest().getClub(id);
}
