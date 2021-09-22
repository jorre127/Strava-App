import 'package:flutter_template/viewmodel/club_detail/club_detail_viewmodel.dart';
import 'package:flutter_template/viewmodel/clubs/clubs_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../di/injectable_test.mocks.dart';

void main() {
  late ClubDetailViewModel clubDetailViewModel;
  late ClubsViewModel clubsViewModel;
  late MockClubDetailRepository clubDetailRepository;
  late MockClubDetailViewNavigator clubDetailViewNavigator;

  setUp(
    () {
      clubDetailRepository = MockClubDetailRepository();
      clubsViewModel = ClubsViewModel();
      clubDetailViewNavigator = MockClubDetailViewNavigator();
      clubDetailViewModel = ClubDetailViewModel(clubDetailRepository);
    },
  );

  group(
    'init',
    () {
      test(
        'get club',
        () {
          verifyZeroInteractions(clubDetailRepository);
          clubDetailViewModel.init(clubDetailViewNavigator, clubsViewModel.cyclingClub);
          verify(clubDetailRepository.getClub(clubsViewModel.runningClub)).called(1);
          verify(clubDetailRepository.getActivites(clubsViewModel.runningClub)).called(1);
          verify(clubDetailRepository.getAdmins(clubsViewModel.runningClub)).called(1);
          verify(clubDetailRepository.getMembers(clubsViewModel.runningClub)).called(1);
          verifyNoMoreInteractions(clubDetailRepository);
        },
      );
      test('club failed', () {
        when(clubDetailRepository.getClub(any)).thenThrow(UnimplementedError());
        clubDetailViewModel.init(clubDetailViewNavigator, '');
        verify(clubDetailViewNavigator.showError(any)).called(1);
      });
      test('member failed', () {
        when(clubDetailRepository.getMembers(any)).thenThrow(UnimplementedError());
        clubDetailViewModel.init(clubDetailViewNavigator, '');
        verify(clubDetailViewNavigator.showError(any)).called(1);
      });
      test('admin failed', () {
        when(clubDetailRepository.getAdmins(any)).thenThrow(UnimplementedError());
        clubDetailViewModel.init(clubDetailViewNavigator, '');
        verify(clubDetailViewNavigator.showError(any)).called(1);
      });
      test('activity failed', () {
        when(clubDetailRepository.getActivites(any)).thenThrow(UnimplementedError());
        clubDetailViewModel.init(clubDetailViewNavigator, '');
        verify(clubDetailViewNavigator.showError(any)).called(1);
      });
    },
  );

  group('Set selected menu item', () {
    test('set selected activity', () {
      clubDetailViewModel.onActivitySelected(0);
      expect(clubDetailViewModel.selectedActivityIndex, 0);
    });
    test('set selected member', () {
      clubDetailViewModel.onMemberSelected('name');
      expect(clubDetailViewModel.selectedMember, 'name');
    });
  });
}

class MockClubDetailViewNavigator extends Mock implements ClubDetailViewNavigator {}
