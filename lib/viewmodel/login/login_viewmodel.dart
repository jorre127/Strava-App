import 'package:flutter_template/navigator/mixin/error_navigator.dart';
import 'package:flutter_template/repository/login/login_repository.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel with ChangeNotifierEx {
  final LoginRepository _loginRepo;
  late LoginNavigator _navigator;

  var _isLoading = false;

  LoginViewModel(this._loginRepo);

  bool get isLoading => _isLoading;

  Future<void> init(LoginNavigator navigator) async {
    _navigator = navigator;
  }

  Future<void> onLoginClicked() async {
    try {
      _isLoading = true;
      await _loginRepo.login();
      _navigator.goToClubSelection();
    } catch (e, stack) {
      logger.error('Failed to login', error: e, trace: stack);
      if (e is LocalizedError) {
        _navigator.showErrorWithLocaleKey(e.getLocalizedKey());
      } else {
        _navigator.showErrorWithLocaleKey(LocalizationKeys.errorGeneral);
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

// ignore: one_member_abstracts
abstract class LoginNavigator implements ErrorNavigator {
  void goToClubSelection();
}
