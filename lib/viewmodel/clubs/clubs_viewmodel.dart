import 'package:flutter_template/navigator/mixin/error_navigator.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClubsViewModel with ChangeNotifierEx {
  late ClubsViewNavigator _navigator;

  final runningPicture = 'https://thumbs.dreamstime.com/b/healthy-lifestyle-fitness-sports-woman-running-sunrise-road-39709089.jpg';
  final cyclingPicture = 'https://static6.depositphotos.com/1070914/590/i/950/depositphotos_5907954-stock-photo-man-extreme-biking.jpg';
  final runningClub = '198480';
  final cyclingClub = '198478';

  Future<void> init(ClubsViewNavigator navigator) async {
    _navigator = navigator;
  }

  void _onCardClicked(String clubId) => _navigator.goToClubDetail(clubId);

  void onRunningCardClicked() {
    _onCardClicked(runningClub);
  }

  void onCyclingCardClicked() => _onCardClicked(cyclingClub);
}

// ignore: one_member_abstracts
abstract class ClubsViewNavigator implements ErrorNavigator {
  void goToClubDetail(String clubId);
}
