import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/model/webservice/activity_summary/activity_summary.dart';
import 'package:flutter_template/model/webservice/club/club.dart';
import 'package:flutter_template/model/webservice/member/member.dart';
import 'package:flutter_template/navigator/mixin/error_navigator.dart';
import 'package:flutter_template/repository/club_detail/club_detail_repository.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClubDetailViewModel with ChangeNotifierEx {
  final ClubDetailRepository _clubDetailRepository;
  late ClubDetailViewNavigator _navigator;
  Club? club;
  List<Member>? members;
  List<Member>? admins;
  List<Activity>? activities;
  ActivitySummary? activity_summary;

  ClubDetailViewModel(this._clubDetailRepository);

  Future<void> init(ClubDetailViewNavigator navigator, String clubId) async {
    _navigator = navigator;
    await getClub(clubId);
    await getMembers(clubId);
    await getAdmins(clubId);
    await getActivites(clubId);
    notifyListeners();
  }

  Future<void> getClub(String clubId) async {
    club = await _clubDetailRepository.getClub(clubId);
    notifyListeners();
  }

  Future<void> getMembers(String clubId) async {
    members = await _clubDetailRepository.getMembers(clubId);
    notifyListeners();
  }

  Future<void> getAdmins(String clubId) async {
    admins = await _clubDetailRepository.getAdmins(clubId);
    notifyListeners();
  }

  Future<void> getActivites(String clubId) async {
    activities = await _clubDetailRepository.getActivites(clubId);
    getActivitySummary(activities ?? []);
    notifyListeners();
  }

  void getActivitySummary(List<Activity> activities) {
    final summary = ActivitySummary(
      totalDistance: 0,
      totalElapsedTime: 0,
      totalElevatiionGain: 0,
      totalMovingTime: 0,
    );
    activities.forEach((element) {
      summary
        ..totalDistance += element.distance
        ..totalElapsedTime += element.elapsedTime
        ..totalElevatiionGain += element.totalElevationGain
        ..totalMovingTime += element.movingTime;
    });
    activity_summary = summary;
  }
}

// ignore: one_member_abstracts
abstract class ClubDetailViewNavigator implements ErrorNavigator {
  void goToHome();
}
