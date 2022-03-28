import 'package:flutter/material.dart';
import 'package:varchas_app/widgets.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size data = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white54,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(size: data, screenName: "Schedule"),
            SizedBox(height: data.height*0.01,),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  TeamCard(teamTwoName: "team two", teamOneName: "team one", size: data, sportName: "football", time: "10:00 AM"),
                  TeamCard(teamTwoName: "team two", teamOneName: "team one", size: data, sportName: "football", time: "10:00 AM"),
                  TeamCard(teamTwoName: "team two", teamOneName: "team one", size: data, sportName: "football", time: "10:00 AM"),
                  TeamCard(teamTwoName: "team two", teamOneName: "team one", size: data, sportName: "football", time: "10:00 AM"),
                  TeamCard(teamTwoName: "team two", teamOneName: "team one", size: data, sportName: "football", time: "10:00 AM"),
                  TeamCard(teamTwoName: "team two", teamOneName: "team one", size: data, sportName: "football", time: "10:00 AM"),
                  TeamCard(teamTwoName: "team two", teamOneName: "team one", size: data, sportName: "football", time: "10:00 AM"),
                  TeamCard(teamTwoName: "team two", teamOneName: "team one", size: data, sportName: "football", time: "10:00 AM"),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

