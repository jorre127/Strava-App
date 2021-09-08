import 'package:flutter_template/util/app_constants.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class AuthStorage {
  @factoryMethod
  factory AuthStorage(SimpleKeyValueStorage storage) = _AuthStorage;

  Future<String?> getRefreshToken();

  Future<String?> getAccessToken();

  Future<void> clear();

  Future<void> saveUserCredentials({required String accessToken, required String refreshToken});

  Future<bool> hasLoggedInUser();
}

class _AuthStorage implements AuthStorage {
  final SimpleKeyValueStorage _storage;
  static const _ACCESS_TOKEN = 'ACCESS_TOKEN';
  static const _REFRESH_TOKEN = 'ACCESS_REFRESH_TOKEN';

  _AuthStorage(this._storage);

  @override
  Future<String?> getAccessToken() async => /*_storage.getValue(key: _ACCESS_TOKEN*/ AppConstants.ACCESS_TOKEN;

  @override
  Future<String?> getRefreshToken() => _storage.getValue(key: _REFRESH_TOKEN);

  @override
  Future<void> saveUserCredentials({required String accessToken, required String refreshToken}) {
    return Future.wait(
      [
        _storage.setValue(key: _ACCESS_TOKEN, value: accessToken),
        _storage.setValue(key: _REFRESH_TOKEN, value: refreshToken),
      ],
    );
  }

  @override
  Future<bool> hasLoggedInUser() async {
    final result = await await2(getRefreshToken(), getAccessToken());
    return result.item1 != null && result.item2 != null;
  }

  @override
  Future<void> clear() async {
    await Future.wait([
      _storage.removeValue(key: _ACCESS_TOKEN),
      _storage.removeValue(key: _REFRESH_TOKEN),
    ]);
  }
}
