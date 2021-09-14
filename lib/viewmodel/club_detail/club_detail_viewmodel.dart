import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/model/webservice/activity_summary/activity_summary.dart';
import 'package:flutter_template/model/webservice/club/club.dart';
import 'package:flutter_template/model/webservice/member/member.dart';
import 'package:flutter_template/model/webservice/member_stats/member_stats.dart';
import 'package:flutter_template/navigator/mixin/error_navigator.dart';
import 'package:flutter_template/repository/club_detail/club_detail_repository.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

@injectable
class ClubDetailViewModel with ChangeNotifierEx {
  final ClubDetailRepository _clubDetailRepository;
  late ClubDetailViewNavigator _navigator;
  Club? club;
  List<Member>? members;
  List<Member>? admins;
  List<Member>? adminMembers;
  List<Activity>? activities;
  ActivitySummary? activitySummary;
  List<MemberStats>? memberStats;
  int selectedActivity = 0;
  int selectedMember = 0;

  ClubDetailViewModel(this._clubDetailRepository);

  Future<void> init(ClubDetailViewNavigator navigator, String clubId) async {
    _navigator = navigator;
    await getClub(clubId);
    await getMembers(clubId);
    await getAdmins(clubId);
    getAdminMembers();
    await getActivites(clubId);
    getMemberStats();
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

  void getAdminMembers() {
    final tempArray = [...members!];
    tempArray.addAll(admins!);
    adminMembers = tempArray;
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
    activitySummary = summary;
  }

  void getMemberStats() {
    final tempMemberStats = <MemberStats>[];
    adminMembers!.forEach(
      (member) => tempMemberStats.add(
        MemberStats(
          firstname: member.firstname,
          lastname: member.lastname,
          totalDistance: 0,
          totalMovingTime: 0,
          totalElapsedTime: 0,
          totalElevatiionGain: 0,
        ),
      ),
    );
    activities!.forEach((activity) {
      final currentMember = tempMemberStats
          .where(
            (member) => member.firstname == activity.athlete.firstname && member.lastname == activity.athlete.lastname,
          )
          .first;
      // ignore: cascade_invocations
      currentMember
        ..totalDistance += activity.distance
        ..totalElapsedTime = activity.elapsedTime
        ..totalElevatiionGain = activity.totalElevationGain
        ..totalMovingTime = activity.movingTime;
    });
    memberStats = tempMemberStats;
  }

  void setSelectedActivity(int index) {
    selectedActivity = index;
    notifyListeners();
  }

  void setSelectedMember(int index) {
    selectedMember = index;
    notifyListeners();
  }
}

// ignore: one_member_abstracts
abstract class ClubDetailViewNavigator implements ErrorNavigator {
  void goToHome();
}
