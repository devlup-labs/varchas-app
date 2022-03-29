// this file has all the widets that are used in all the screens

import 'package:flutter/material.dart';
import 'package:varchas_app/screens/choose_sport.dart';
import 'package:varchas_app/screens/schedule_screen.dart';

class Header extends StatelessWidget {
  final Size size;
  final String screenName;
  const Header({Key? key, required this.size, required this.screenName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.24,
      child: Stack(
        children:[
          Container(
            padding: const EdgeInsets.only(
              top: 15,
              left: 15,
              right: 10,
            ),
            height: size.height * 0.2,
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              //// OLD
              // children: const [
              //   Icon(
              //     Icons.menu,
              //     color: Colors.white,
              //   ),
              //   SizedBox(height: 15,),
              //   Text('Varchas',style: TextStyle(color: Colors.white,fontSize:30,fontWeight: FontWeight.bold),),
              children: [
                const Icon(Icons.menu,color: Colors.white,),
                const SizedBox(height: 15,),
                // Text('Varchas',style: TextStyle(color: Colors.white,fontSize:30,fontWeight: FontWeight.bold),),
                Image.asset("assets/varchas_text_logo.jpeg", height: size.height * 0.08,),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 50),
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.black45,
                  ),
                ],
              ),
              child: Text(screenName,textAlign: TextAlign.center,style:const TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
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
  final String sportName;
  final String time;
  final Size size;
  const TeamCard({Key? key,required this.teamTwoName,required this.teamOneName,required this.size,required this.sportName,required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height*0.12,
        width: size.width*0.90,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text( teamOneName, style: const TextStyle( color: Colors.white, fontSize: 19,),),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text( sportName, style: const TextStyle( color: Colors.red, fontSize: 15,),),
                Text( time, style: const TextStyle( color: Colors.white, fontSize: 10,),),
              ],
            ),
            Text( teamOneName, style: const TextStyle( color: Colors.white, fontSize: 19,),),

          ],
        )

      );

  }
}

Widget nextScreenButton(context, String nextScreenName) {
  return FloatingActionButton.extended(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(20), bottom: Radius.circular(20))
    ),
    onPressed: (){
        StatefulWidget screenWidget;
        if(nextScreenName == 'Leaderboard'){
          screenWidget = const ChooseSportScreen();
        }
        else{
          screenWidget = const ScheduleScreen();
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screenWidget),
        );
    },
    elevation: 10,
    backgroundColor: Colors.white,
    label: Text(
      nextScreenName.toString(),
      style: const TextStyle(color: Colors.black, fontSize: 15,),
    ),

  );
}