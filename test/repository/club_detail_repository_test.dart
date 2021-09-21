import 'package:flutter_template/model/webservice/activity/activity.dart';
import 'package:flutter_template/model/webservice/club/club.dart';
import 'package:flutter_template/model/webservice/member/member.dart';
import 'package:flutter_template/repository/club_detail/club_detail_repository.dart';
import 'package:flutter_template/viewmodel/clubs/clubs_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '/Users/jordydejonghe/Documents/Flutter_Projects/Strava-App/test/di/injectable_test.mocks.dart';

void main() {
  late ClubDetailRepository clubDetailRepository;
  late MockClubWebService clubWebService;
  late ClubsViewModel clubsViewModel;

  setUp(
    () {
      clubsViewModel = ClubsViewModel();
      clubWebService = MockClubWebService();
      clubDetailRepository = ClubDetailRepository(clubWebService);
    },
  );

  group('Api calls', () {
    test('Should get club ', () {
      when(clubDetailRepository.getClub(clubsViewModel.runningClub)).thenAnswer(
        (realInvocation) => Future<Club>.value(
          const Club(),
        ),
      );
      verifyZeroInteractions(clubWebService);
      clubDetailRepository.getClub(clubsViewModel.runningClub);
      verify(clubWebService.getClub(clubsViewModel.runningClub)).called(1);
      verifyNoMoreInteractions(clubWebService);
    });
    test('Should get members ', () {
      when(clubDetailRepository.getMembers(clubsViewModel.runningClub)).thenAnswer(
        (realInvocation) => Future<List<Member>>.value(
          List<Member>.empty(),
        ),
      );
      verifyZeroInteractions(clubWebService);
      clubDetailRepository.getMembers(clubsViewModel.runningClub);
      verify(clubWebService.getClubMembers(clubsViewModel.runningClub)).called(1);
      verifyNoMoreInteractions(clubWebService);
    });
    test('Should get admins ', () {
      when(clubDetailRepository.getAdmins(clubsViewModel.runningClub)).thenAnswer(
        (realInvocation) => Future<List<Member>>.value(
          List<Member>.empty(),
        ),
      );
      verifyZeroInteractions(clubWebService);
      clubDetailRepository.getAdmins(clubsViewModel.runningClub);
      verify(clubWebService.getClubAdmins(clubsViewModel.runningClub)).called(1);
      verifyNoMoreInteractions(clubWebService);
    });
    test('Should get activities ', () {
      when(clubDetailRepository.getActivites(clubsViewModel.runningClub)).thenAnswer(
        (realInvocation) => Future<List<Activity>>.value(
          List<Activity>.empty(),
        ),
      );
      verifyZeroInteractions(clubWebService);
      clubDetailRepository.getActivites(clubsViewModel.runningClub);
      verify(clubWebService.getClubActivities(clubsViewModel.runningClub)).called(1);
      verifyNoMoreInteractions(clubWebService);
    });
  });
}
