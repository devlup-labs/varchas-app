// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:varchas_app/Utils/constants.dart';

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
      backgroundColor: Colors.white54,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Header(size: data, screenName: "Sport"),
            SizedBox(height: data.height*0.01,),
            Scrollbar(
              thickness: 9,
              isAlwaysShown: true,
              child: ListView(
                padding: const EdgeInsets.all(1.5),
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
          ],
        ),
      ),
    );
  }

  Widget displaySportIcon(String sportName){
    return GestureDetector(
      onTap: () {},
      child: Card(
        margin: EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return Image.network("https://varchas22.in/static/images/home/cricket.png",
                    height: MediaQuery.of(context).size.width * 0.33,
                    width: MediaQuery.of(context).size.width * 0.33,
                  );
                }),
            Text(
              sportName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 15,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.005)
          ],
        ),
      ),
    );
  }
}
