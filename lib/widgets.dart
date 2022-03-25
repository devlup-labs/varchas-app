// this file has all the widets that are used in all the screens

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Size size;
  const Header({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
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
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 50),
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
              child: Text("Schedule",textAlign: TextAlign.center,style:TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
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
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text( teamOneName, style: TextStyle( color: Colors.white, fontSize: 19,),),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text( sportName, style: TextStyle( color: Colors.red, fontSize: 9,),),
                Text( time, style: TextStyle( color: Colors.white, fontSize: 9,),),
              ],
            ),
            Text( teamOneName, style: TextStyle( color: Colors.white, fontSize: 19,),),

          ],
        )

      );

  }
}