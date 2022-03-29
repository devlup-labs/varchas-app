// this file has all the widets that are used in all the screens

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Size size;
  final String tittle;

  const Header({Key? key, required this.size,required  this.tittle}) : super(key: key);

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
              children: const [
                Icon(Icons.menu,color: Colors.white,),
                SizedBox(height: 15,),
                Text('Varchas',style: TextStyle(color: Colors.white,fontSize:30,fontWeight: FontWeight.bold),),
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
              child:  Text( tittle,textAlign: TextAlign.center,style:const TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
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

Widget nextScreenButton(context,path,tittle) =>  FloatingActionButton.extended(
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(20),bottom: Radius.circular(20))
  ),
  onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => path));
  },
  elevation: 10,
  backgroundColor: Colors.white,
    label:  Text(tittle,style:  const TextStyle( color: Colors.black, fontSize: 15,),),

);

class DayButton extends StatelessWidget {
 // final String path;
  final String day;
  final Size size;
  const DayButton({Key? key,required this.day,required this.size,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        height: size.height*0.05,
        width: size.width*0.15,
        //padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.black,
        ),
        child: Center(child: Text(day,style:  const TextStyle( color: Colors.white, fontSize: 15,),)),
      ),
    );
  }
}

class LeaderBoardTeamCard extends StatelessWidget {
  final String rank;
  final String teamName;
  final String score;
  final Size size;
  const LeaderBoardTeamCard({Key? key,required this.rank,required this.teamName,required this.score,required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height*0.08,
        width: size.width*0.90,
        margin: const EdgeInsets.all(5.0),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
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
            Text( rank, style: const TextStyle( color: Colors.white, fontSize: 19,),),
            const SizedBox(
              width: 15,
            ),
            Expanded(child: Center(child: Text( teamName, style: const TextStyle( color: Colors.white, fontSize: 19,),))),
            Text( score, style: const TextStyle( color: Colors.white, fontSize: 19,),),


          ],
        )

    );

  }
}