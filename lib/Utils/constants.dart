import 'package:varchas_app/screens/choose_sport.dart';
import 'package:varchas_app/screens/schedule_screen.dart';

final sportsChoices = {
  '1': 'Athletics',
  '2': 'Badminton',
  '3': 'Basketball',
  '4': 'Chess',
  '5': 'Cricket',
  '6': 'Football',
  '7': 'Table Tenis',
  '8': 'Tenis',
  '9': 'Volleyball',
  '10': 'Badminton-Mixed doubles',
};

final sportsList = ['Athletics', 'Badminton', 'Basketball', 'Chess', 'Cricket','Football','Table Tennis','Tennis','Volleyball', 'Badminton-Mixed doubles',];
final sportUrlExceptions = {'Basketball': 'bb', 'Volleyball' : 'vb', 'Table Tennis': 'tt', 'Badminton-Mixed doubles': 'badminton'};
final unLoggedInScreens = {'Schedule': const ScheduleScreen(), 'Leaderboard': const ChooseSportScreen()};
final loggedInScreens = {'Schedule': ScheduleScreen, 'My Schedule': ScheduleScreen, 'Leaderboard': ChooseSportScreen};
