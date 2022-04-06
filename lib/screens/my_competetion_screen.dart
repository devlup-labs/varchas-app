import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:varchas_app/screens/leaderboard_screen.dart';
import 'package:varchas_app/widgets.dart';

class MyCompetitionScreen extends StatefulWidget {
  const MyCompetitionScreen({Key? key}) : super(key: key);

  @override
  State<MyCompetitionScreen> createState() => _MyCompetitionScreenState();
}

class _MyCompetitionScreenState extends State<MyCompetitionScreen> {
  bool isFabVisible = true;  // for floating button visibility

  @override
  Widget build(BuildContext context) {
    Size data = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 14, 33, 25),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            Header(size: data,screenName: 'Upcoming Competitions'),
            //SizedBox(height: data.height*0.01,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children:  [
            //     DayButton(day: "Team", size: data),
            //     DayButton(day: "Solo", size: data),
            //
            //   ],
            // ),
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
      // floatingActionButton: isFabVisible ? nextScreenButton(context,const LeaderBoardScreen(),"Leaderboard"): null,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}

