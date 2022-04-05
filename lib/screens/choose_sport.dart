// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:varchas_app/Utils/constants.dart';
import 'package:varchas_app/screens/leaderboard_screen.dart';

import '../widgets.dart';

class ChooseSportScreen extends StatefulWidget {
  const ChooseSportScreen({Key? key}) : super(key: key);

  @override
  _ChooseSportScreenState createState() => _ChooseSportScreenState();
}

class _ChooseSportScreenState extends State<ChooseSportScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    Size data = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 14, 33, 25),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Header(size: data, screenName: "Choose Sport"),
            SizedBox(height: data.height*0.01,),
            Expanded(
              child: Scrollbar(
                thickness: 4,
                isAlwaysShown: false,
                child: ListView(
                  //padding: const EdgeInsets.all(1.5),
                  children: <Widget>[
                    GridView.count(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      childAspectRatio: 45 / 60,
                      crossAxisCount: 2,
                      children:
                      List.generate(sportsList.length, (index) {
                        return displaySportIcon(sportsList[index]);
                      }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget displaySportIcon(String sportName){
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LeaderBoardScreen(),
            ),
        );
      },
      child: Card(
        color: Colors.black,
        margin: EdgeInsets.all(6),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              StreamBuilder<Object>(
                  stream: null,
                  builder: (context, snapshot) {
                    String imgUrl = "https://varchas22.in/static/images/home/${sportName.toLowerCase()}.png";
                    if(sportUrlExceptions.keys.contains(sportName)){
                      imgUrl = "https://varchas22.in/static/images/home/${sportUrlExceptions[sportName].toString()}.png";
                    }
                    return Image.network(
                      imgUrl,
                      height: MediaQuery.of(context).size.width * 0.4,
                      width: MediaQuery.of(context).size.width * 0.4,
                    );
                  }),
              Text(
                sportName.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
