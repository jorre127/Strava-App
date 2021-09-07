import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class LoginRepository {
  @factoryMethod
  factory LoginRepository(AuthStorage storage) = _LoginRepository;

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
    //TODO Add Auth0 authentication for strava

    /*final queryParameters = {
      'client_id': AppConstants.CLIENT_ID,
      'redirect_uri': 'http://localhost:${AppConstants.PORT}/',
      'scope': 'activity:write,read',
      'response_type': 'code',
      'approval_prompt': 'auto'
    };
    const domain = 'www.strava.com';
    const path = '/oauth/authorize';
    final Auth0 auth0 = await createAuth0Client(Auth0CreateOptions(
      domain: domain + path,
      client_id: AppConstants.CLIENT_ID,
    ));

    String token = await auth0.getTokenWithPopup();
    print(token);

    //final url = Uri.https(domain, path, queryParameters);
    */
  }
}
