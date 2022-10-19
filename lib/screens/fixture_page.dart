import 'package:flutter/material.dart';
import 'package:varchas_app/widgets.dart';
import 'package:maps_launcher/maps_launcher.dart';

class FixturePage extends StatelessWidget {
  final String teamOneName;
  final String teamTwoName;
  final String? sportName;
  final String time;
  FixturePage({
    Key? key,
    required this.teamTwoName,
    required this.teamOneName,
    this.sportName,
    required this.time,
    // required this.x,
    // required this.y
  }) : super(key: key);

  var pageSize;
  @override
  Widget build(BuildContext context) {
    pageSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color.fromRGBO(35, 14, 33, 1),
        appBar: AppBar(
          toolbarHeight: pageSize.height * 0.05,
          backgroundColor: Colors.black87, //.fromARGB(255,18,7,17),
        ),
        drawer: NavigationDrawer('s'),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Header(size: pageSize, screenName: sportName!),
              SizedBox(
                height: pageSize.height * 0.15,
              ),
              Card(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    color: Color.fromARGB(255, 124, 54,
                        244), //Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: SizedBox(
                    width: pageSize.width * 0.8,
                    height: pageSize.height * 0.05,
                    child: Center(
                        child: Text(
                      teamOneName,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: pageSize.height * 0.02,
              ),
              const Text(
                "V/S",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: pageSize.height * 0.02,
              ),
              Card(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    color: Color.fromARGB(255, 124, 54,
                        244), //Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: SizedBox(
                    width: pageSize.width * 0.8,
                    height: pageSize.height * 0.05,
                    child: Center(
                        child: Text(
                      teamTwoName,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: pageSize.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Time: ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: pageSize.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Location: ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: pageSize.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  MapsLauncher.launchCoordinates(
                      26.475500241368298, 73.12012050554168);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/maps_logo.png',
                      width: 50,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: pageSize.height * 0.005,
                    ),
                    const Text(
                      "View on Map",
                      style: TextStyle(color: Colors.amber),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
