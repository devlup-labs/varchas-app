import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:varchas_app/widgets.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  bool isFabVisible = true;  // for floating button visibility

  @override
  Widget build(BuildContext context) {
    Size data = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Header(size: data, screenName: "Schedule"),
            SizedBox(height: data.height*0.01,),
            Expanded(
              child: NotificationListener<UserScrollNotification>(
                onNotification: (notification){
                  if (notification.direction == ScrollDirection.forward){
                    setState(() => isFabVisible = true);
                  }
                  else if(notification.direction == ScrollDirection.reverse){
                    setState(() => isFabVisible = false);
                  }
                  return true;
                },
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    TeamCard(teamTwoName: "Team Two", teamOneName: "Team One", size: data, sportName: "Football", time: "10:00 AM"),
                    TeamCard(teamTwoName: "Team Two", teamOneName: "Team One", size: data, sportName: "Football", time: "10:00 AM"),
                    TeamCard(teamTwoName: "Team Two", teamOneName: "Team One", size: data, sportName: "Football", time: "10:00 AM"),
                    TeamCard(teamTwoName: "Team Two", teamOneName: "Team One", size: data, sportName: "Football", time: "10:00 AM"),
                    TeamCard(teamTwoName: "Team Two", teamOneName: "Team One", size: data, sportName: "Football", time: "10:00 AM"),
                    TeamCard(teamTwoName: "Team Two", teamOneName: "Team One", size: data, sportName: "Football", time: "10:00 AM"),
                    TeamCard(teamTwoName: "Team Two", teamOneName: "Team One", size: data, sportName: "Football", time: "10:00 AM"),
                    TeamCard(teamTwoName: "Team Two", teamOneName: "Team One", size: data, sportName: "Football", time: "10:00 AM"),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: isFabVisible ? nextScreenButton(context, 'Leaderboard'): null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}
