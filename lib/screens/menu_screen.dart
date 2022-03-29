import 'package:flutter/material.dart';

class MenuItem{
  final String title;
  final IconData icon;
  const MenuItem(this.title,this.icon);
}

class MenuItems{
  static const scheduleScreen = MenuItem("Schedule", Icons.payment);
  static const myCompetition = MenuItem("My Competitions", Icons.card_giftcard);
  static const leaderboard = MenuItem("Leaderboard", Icons.notifications);
  static const aboutUS = MenuItem("About US", Icons.info_outline);

  static const all = <MenuItem>[
    scheduleScreen,
    myCompetition,
    leaderboard,
    aboutUS,
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
        backgroundColor: Colors.indigo,
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
    selectedColor: Colors.white,
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

