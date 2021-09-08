import 'package:flutter_template/model/webservice/club/club.dart';
import 'package:flutter_template/navigator/mixin/error_navigator.dart';
import 'package:flutter_template/repository/club_detail/club_detail_repository.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClubDetailViewModel with ChangeNotifierEx {
  final ClubDetailRepository _clubDetailRepository;
  late ClubDetailViewNavigator _navigator;
  Club? club;

  ClubDetailViewModel(this._clubDetailRepository);

  Future<void> init(ClubDetailViewNavigator navigator) async {
    _navigator = navigator;
    await getClub();
    notifyListeners();
  }

  Future<void> getClub() async {
    club = await _clubDetailRepository.getClub('198480');
    notifyListeners();
  }
}

// ignore: one_member_abstracts
abstract class ClubDetailViewNavigator implements ErrorNavigator {
  void goToHome();
}
