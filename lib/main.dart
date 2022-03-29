import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:varchas_app/screens/leaderboard_screen.dart';
import 'package:varchas_app/screens/my_competetion_screen.dart';
import 'package:varchas_app/screens/schedule_screen.dart';
import 'package:varchas_app/screens/menu_screen.dart';
import 'package:varchas_app/screens/about_us_screen.dart';
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Varchas',

      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MenuItem currentItem = MenuItems.scheduleScreen;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      mainScreen: getScreen(),
      menuScreen: MenuScreen(
        currentItem: currentItem,
        onSelectedItem: (item) {
          setState(() => currentItem = item);
          ZoomDrawer.of(context)!.close();
        },
      ),

    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.scheduleScreen:
        return (const ScheduleScreen());
      case MenuItems.leaderboard:
        return (const LeaderBoardScreen());
      case MenuItems.myCompetition:
        return (const MyCompetitionScreen());
      case MenuItems.aboutUS:
        return (const AboutUsScreen());
    }
    return (const ScheduleScreen());

  }


}