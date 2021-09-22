import 'package:flutter_template/repository/login/login_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../di/injectable_test.mocks.dart';

void main() {
  late LoginRepository loginRepository;
  late MockAuthStorage authStorage;

  setUp(
    () {
      authStorage = MockAuthStorage();
      loginRepository = LoginRepository(authStorage);
    },
  );
  group(
    'Login',
    () {
      test('Strava login', () {
        verifyZeroInteractions(authStorage);
        loginRepository.login();
        verify(
          authStorage.saveUserCredentials(
            accessToken: anyNamed('accesToken'),
            refreshToken: anyNamed('refreshToken'),
          ),
        ).called(1);
        verifyNoMoreInteractions(authStorage);
      });
    },
  );
}
