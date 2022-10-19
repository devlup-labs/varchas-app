import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:varchas_app/Utils/constants.dart';
import 'package:varchas_app/Utils/fetch_data.dart';
import 'package:varchas_app/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransportSchedule extends StatefulWidget {
  const TransportSchedule({Key? key}) : super(key: key);

  @override
  State<TransportSchedule> createState() => _TransportScheduleState();
}

class _TransportScheduleState extends State<TransportSchedule> {
  bool isFabVisible = true; // for floating button visibility
  var transportId = [];
  var transportName = [];
  bool fetchedData = false;
  var pageSize;
  int currentDay = 1;
  List<dynamic> transportScheduleList = [];
  List<Widget> transportScheduleWidgets = [
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
    // updateTeamData();
    getTransportDetails(currentDay).then((results) {
      transportScheduleList = results;
      setState(() {
        transportScheduleWidgets = getTransportWidgets(transportScheduleList, pageSize);
      });
    });
    super.initState();
  }

  // updateTeamData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   if (prefs.containsKey('transportId') && prefs.containsKey('transportName')) {
  //     transportId = prefs.getStringList('transportId') as List<dynamic>;
  //     transportName = prefs.getStringList('transportName') as List<dynamic>;
  //     fetchedData = true;
  //   } else {
  //     fetchTeamData().then((td) {
  //       transportId = td.transportId;
  //       transportName = td.transportName;
  //       setState(() {
  //         fetchedData = true;
  //       });
  //       var tid = td.transportId.map((e) => e.toString()).toList();
  //       prefs.setStringList('transportId', tid);

  //       var tnames = td.transportName.map((e) => e.toString()).toList();
  //       prefs.setStringList('transportName', tnames);
  //     });
  //   }
  // }

  transportIdtoName(String teamId) {
    if (fetchedData == true && transportName.isNotEmpty) {
      int index = transportId.indexOf(teamId);
      return transportName[index];
    } else {
      return teamId;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size data = MediaQuery.of(context).size;
    pageSize = data;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 14, 33, 1),
      appBar: AppBar(
        toolbarHeight: data.height * 0.05,
        backgroundColor: Colors.black87, //.fromARGB(255,18,7,17),
      ),
      drawer: NavigationDrawer('s'),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(size: data, screenName: "Schedule"),
            SizedBox(
              height: data.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                dayButton(1, data),
                dayButton(2, data),
                dayButton(3, data),
              ],
            ),
            SizedBox(
              height: data.height * 0.01,
            ),
            Expanded(
              child: NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  if (notification.direction == ScrollDirection.forward) {
                    setState(() => isFabVisible = true);
                  } else if (notification.direction ==
                      ScrollDirection.reverse) {
                    setState(() => isFabVisible = false);
                  }
                  return true;
                },
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: transportScheduleWidgets,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getTransportWidgets(transportScheduleList, pageSize) {
    if (transportScheduleList.length == 0) {
      return [
        Container(
          height: pageSize.height * 0.12,
          width: pageSize.width * 0.90,
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: Colors.black87, //.fromARGB(255,18,7,17),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text(
              "No Buses Scheduled yet",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ];
    }
    return List.generate(transportScheduleList.length, (index) {
      return TransportCard(
        destination : transportIdtoName(transportScheduleList[index]['destination']),
        source : transportIdtoName(transportScheduleList[index]['source']),
        size : pageSize,
        // for : sportsChoices[transportScheduleList[index]['for']],
        time: transportScheduleList[index]['time'],
      );
    });
  }

  Widget dayButton(int day, Size size) {
    String dayName = "Day " + day.toString();

    return GestureDetector(
      onTap: () {
        if (day != currentDay) {
          setState(() {
            currentDay = day;
            transportScheduleWidgets = [
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
          });
          setState(() {
            getTransportDetails(currentDay).then((results) {
              transportScheduleList = results;
              setState(() {
                transportScheduleWidgets = getTransportWidgets(transportScheduleList, pageSize);
              });
            });
          });
        }
      },
      child: Container(
        height: size.height * 0.04,
        width: size.width * 0.20,
        //padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: (day == currentDay) ? Colors.grey.shade700 : Colors.black,
        ),
        child: Center(
            child: Text(
              dayName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            )),
      ),
    );
  }
}
