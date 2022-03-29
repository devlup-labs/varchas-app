import 'package:flutter/material.dart';
import 'package:varchas_app/screens/login_screen.dart';

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

// <<<<<<< HEAD
      home: LoginScreen(),
// =======
//       home:  MyHomePage(),
// >>>>>>> ce00d782a37dbcb87c0b9cdaeb997c0c97ab184d
    );
  }
}
