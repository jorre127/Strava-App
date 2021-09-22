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
    test('Should get club ', () async {
      when(clubWebService.getClub(any)).thenAnswer(
        (realInvocation) => Future<Club>.value(
          const Club(id: 123),
        ),
      );
      verifyZeroInteractions(clubWebService);
      final result = await clubDetailRepository.getClub('lalala');
      expect(result.id, 123);
      verify(clubWebService.getClub(any)).called(1);
      verifyNoMoreInteractions(clubWebService);
    });
    test('Should get members ', () {
      when(clubWebService.getClubMembers(any)).thenAnswer(
        (realInvocation) => Future<List<Member>>.value(
          List<Member>.empty(),
        ),
      );
      verifyZeroInteractions(clubWebService);
      final result = clubDetailRepository.getMembers('');
      verify(clubWebService.getClubMembers(any)).called(1);
      verifyNoMoreInteractions(clubWebService);
    });
    test('Should get admins ', () {
      when(clubWebService.getClubAdmins(any)).thenAnswer(
        (realInvocation) => Future<List<Member>>.value(
          List<Member>.empty(),
        ),
      );
      verifyZeroInteractions(clubWebService);
      final result = clubDetailRepository.getAdmins('');
      verify(clubWebService.getClubAdmins(any)).called(1);
      verifyNoMoreInteractions(clubWebService);
    });
    test('Should get activities ', () {
      when(clubWebService.getClubActivities(any)).thenAnswer(
        (realInvocation) => Future<List<Activity>>.value(
          List<Activity>.empty(),
        ),
      );
      verifyZeroInteractions(clubWebService);
      final result = clubDetailRepository.getActivites('');
      verify(clubWebService.getClubActivities(any)).called(1);
      verifyNoMoreInteractions(clubWebService);
    });
  });
}
