import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:noter/ClassGUI.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: double.infinity,
              height: 100,
            ),
            /**Tite  Icon Logo */
            IconDis("images/logo0.png", 148, 148),
            SizedBox(
              width: double.infinity,
              height: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.all(18.5),
                  child: TextFormField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    obscureText: false,
                  ),
                ),
                /**PassWord Enter filed */
                Container(
                  margin: EdgeInsets.all(18.5),
                  child: TextFormField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.password_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    obscureText: true,
                  ),
                ),
              ],
            ),

            /** Row Button Auth  */
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /**Googel Login */
                  Button3lsaramegy_text(
                      Color(0xff72716D),
                      75,
                      75,
                      Image.asset(
                        "images/facebook.png",
                      ),
                      () {},
                      50),
                  /**Facebook Login */
                  Button3lsaramegy_text(Color(0xff72716D), 75, 75,
                      Image.asset("images/google.png"), () {}, 50),
                  /** Gust Login */
                  Button3lsaramegy_text(
                      Color(0xff72716D),
                      75,
                      75,
                      Icon(
                        Icons.account_circle_outlined,
                        size: 75 / 2,
                      ), () async {
                    
                    UserCredential us =
                        await FirebaseAuth.instance.signInAnonymously();
                        Navigator.pushReplacementNamed(context, "Noter1");
                    print(us);
                  }, 50),
                ],
              ),
            ),
            /**Sing in and Up Buttons */
            /* SizedBox(
              width: double.infinity,
              height: 100,
            ),*/
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Button3lsaramegy_text(
                      Color(0xffEFBF00), 175, 50, Text("Snigin"), () {}, 27),
                  Button3lsaramegy_text(
                      Color(0xff72716D), 175, 50, Text("Snigup"), () {
                    Navigator.pushNamed(context, "SingUp");
                  }, 27),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
