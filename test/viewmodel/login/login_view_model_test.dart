import 'package:flutter_template/viewmodel/login/login_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '/Users/jordydejonghe/Documents/Flutter_Projects/Strava-App/test/di/injectable_test.mocks.dart';

void main() {
  late LoginViewModel loginViewModel;
  late MockLoginRepository loginRepo;

  setUp(
    () {
      loginRepo = MockLoginRepository();
      loginViewModel = LoginViewModel(loginRepo);
    },
  );

  group(
    'Login',
    () {
      test('login with strava', (){
        verifyZeroInteractions(loginRepo);
        loginViewModel.onLoginClicked();
        verify(loginRepo.login()).called(1);
        verifyNoMoreInteractions(loginRepo);
      });
    },
  );
}
