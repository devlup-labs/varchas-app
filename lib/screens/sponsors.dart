import 'package:flutter/material.dart';
import 'package:varchas_app/widgets.dart';
import 'package:varchas_app/Utils/fetch_data.dart';

class SponsorsPage extends StatefulWidget {
  const SponsorsPage({Key? key}) : super(key: key);

  @override
  State<SponsorsPage> createState() => _SponsorsPageState();
}

class _SponsorsPageState extends State<SponsorsPage> {
  // List<dynamic> sponsorsList = [];
  List<Widget> SponsorsWidgetList = [];
  @override
  void initState() {
    getSponsorsWidget().then((results) {
      setState(() {
        SponsorsWidgetList = List<Widget>.from(results);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size resolution = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: resolution.height * 0.05,
        backgroundColor: Colors.black87, //.fromARGB(255,18,7,17),
      ),
      drawer: NavigationDrawer('l'),
      backgroundColor: const Color.fromRGBO(35, 14, 33, 25),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Header(size: resolution, screenName: "Our Sponsors"),
          SizedBox(
            height: resolution.height * 0.01,
          ),
          Expanded(
            child: Scrollbar(
              thickness: 4,
              thumbVisibility: false,
              child: ListView(
                //padding: const EdgeInsets.all(1.5),
                children: <Widget>[
                  GridView.count(
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    childAspectRatio: 45 / 60,
                    crossAxisCount: 2,
                    children: SponsorsWidgetList, //here
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

Future getSponsorsWidget() async {
  List<dynamic> lst = await getSponsors();
  List wlist = List.generate(lst.length, (index) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  String imgUrl = "http://$base_url${lst[index]['logo']}";
                  return Image.network(
                    imgUrl,
                    height: MediaQuery.of(context).size.width * 0.4,
                    width: MediaQuery.of(context).size.width * 0.4,
                  );
                }),
            Text(
              lst[index]['name'].toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  });

  return wlist;
}
