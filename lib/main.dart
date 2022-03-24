import 'package:flutter/material.dart';
import 'package:varchas_app/screens/schedule_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Varchas',

      home: ScheduleScreen(),
    );
  }
}

