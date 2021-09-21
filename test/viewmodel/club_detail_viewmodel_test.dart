import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/model/webservice/club/club.dart';
import 'package:flutter_template/model/webservice/member/member.dart';
import 'package:flutter_template/viewmodel/club_detail/club_detail_viewmodel.dart';
import 'package:flutter_template/viewmodel/clubs/clubs_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '/Users/jordydejonghe/Documents/Flutter_Projects/Strava-App/test/di/injectable_test.mocks.dart';

void main() {
  late ClubDetailViewModel clubDetailViewModel;
  late ClubsViewModel clubsViewModel;
  late MockClubDetailRepository clubDetailRepository;

  setUp(
    () {
      clubDetailRepository = MockClubDetailRepository();
      clubsViewModel = ClubsViewModel();
      clubDetailViewModel = ClubDetailViewModel(clubDetailRepository);
    },
  );

  group('Api calls', () {
    test('Should get club ', () {
      when(clubDetailViewModel.getClub(clubsViewModel.runningClub)).thenAnswer(
        (realInvocation) => Future<Club>.value(
          const Club(),
        ),
      );
      verifyZeroInteractions(clubDetailRepository);
      clubDetailViewModel.getClub(clubsViewModel.runningClub);
      verify(clubDetailRepository.getClub(clubsViewModel.runningClub)).called(1);
      verifyNoMoreInteractions(clubDetailRepository);
    });
    test('Should get members ', () {
      when(clubDetailViewModel.getMembers(clubsViewModel.runningClub)).thenAnswer(
        (realInvocation) => Future<List<Member>>.value(
          List<Member>.empty(),
        ),
      );
      verifyZeroInteractions(clubDetailRepository);
      clubDetailViewModel.getMembers(clubsViewModel.runningClub);
      verify(clubDetailRepository.getMembers(clubsViewModel.runningClub)).called(1);
      verifyNoMoreInteractions(clubDetailRepository);
    });
    test('Should get admins ', () {
      when(clubDetailViewModel.getAdmins(clubsViewModel.runningClub)).thenAnswer(
        (realInvocation) => Future<List<Member>>.value(
          List<Member>.empty(),
        ),
      );
      verifyZeroInteractions(clubDetailRepository);
      clubDetailViewModel.getAdmins(clubsViewModel.runningClub);
      verify(clubDetailRepository.getAdmins(clubsViewModel.runningClub)).called(1);
      verifyNoMoreInteractions(clubDetailRepository);
    });
    test('Should get activities ', () {
      when(clubDetailViewModel.getActivites(clubsViewModel.runningClub)).thenAnswer(
        (realInvocation) => Future<List<Activity>>.value(
          List<Activity>.empty(),
        ),
      );
      verifyZeroInteractions(clubDetailRepository);
      clubDetailViewModel.getActivites(clubsViewModel.runningClub);
      verify(clubDetailRepository.getActivites(clubsViewModel.runningClub)).called(1);
      verifyNoMoreInteractions(clubDetailRepository);
    });
  });

  group('Set selected menu item', () {
    test('set selected activity', () {
      clubDetailViewModel.setSelectedActivity(0);
      expect(clubDetailViewModel.selectedActivity, 0);
    });
    test('set selected member', () {
      clubDetailViewModel.setSelectedMember('name');
      expect(clubDetailViewModel.selectedMember, 'name');
    });
  });
}

class MockClubDetailViewNavigator extends Mock implements ClubDetailViewNavigator {}
