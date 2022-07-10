import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:varchas_app/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varchas_app/screens/schedule_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool isLoggedIn = true;
  Widget homeWidget = const SplashScreen();

  @override
  void initState() {
    // TODO: implement initState
    loginStatus();
    super.initState();
  }

  loginStatus() async{
    final prefs = await SharedPreferences.getInstance();
    bool? flag = prefs.getBool('isLoggedIn');
    if(flag != true){
      isLoggedIn = false;
    }
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    setState(() {
      if(isLoggedIn == true){
        homeWidget =  const ScheduleScreen();//const MyHomePage();
      }
      else{
        homeWidget = const LoginScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Varchas',
      home: homeWidget,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(1),
      body: Center(
        child: Image.asset(
          "assets/varchas_text_logo.jpeg",
          width: MediaQuery.of(context).size.width * 0.7,
        ),
      ),
    );
  }
}

