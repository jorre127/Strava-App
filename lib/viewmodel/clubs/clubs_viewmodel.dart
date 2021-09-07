import 'package:flutter_template/navigator/mixin/error_navigator.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClubsViewModel with ChangeNotifierEx {
  late ClubsViewNavigator _navigator;

  var runningPicture = 'https://thumbs.dreamstime.com/b/healthy-lifestyle-fitness-sports-woman-running-sunrise-road-39709089.jpg';
  var cyclingPicture = 'https://static6.depositphotos.com/1070914/590/i/950/depositphotos_5907954-stock-photo-man-extreme-biking.jpg';

  Future<void> init(ClubsViewNavigator navigator) async {
    _navigator = navigator;
  }
}

// ignore: one_member_abstracts
abstract class ClubsViewNavigator implements ErrorNavigator {
  void goToHome();
}
