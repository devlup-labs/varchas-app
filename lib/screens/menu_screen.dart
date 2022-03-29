import 'package:flutter/material.dart';

class MenuItem{
  final String title;
  final IconData icon;
  const MenuItem(this.title,this.icon);
}

class MenuItems{
  static const scheduleScreen = MenuItem("Schedule", Icons.calendar_today);
  static const myCompetition = MenuItem("My Competitions", Icons.schedule);
  static const leaderboard = MenuItem("Leaderboard", Icons.leaderboard_rounded);
  static const logOut = MenuItem("Log out", Icons.logout);

  static const all = <MenuItem>[
    scheduleScreen,
    myCompetition,
    leaderboard,
    logOut,
  ];
}

class MenuScreen extends StatelessWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  const MenuScreen({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.white24,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Spacer(),
              ...MenuItems.all.map(buildMenuItem).toList(),
              const Spacer(flex: 2,)
            ],
          ),
        ),
      ),
    );

  }
  Widget buildMenuItem(MenuItem item) => ListTileTheme(
    selectedColor: Colors.white54,
    child: ListTile(
      selectedTileColor: Colors.black26,
      selected: currentItem == item,
      minLeadingWidth: 20,
      leading: Icon(item.icon),
      title: Text(item.title),
      onTap: ()=> onSelectedItem(item),

    ),
  );

}

