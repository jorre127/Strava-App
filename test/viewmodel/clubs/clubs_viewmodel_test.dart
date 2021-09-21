import 'package:flutter_template/viewmodel/clubs/clubs_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  late ClubsViewModel clubsViewModel;
  late ClubsViewNavigator clubsViewNavigator;

  setUp(
    () async {
      clubsViewNavigator = MockClubsViewNavigator();
      clubsViewModel = ClubsViewModel();
    },
  );

  group('init', () {
    test('should setup navigator', () async {
      await clubsViewModel.init(clubsViewNavigator);
      verifyZeroInteractions(clubsViewNavigator);
    });
  });
  group('navigation', () {
    setUp(() {
      clubsViewModel.init(clubsViewNavigator);
    });
    test('navigation running club', () {
      verifyZeroInteractions(clubsViewNavigator);
      clubsViewModel.onRunningCardClicked(clubsViewModel.runningClub);
      verify(clubsViewNavigator.goToClubDetail(clubsViewModel.runningClub)).called(1);
      verifyNoMoreInteractions(clubsViewNavigator);
    });
    test('navigation cycling club', () {
      verifyZeroInteractions(clubsViewNavigator);
      clubsViewModel.onCyclingCardClicked(clubsViewModel.cyclingClub);
      verify(clubsViewNavigator.goToClubDetail(clubsViewModel.cyclingClub)).called(1);
      verifyNoMoreInteractions(clubsViewNavigator);
    });
  });
}

class MockClubsViewNavigator extends Mock implements ClubsViewNavigator {}
