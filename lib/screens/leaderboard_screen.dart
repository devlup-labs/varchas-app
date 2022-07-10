import 'package:flutter/material.dart';
import 'package:varchas_app/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/fetch_data.dart';

class LeaderBoardScreen extends StatefulWidget {
  String sportNumber;
  LeaderBoardScreen(this.sportNumber, {Key? key}) : super(key: key);

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  // bool isFabVisible = true;  // for floating button visibility

  TeamData? teamData;
  bool fetchedData = false;
  var pageSize;
  List<dynamic> rankList = [];
  List<Widget> leaderBoardWidgets = [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 200,
        ),
        CircularProgressIndicator(
          backgroundColor: Colors.grey,
          color: Colors.pink.shade700,
        ),
      ],
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    fetchTeamData().then((td) {
      teamData = td;
      rankList = td.getSportResults(widget.sportNumber);
      setState(() {
        fetchedData = true;
        leaderBoardWidgets = rankListWidgets(rankList, pageSize);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size data = MediaQuery.of(context).size;
    pageSize = data;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: data.height * 0.05,
        backgroundColor: Colors.black87, //.fromARGB(255,18,7,17),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      backgroundColor: const Color.fromRGBO(35, 14, 33, 25),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(
              size: data,
              screenName: "Leaderboard",
              showMenuOption: false,
            ),
            SizedBox(
              height: data.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: data.height * 0.05,
                  width: data.width * 0.14,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black,
                  ),
                  child: const Center(
                      child: Text(
                    'Rank',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )),
                ),
                Expanded(
                  child: Container(
                    height: data.height * 0.05,
                    width: data.width * 0.15,
                    //padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black,
                    ),
                    child: const Center(
                        child: Text(
                      "Team Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    )),
                  ),
                ),
                Container(
                  height: data.height * 0.05,
                  width: data.width * 0.15,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black,
                  ),
                  child: const Center(
                      child: Text(
                    "Score",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: leaderBoardWidgets,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> rankListWidgets(rankList, pageSize) {
    return List.generate(rankList.length, (index) {
      return LeaderBoardTeamCard(
          rank: (index + 1).toString(),
          teamName: rankList[index]['college'],
          score: rankList[index]['score'].toString(),
          size: pageSize);
    });
  }
}
