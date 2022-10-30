// this file has all the widgets that are used in all the screens
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varchas_app/screens/choose_sport.dart';
import 'package:varchas_app/screens/fixture_page.dart';
import 'package:varchas_app/screens/login_screen.dart';
import 'package:varchas_app/screens/my_competetion_screen.dart';
import 'package:varchas_app/screens/schedule_screen.dart';
import 'package:varchas_app/screens/sponsors.dart';
import 'package:varchas_app/screens/transportation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';

class Header extends StatelessWidget {
  final Size size;
  final String screenName;
  final bool showMenuOption;
  const Header(
      {Key? key,
      required this.size,
      required this.screenName,
      this.showMenuOption = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.15,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 3,
              left: 3,
              right: 3,
            ),
            height: size.height * 0.13,
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.black87, //fromARGB(255,18,7,17),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.035,
                ),
                Expanded(
                  child: Image.asset(
                    "assets/varchas_textLogo_nobg.png",
                  ),
                  flex: 2,
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children:   [
                //     Image.asset("assets/varchas_textLogo_nobg.png", height: size.height * 0.09,),
                //     // showMenuOption? IconButton(
                //     //   onPressed: ()=> const NavigationDrawer(),// ZoomDrawer.of(context)!.toggle(),
                //     //   icon: const Icon(Icons.menu,color: Colors.white,),
                //     // ): IconButton(
                //     //     onPressed: ()=>Navigator.pop(context),
                //     //     icon: const Icon(Icons.arrow_back,color: Colors.white,)
                //     // ),
                //     // const Text('Varchas',style: TextStyle(color: Colors.white,fontSize:30,fontWeight: FontWeight.bold),),
                //     // Row(
                //     //   mainAxisAlignment: MainAxisAlignment.start,
                //     //   children: [
                //     //     const SizedBox(width: 10,),
                //     //     Image.asset("assets/varchas_textLogo_nobg.png", height: size.height * 0.09,),
                //     //   ],
                //     // ),
                //   ],
                // ),

                SizedBox(
                  width: size.width * 0.45,
                ),
                Expanded(
                  child: Image.asset(
                    "assets/varchas_Logo_nobg.png",
                  ),
                  flex: 1,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Image.asset("assets/varchas_Logo_nobg.png", scale: 2.9,),
                //   ],
                // )
              ],
            ),
          ),
          Positioned(
            bottom: size.height * 0.01,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              //padding: const EdgeInsets.symmetric(horizontal: 5),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 7,
                    color: Colors.black,
                  ),
                ],
              ),
              child: Text(
                screenName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TeamCard extends StatelessWidget {
  final String teamOneName;
  final String teamTwoName;
  final String? sportName;
  final String time;
  final Size size;
  final String venue;
  // final double x;
  // final double y;

  const TeamCard({
    Key? key,
    required this.teamTwoName,
    required this.teamOneName,
    required this.size,
    this.sportName,
    required this.time,
    required this.venue,
    // required this.x,
    // required this.y
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // MapsLauncher.launchCoordinates(x, y);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FixturePage(
                      teamOneName: teamOneName,
                      teamTwoName: teamTwoName,
                      sportName: sportName,
                      time: time,
                      venue: venue,
                    )));
      },
      child: Container(
          height: size.height * 0.15,
          width: size.width,
          padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),
          decoration: const BoxDecoration(
            color: Colors.black87, //.fromARGB(255,18,7,17),
            // borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    (sportName ?? ""),
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 50.0,
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12.5,
                    ),
                  ),
                ],
              ),
              SizedBox(
                // width: size.width * 0.25,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    teamOneName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
              SizedBox(
                // alignment: Alignment.center,
                // width: size.width * 0.28,
                // height: size.height * 0.1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    teamTwoName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white70,
              ),
            ],
          )),
    );
  }
}

_redirect(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

class TransportCard extends StatelessWidget {
  final String source;
  final String destination;
  // final String? sportName;
  final String time;
  final Size size;
  const TransportCard(
      {Key? key,
      required this.source,
      required this.destination,
      required this.size,
      // this.sportName,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * 0.15,
        width: size.width,
        padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),
        decoration: const BoxDecoration(
          color: Colors.black87, //.fromARGB(255,18,7,17),
          // borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "BUS",
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  width: 50.0,
                ),
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.5,
                  ),
                ),
              ],
            ),
            SizedBox(
              // width: size.width * 0.25,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  source,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            SizedBox(
              // alignment: Alignment.center,
              // width: size.width * 0.28,
              // height: size.height * 0.1,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  destination,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            const Divider(
              color: Colors.white70,
            ),
          ],
        ));
  }
}

class DayButton extends StatelessWidget {
  // final String path;
  final String day;
  final Size size;
  const DayButton({
    Key? key,
    required this.day,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: size.height * 0.04,
        width: size.width * 0.20,
        //padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.black,
        ),
        child: Center(
            child: Text(
          day,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        )),
      ),
    );
  }
}

class LeaderBoardTeamCard extends StatelessWidget {
  final String rank;
  final String teamName;
  final String score;
  final Size size;
  const LeaderBoardTeamCard(
      {Key? key,
      required this.rank,
      required this.teamName,
      required this.score,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * 0.08,
        width: size.width * 0.90,
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 5,
            ),
            Text(
              rank,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 19,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
                child: Text(
              teamName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            )),
            const SizedBox(
              width: 8,
            ),
            Text(
              score,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 19,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ));
  }
}

class NavigationDrawer extends StatefulWidget {
  String currentPage = "";
  NavigationDrawer(this.currentPage, {Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String loggedInTeamID = "";
  String loggedInTeamName = "";

  bool isLoggedIn = true;

  @override
  void initState() {
    // TODO: implement initState
    loginStatus().then((value) {
      setState(() {
        loggedInTeamID = value[0];
        loggedInTeamName = value[1];
      });
    });
    super.initState();
  }

  Future<List<String>> loginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    // print("Login status : " + prefs.getBool('isLoggedIn').toString());
    if (prefs.getBool('isLoggedIn') != true) {
      isLoggedIn = false;
      return ["Not Logged In", ""];
    } else {
      List<String>? team = prefs.getStringList('teamData');
      return ["TeamID : " + team![0].toString(), team[1]];
    }
  }

  showTeamId(context) {
    if (isLoggedIn) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: Text(
              loggedInTeamID,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: Text(
              loggedInTeamName.toUpperCase(),
              style: const TextStyle(fontSize: 15),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
        ],
      );
    } else {
      return buildHeader(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(231, 217, 234, 1),
      elevation: 10,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            showTeamId(context),
            buildMenuItems(context, widget.currentPage, isLoggedIn),
          ],
        ),
      ),
    );
  }
}

Widget buildHeader(BuildContext context) => Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
    );

Widget buildMenuItems(
        BuildContext context, String currentPage, bool isLoggedIn) =>
    Container(
      padding: const EdgeInsets.all(15),
      child: Wrap(runSpacing: 10, children: [
        ListTile(
          leading: const Icon(Icons.calendar_today, color: Colors.black),
          title: const Text(
            'Schedule',
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ScheduleScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.leaderboard_sharp, color: Colors.black),
          title: const Text(
            'Leaderboard',
          ),
          onTap: () {
            // Navigator.pop(context);
            // if (currentPage != 'l') {
            //   if (currentPage == 's') {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const ChooseSportScreen(),
            //       ),
            //     );
            //   } else {
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const ChooseSportScreen(),
            //       ),
            //     );
            //   }
            // }
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ChooseSportScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.handshake_outlined, color: Colors.black),
          title: const Text(
            'Sponsors',
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SponsorsPage(),
              ),
            );
          },
        ),
        isLoggedIn
            ? ListTile(
                leading: const Icon(Icons.schedule, color: Colors.black),
                title: const Text(
                  'My Competitions',
                ),
                onTap: () {
                  Navigator.pop(context);
                  if (currentPage != 'mc') {
                    if (currentPage == 's') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyCompetitionScreen(),
                        ),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyCompetitionScreen(),
                        ),
                      );
                    }
                  }
                },
              )
            : const Divider(),
        isLoggedIn
            ? ListTile(
                leading: const Icon(Icons.logout, color: Colors.black),
                title: const Text('Log Out'),
                onTap: () {
                  //Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text(
                        "Log Out",
                        style: TextStyle(color: Colors.white),
                      ),
                      content: const Text(
                        "Do you want to Logout?",
                        style: TextStyle(color: Colors.white),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "No",
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                  (route) => false);
                            },
                            child: const Text(
                              "Yes",
                            )),
                      ],
                      elevation: 24,
                      backgroundColor: Colors.grey.shade800,
                    ),
                  );
                },
              )
            : ListTile(
                leading: const Icon(Icons.login, color: Colors.black),
                title: const Text('Log In'),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false,
                  );
                },
              ),
      ]),
    );
