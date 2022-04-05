import 'package:flutter/material.dart';
import 'package:varchas_app/widgets.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({Key? key}) : super(key: key);

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
 // bool isFabVisible = true;  // for floating button visibility

  @override
  Widget build(BuildContext context) {
    Size data = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 14, 33, 25),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            Header(size: data,screenName: "Leaderboard", showMenuOption: false,),
            SizedBox(height: data.height*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                Container(
                  height: data.height*0.05,
                  width: data.width*0.14,
                  margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black,
                  ),
                  child:  const Center(child: Text('Rank',style:  TextStyle( color: Colors.white, fontSize: 15,),)),
                ),
                Expanded(
                  child: Container(
                    height: data.height*0.05,
                    width: data.width*0.15,
                    //padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black,
                    ),
                    child: const Center(child: Text("Team Name",style:  TextStyle( color: Colors.white, fontSize: 15,),)),
                  ),
                ),
                Container(
                  height: data.height*0.05,
                  width: data.width*0.15,
                  margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black,
                  ),
                  child: const Center(child: Text("Score",style:  TextStyle( color: Colors.white, fontSize: 15,),)),
                ),

              ],
            ),
            Expanded(

                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    LeaderBoardTeamCard(rank: '01', teamName: 'Team Name', score: "1000", size: data),
                    LeaderBoardTeamCard(rank: '01', teamName: 'Team Name', score: "1000", size: data),
                    LeaderBoardTeamCard(rank: '01', teamName: 'Team Name', score: "1000", size: data),
                    LeaderBoardTeamCard(rank: '01', teamName: 'Team Name', score: "1000", size: data),
                    LeaderBoardTeamCard(rank: '01', teamName: 'Team Name', score: "1000", size: data),
                    LeaderBoardTeamCard(rank: '01', teamName: 'Team Name', score: "1000", size: data),
                    LeaderBoardTeamCard(rank: '01', teamName: 'Team Name', score: "1000", size: data),
                    LeaderBoardTeamCard(rank: '01', teamName: 'Team Name', score: "1000", size: data),

                  ],
                ),
              ),

          ],
        ),
      ),
      // floatingActionButton: isFabVisible ? nextScreenButton(context,const ScheduleScreen(),"Schedule"): null,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}

