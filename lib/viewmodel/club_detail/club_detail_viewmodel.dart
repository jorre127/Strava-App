import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/model/webservice/activity_summary/activity_summary.dart';
import 'package:flutter_template/model/webservice/club/club.dart';
import 'package:flutter_template/model/webservice/member/member.dart';
import 'package:flutter_template/model/webservice/member_stats/member_stats.dart';
import 'package:flutter_template/navigator/mixin/error_navigator.dart';
import 'package:flutter_template/repository/club_detail/club_detail_repository.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@injectable
class ClubDetailViewModel with ChangeNotifierEx {
  final ClubDetailRepository _clubDetailRepository;
  late String _clubId;
  late ClubDetailViewNavigator _navigator;
  String? _selectedMember;
  int _selectedActivityIndex = 0;
  Club? _club;
  List<Member>? _members;
  List<Member>? _admins;
  List<Activity>? _activities;
  ActivitySummary? _activitySummary;
  List<MemberStats>? _memberStats;

  Club? get club => _club;
  List<Member>? get members => _members;
  List<Member>? get admins => _admins;
  List<Activity>? get activities => _activities;
  ActivitySummary? get activitySummary => _activitySummary;
  List<MemberStats>? get memberStats => _memberStats;
  String? get selectedMember => _selectedMember;
  int get selectedActivityIndex => _selectedActivityIndex;

  ClubDetailViewModel(this._clubDetailRepository);

  Future<void> init(ClubDetailViewNavigator navigator, String clubId) async {
    _navigator = navigator;
    _clubId = clubId;
    try {
      await Future.wait([
        _getClub(),
        _getMembers(),
        _getAdmins(),
        _getActivites(),
      ]);
      _addIdToMembers();
      _checkIsAdmin();
      _getMemberStats();
      notifyListeners();
    } catch (error, trace) {
      logger.error('Failed to load dashboard', error: error, trace: trace);
    }
  }

  Future<void> _getClub() async {
    try {
      _club = await _clubDetailRepository.getClub(_clubId);
    } catch (error, trace) {
      logger.error('failed to get club', error: error, trace: trace);
      _navigator.showError(error);
    }

    notifyListeners();
  }

  Future<void> _getMembers() async {
    try {
      _members = await _clubDetailRepository.getMembers(_clubId);
    } catch (error, trace) {
      logger.error('failed to get members', error: error, trace: trace);
      _navigator.showError(error);
    }
    notifyListeners();
  }

  Future<void> _getAdmins() async {
    try {
      _admins = await _clubDetailRepository.getAdmins(_clubId);
    } catch (error, trace) {
      logger.error('failed to get admins', error: error, trace: trace);
      _navigator.showError(error);
    }
    notifyListeners();
  }

  Future<void> _getActivites() async {
    try {
      _activities = await _clubDetailRepository.getActivites(_clubId);
    } catch (error, trace) {
      logger.error('failed to get activities', error: error, trace: trace);
      _navigator.showError(error);
    }
    _getActivitySummary(activities ?? []);
    notifyListeners();
  }

  void _addIdToMembers() {
    const uuid = Uuid();
    final tempMembers = _members!
        .map(
          (member) => Member(
            firstname: member.firstname,
            lastname: member.lastname,
            id: uuid.v4(),
          ),
        )
        .toList();
    _members = tempMembers;
  }

  void _getActivitySummary(List<Activity> activities) {
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
    _activitySummary = summary;
  }

  void _getMemberStats() {
    var tempMemberStats = <MemberStats>[];
    tempMemberStats = members!.map((member) {
      final currentMember = MemberStats(
        id: member.id,
        firstname: member.firstname,
        lastname: member.lastname,
        totalDistance: 0,
        totalElapsedTime: 0,
        totalElevatiionGain: 0,
        totalMovingTime: 0,
      );
      final currentMemberActivities =
          activities!.where((activity) => currentMember.firstname == activity.athlete.firstname && currentMember.lastname == activity.athlete.lastname).toList();
      // ignore: cascade_invocations
      currentMemberActivities.forEach((activity) {
        currentMember
          ..totalDistance += activity.distance
          ..totalElapsedTime = activity.elapsedTime
          ..totalElevatiionGain = activity.totalElevationGain
          ..totalMovingTime = activity.movingTime;
      });
      return currentMember;
    }).toList();
    _memberStats = tempMemberStats;
  }

  void _checkIsAdmin() {
    _members = _members!.map(
      (member) {
        final currentAdmin = admins!.where((admin) => admin.firstname == member.firstname && admin.lastname == member.lastname);
        if (currentAdmin.isEmpty) {
          return Member(firstname: member.firstname, lastname: member.lastname, isAdmin: false);
        } else {
          return Member(firstname: member.firstname, lastname: member.lastname, isAdmin: true);
        }
      },
    ).toList();
  }

  void onActivitySelected(int index) {
    _selectedActivityIndex = index;
    notifyListeners();
  }

  void onMemberSelected(String id) {
    _selectedMember = id;
    notifyListeners();
  }
}

// ignore: one_member_abstracts
abstract class ClubDetailViewNavigator implements ErrorNavigator {
  void goToHome();
}
