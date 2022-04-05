import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varchas_app/Utils/fetch_data.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TeamData? teamData;
  String wrongTeamIdPrompt = "";
  final TextEditingController teamIdController = TextEditingController();
  bool fetchedData = false;
  Widget bottomWidget = const SizedBox(height: 1,);


  @override
  void initState() {
    // TODO: implement initState
    fetchTeamData().then((td) {
      teamData = td;
      fetchedData = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size pageSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.20,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        title: Image.asset("assets/varchas_text_logo.jpeg", height: pageSize.height * 0.08,),
      ),
      backgroundColor: Colors.grey.withOpacity(1),

      body: Container(
        padding: EdgeInsets.all(pageSize.width * 0.025),
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: pageSize.height * 0.15,),
              const Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                child: const Divider(color: Colors.white70, ),
                width: pageSize.width * 0.3,
              ),
              const SizedBox(height: 10,),
              // SizedBox(height: pageSize.height * 0.03),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                width: pageSize.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextField(
                  controller: teamIdController,
                  autocorrect: false,
                  // cursorColor: kPrimaryColor,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.key,
                      color: Colors.white,
                    ),
                    hintText: "Team ID",
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: () async {
                  String enteredTeamid = teamIdController.text;
                  if(teamData!.verifyTeamID(enteredTeamid)){
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('isLoggedIn', true);
                    prefs.setString('teamId', enteredTeamid);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage()),
                    );
                  }
                  else{
                    Fluttertoast.showToast(
                      msg: "Please enter valid Team ID. Eg. VA-ABC-XYZ69",
                      backgroundColor: Colors.redAccent,
                      toastLength: Toast.LENGTH_LONG,
                      timeInSecForIosWeb: 1,
                    );
                  }
                },
                child: Container(
                  width: pageSize.width * 0.6,
                  height: 50,
                  decoration: BoxDecoration(
                    // color: Colors.brown,
                    color: Colors.red.shade900,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.login_sharp, color: Colors.white,),
                      SizedBox(width: 20,),
                      Text("Login", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
              wrongTeamIdPrompt==""? const SizedBox(height: 1,)
              :Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  wrongTeamIdPrompt,
                  style: const TextStyle(color: Colors.redAccent),
                ),
              ),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('isLoggedIn', false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                },
                child: Container(
                  width: pageSize.width * 0.6,
                  height: 50,
                  decoration: BoxDecoration(
                    // color: Colors.brown,
                    color: Colors.blueAccent.shade700,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.login_sharp, color: Colors.white),
                      SizedBox(width: 20,),
                      Text("Continue without login", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
              bottomWidget,
            ],
          ),
        ),
      ),
    );
  }
}

//
// class RoundedInputField extends StatelessWidget {
//   final String hintText;
//   final IconData icon;
//   final ValueChanged<String> onChanged;
//   const RoundedInputField({
//     Key? key,
//     required this.hintText,
//     this.icon = Icons.person,
//     required this.onChanged,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       width: pageSize.width * 0.8,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(29),
//       ),
//       child: TextField(
//         onChanged: onChanged,
//         // cursorColor: kPrimaryColor,
//         decoration: InputDecoration(
//           icon: Icon(
//             icon,
//             // color: kPrimaryColor,
//           ),
//           hintText: hintText,
//           border: InputBorder.none,
//         ),
//       ),
//     );
//   }
// }
