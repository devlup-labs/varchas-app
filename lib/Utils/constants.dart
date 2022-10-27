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
  '11': 'Kabaddi',
  '12': 'Squash',
  '13': 'Weightlifting',
};
final locations = {
    'IITJ Football Ground':[26.475500241368298, 73.12012050554168],
    'Volleyball Ground':[26.47731349752093, 73.12134341175553],
    'Tennis Ground':[26.477008885433506, 73.12117409853494],
    'Indoor sports Complex':[26.47681999463718, 73.11939962588451],
    'Lecture Hall Complex':[],
    'Spartan Cricket Ground':[],
    'Pathan Cricket Academy':[],
    'VIRU Cricket Academy':[],
};
final dates = ["2022-10-29", "2022-10-30", "2022-10-31"];
final sportsList = [
  'Athletics',
  'Badminton',
  'Basketball',
  'Chess',
  'Cricket',
  'Football',
  'Kabaddi',
  'Weightlifting',
  'Table Tennis',
  'Tennis',
  'Volleyball',
  'Badminton-Mixed doubles',
  'Squash',
];
final sportUrlExceptions = {
  'Basketball': 'basketball-player',
  // 'Volleyball': 'vb',
  'Cricket': 'cricket-inverted',
  'Kabaddi': 'kabaddi-inverted',
  'Weightlifting': 'weightlifting-inverted',
  'Table Tennis': 'table-tennis',
  'Badminton-Mixed doubles': 'badminton'
};
final unLoggedInScreens = {
  'Schedule': const ScheduleScreen(),
  'Leaderboard': const ChooseSportScreen()
};
final loggedInScreens = {
  'Schedule': ScheduleScreen,
  'My Schedule': ScheduleScreen,
  'Leaderboard': ChooseSportScreen
};
