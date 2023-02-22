import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:noter/Auth/Social_auth.dart';
import 'package:noter/ClassGUI.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email, password;
  GlobalKey<FormState> formkeylog = new GlobalKey<FormState>();
  Future login_fun() async {
    var formget = formkeylog.currentState;
    if (formget!.validate() == true) {
      formget.save();
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AwesomeDialog(
                  context: context,
                  title: "Wrong Email",
                  body: Text("No user found for that email."))
              .show();
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
                  context: context,
                  title: "wrong-password",
                  body: Text("Wrong password provided for that user."))
              .show();
          print('Wrong password provided for that user.');
        }
      }
    } else {
      AwesomeDialog(
              context: context,
              title: "Login Filed",
              body: Text("Chack Email and Password"))
          .show();
    }
  }

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
            Form(
              key: formkeylog,
              child: Column(
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
                      onSaved: ((value) {
                        email = value;
                      }),
                      validator: ((value) {
                        if (value!.isEmpty == true) {
                          return "Enter Email";
                        } else if (value.length < 5) {
                          return "Wrong Email";
                        }
                      }),
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
                      onSaved: ((value) {
                        password = value;
                      }),
                      validator: ((value) {
                        if (value!.isEmpty == true) {
                          return "No Enter Password";
                        } else if (value.length < 4) {
                          return "Wrong Password";
                        }
                      }),
                    ),
                  ),
                ],
              ),
            ),

            /** Row Button Social Auth  */
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /**Facebook Login */
                  Button3lsaramegy_text(
                      Color(0xff72716D),
                      75,
                      75,
                      Image.asset(
                        "images/facebook.png",
                      ),
                      () {},
                      50),
                  /**Googel Login */
                  Button3lsaramegy_text(Color(0xff72716D), 75, 75,
                      Image.asset("images/google.png"), () async {
                    await signInWithGoogle();
                    Navigator.pushReplacementNamed(context, "Noter1");
                  }, 50),
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
                  }, 50),
                ],
              ),
            ),
            // Container to Auth Buttons
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Login Button
                  Button3lsaramegy_text(
                      Color(0xffEFBF00), 175, 50, Text("Snigin"), () async {
                    await login_fun();
                    Navigator.pushReplacementNamed(context, "Noter1");
                  }, 27),

                  //Sing Up Button
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
