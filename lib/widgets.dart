// this file has all the widgets that are used in all the screens
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:varchas_app/screens/choose_sport.dart';
import 'package:varchas_app/screens/login_screen.dart';
import 'package:varchas_app/screens/my_competetion_screen.dart';
import 'package:varchas_app/screens/schedule_screen.dart';

class Header extends StatelessWidget {
  final Size size;
  final String screenName;
  final bool showMenuOption;
  const Header({Key? key, required this.size, required this.screenName, this.showMenuOption = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.15,
      child: Stack(
        children:[
          Container(
            padding: const EdgeInsets.only(
              top: 3,
              left: 3,
              right: 3,
            ),
            height: size.height * 0.12,
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.black87,//fromARGB(255,18,7,17),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: size.width*0.035,),
                Expanded(child: Image.asset("assets/varchas_textLogo_nobg.png",),flex: 2,),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children:   [
                //     Image.asset("assets/varchas_textLogo_nobg.png", height: size.height * 0.09,),
                //     // showMenuOption? IconButton(
                //     //   onPressed: ()=> const NavigationDrawer(),// ZoomDrawer.of(context)!.toggle(),
                //     //   icon: const Icon(Icons.menu,color: Colors.white,),
                //     // ): IconButton(
                //     //     onPressed: ()=>Navigator.pop(context),
                //     //     icon: const Icon(Icons.arrow_back,color: Colors.white,)
                //     // ),
                //     // const Text('Varchas',style: TextStyle(color: Colors.white,fontSize:30,fontWeight: FontWeight.bold),),
                //     // Row(
                //     //   mainAxisAlignment: MainAxisAlignment.start,
                //     //   children: [
                //     //     const SizedBox(width: 10,),
                //     //     Image.asset("assets/varchas_textLogo_nobg.png", height: size.height * 0.09,),
                //     //   ],
                //     // ),
                //   ],
                // ),
                SizedBox(width: size.width*0.15,),
                Expanded(
                    child: Image.asset("assets/varchas_Logo_nobg.png",
                    ),
                flex: 1,),
                SizedBox(width: size.width*0.02,),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Image.asset("assets/varchas_Logo_nobg.png", scale: 2.9,),
                //   ],
                // )
              ],
            ),
          ),
          Positioned(
            bottom: 14,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              //padding: const EdgeInsets.symmetric(horizontal: 5),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 7,
                    color: Colors.black,
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
        margin: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: Colors.black87,//.fromARGB(255,18,7,17),
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
        height: size.height*0.04,
        width: size.width*0.20,
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
        margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
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


class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor:  Color.fromRGBO(231, 217, 234, 1),
      elevation: 10,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }
}

Widget buildHeader(BuildContext context) => Container(
  padding: EdgeInsets.only(
    top: MediaQuery.of(context).padding.top,
  ),
);

Widget buildMenuItems(BuildContext context) => Container(
  padding: const EdgeInsets.all(15),
  child:   Wrap(
    runSpacing: 10,
     children:[
       ListTile(
         leading: const Icon(Icons.calendar_today,color: Colors.black),
         title: const Text('Schedule',),
         onTap: (){
           Navigator.pop(context);
           Navigator.push(context, MaterialPageRoute(builder: (context) => const ScheduleScreen(),),
           );
         },
       ),
       ListTile(
         leading: const Icon(Icons.leaderboard_sharp,color: Colors.black),
         title: const Text('Leaderboard',),
         onTap: (){
           Navigator.pop(context);
           Navigator.push(context, MaterialPageRoute(builder: (context) => const ChooseSportScreen(),),
           );
         },
       ),
       ListTile(
         leading: const Icon(Icons.schedule,color: Colors.black),
         title: const Text('My Competetion',),
         onTap: (){
           Navigator.pop(context);
           Navigator.push(context, MaterialPageRoute(builder: (context) => const MyCompetitionScreen(),),
           );
         },
       ),
       ListTile(
         leading: const Icon(Icons.logout,color: Colors.black),
         title: const Text('Log Out'),
         onTap: (){
           //Navigator.pop(context);
           showDialog(
             context: context,
             builder:(_)=> AlertDialog(
               title: Text("Log Out",style: TextStyle(color: Colors.white),),
               content: Text("Do you want to Log Out?",style: TextStyle(color: Colors.white),),
               actions: [
                 TextButton(
                     onPressed: (){
                       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen(),), (route) => false);
                       },
                     child: Text("Yes",)
                 ),
                 TextButton(onPressed: (){Navigator.pop(context);}, child: Text("No",)),

               ],
               elevation: 24,
               backgroundColor: const Color.fromRGBO(35, 14, 33, 1.0),
             ),
           );

         },
       ),
     ]
  ),
);