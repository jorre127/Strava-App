import 'package:flutter_template/repository/club_detail/club_detail_repository.dart';
import 'package:flutter_template/repository/login/login_repository.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:flutter_template/webservice/club/club_webservice.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  ClubDetailRepository,
  LoginRepository,
  ClubWebService,
  AuthStorage,
])
void main() {}
