import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

class MenuScreen extends StatefulWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  const MenuScreen({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String loggedInTeamText = "";
  bool isLoggedIn = true;

  @override
  void initState() {
    // TODO: implement initState
    loginStatus().then((value) {
      setState(() {
        loggedInTeamText = value;
      });
    });
    super.initState();
  }

  Future<String> loginStatus() async{
    final prefs = await SharedPreferences.getInstance();
    print("Login status : " + prefs.getBool('isLoggedIn').toString());
    if(prefs.getBool('isLoggedIn') != true){
      isLoggedIn = false;
      return "Not Logged In";
    }
    else{
      String? tid = prefs.getString('teamId');
      return "TeamID : " + tid.toString();
    }
  }

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  loggedInTeamText,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 20,),
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
      selected: widget.currentItem == item,
      minLeadingWidth: 20,
      leading: Icon(item.icon),
      title: Text(item.title),
      onTap: ()=> widget.onSelectedItem(item),

    ),
  );
}

