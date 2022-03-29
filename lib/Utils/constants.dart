import 'package:varchas_app/screens/choose_sport.dart';
import 'package:varchas_app/screens/schedule_screen.dart';

final sportsList = ['Cricket', 'Football', 'Athletics', 'Basketball', 'Chess', 'Badminton', 'Volleyball', 'Table Tennis', 'Squash', 'Informals'];
final sportUrlExceptions = {'Basketball': 'bb', 'Volleyball' : 'vb', 'Table Tennis': 'tt'};
final unLoggedInScreens = {'Schedule': const ScheduleScreen(), 'Leaderboard': const ChooseSportScreen()};
final loggedInScreens = {'Schedule': ScheduleScreen, 'My Schedule': ScheduleScreen, 'Leaderboard': ChooseSportScreen};
