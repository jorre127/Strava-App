import 'dart:async';
import 'dart:developer';
import 'package:universal_html/html.dart' as html;
import 'package:dio/dio.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:flutter_template/util/app_constants.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class LoginRepository {
  @factoryMethod
  factory LoginRepository(AuthStorage authStorage) = _LoginRepository;

  Future<bool> isLoggedIn();

  Future<void> login();
}

class _LoginRepository implements LoginRepository {
  final AuthStorage _authStorage;

  _LoginRepository(this._authStorage);

  @override
  Future<bool> isLoggedIn() async => _authStorage.hasLoggedInUser();

  @override
  Future<void> login() async {
    const domain = 'https://www.strava.com';
    const authorizePath = '/oauth/authorize';
    const tokenPath = '/oauth/token';

    var authorizationCode = '';
    final currentUri = Uri.base;
    final redirectUri = Uri(
      host: currentUri.host,
      scheme: currentUri.scheme,
      port: currentUri.port,
      path: '/static.html',
    );

    final authUrl = '$domain$authorizePath?response_type=code&client_id=${AppConstants.CLIENT_ID}&redirect_uri=$redirectUri&scope=activity:write,read';

    final html.WindowBase? popupWindow = html.window.open(authUrl, 'Strava Auth', 'width=800, height=900, scrollbars=yes');
    if (popupWindow == null) return;
    final completer = Completer<void>();
    html.window.onMessage.listen((event) async {
      try {
        final receivedUri = event.data as String;
        authorizationCode = receivedUri
            .split('&')
            .firstWhere(
              (element) => element.startsWith('code'),
            )
            .substring('code='.length);
      } catch (error, trace) {
        log(error.toString());
      }

      final parameters = {
        'client_id': AppConstants.CLIENT_ID,
        'client_secret': AppConstants.CLIENT_SECRET,
        'code': authorizationCode,
        'grant_type': 'authorization_code',
      };

      try {
        final response = await Dio().post<Map<String, dynamic>>('$domain$tokenPath', queryParameters: parameters);
        await _authStorage.saveUserCredentials(
          accessToken: response.data!['access_token'].toString(),
          refreshToken: response.data!['refresh_token'].toString(),
        );
      } catch (error, trace) {
        log(error.toString());
      }
      popupWindow.close();
      completer.complete();
    });
    return completer.future;
  }
}
