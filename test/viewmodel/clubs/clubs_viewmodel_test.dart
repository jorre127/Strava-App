import 'package:flutter_template/viewmodel/clubs/clubs_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  late ClubsViewModel sut;
  late ClubsViewNavigator clubsViewNavigator;

  setUp(
    () async {
      clubsViewNavigator = MockClubsViewNavigator();
      sut = ClubsViewModel();
    },
  );

  group('init', () {
    test('should setup navigator', () async {
      await sut.init(clubsViewNavigator);
      verifyZeroInteractions(clubsViewNavigator);
    });
  });
  group('navigation', () {
    setUp(() {
      sut.init(clubsViewNavigator);
    });
    test('navigation running club', () {
      verifyZeroInteractions(clubsViewNavigator);
      sut.onRunningCardClicked();
      verify(clubsViewNavigator.goToClubDetail(sut.runningClub)).called(1);
      verifyNoMoreInteractions(clubsViewNavigator);
    });
    test('navigation cycling club', () {
      verifyZeroInteractions(clubsViewNavigator);
      sut.onCyclingCardClicked();
      verify(clubsViewNavigator.goToClubDetail(sut.cyclingClub)).called(1);
      verifyNoMoreInteractions(clubsViewNavigator);
    });

  });

  group('properties', (){
    test('should be validated', (){
      expect(sut.runningClub, '198480');

    });
  });
}

class MockClubsViewNavigator extends Mock implements ClubsViewNavigator {}
