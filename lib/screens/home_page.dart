// file not in use



// import 'package:flutter/material.dart';
// import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
// import 'package:varchas_app/screens/login_screen.dart';
// import 'package:varchas_app/screens/schedule_screen.dart';
// import 'about_us_screen.dart';
// import 'choose_sport.dart';
// import 'menu_screen.dart';
// import 'my_competetion_screen.dart';
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   MenuItem currentItem = MenuItems.scheduleScreen;
//
//   @override
//   Widget build(BuildContext context) {
//     return ZoomDrawer(
//       style: DrawerStyle.Style1,
//       backgroundColor: const Color(0xffffffff),
//       angle: 0.0,
//       mainScreen: getScreen(),
//       menuScreen: MenuScreen(
//         currentItem: currentItem,
//         onSelectedItem: (item) {
//           setState(() {
//             currentItem = item;
//           });
//           // ZoomDrawer.of(context)!.close();
//         },
//       ),
//
//     );
//   }
//
//   Widget getScreen() {
//     switch (currentItem) {
//       case MenuItems.scheduleScreen:
//         return (const ScheduleScreen());
//       case MenuItems.leaderboard:
//         return (const ChooseSportScreen());
//       case MenuItems.myCompetition:
//         return (const MyCompetitionScreen());
//       case MenuItems.logOut:
//         return (const LoginScreen());
//     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),);
//
//     }
//     return (const ScheduleScreen());
//
//   }
//
//
// }
