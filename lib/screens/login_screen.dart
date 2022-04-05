import 'package:flutter/material.dart';
import 'home_page.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/varchas_textLogo_nobg.png", height: pageSize.height * 0.09,),
              ],
            ),
            SizedBox(width: pageSize.width*0.15,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/varchas_Logo_nobg.png", scale: 2.9,),
              ],
            ),

          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(35, 14, 33, 25),
      body: Container(
        padding: EdgeInsets.all(pageSize.width * 0.025),
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: pageSize.height * 0.1,),
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
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  onChanged: (value){},
                  // cursorColor: kPrimaryColor,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.mail_outlined,
                      color: Colors.white,
                    ),
                    hintText: "Email",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                width: pageSize.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  obscureText: true,
                  onChanged: (value){},
                  // cursorColor: kPrimaryColor,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.lock_rounded,
                      color: Colors.white,
                    ),
                    hintText: "Password",
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
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
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
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
              const SizedBox(height: 10,),
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
