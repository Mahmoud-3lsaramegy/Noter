import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:noter/Auth/Social_auth.dart';
import 'dart:ui';
import 'package:noter/ClassGUI.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingUp extends StatefulWidget {
  SingUp({super.key});
  @override
  State<SingUp> createState() => _SingUpState();
}

/**
 * user 
 *   tast 
 *email
 * kop2090_______kopboy@gmail.com_____12345678
 */
class _SingUpState extends State<SingUp> {
  /*
  Creat email fun
  email created with firebeas Auth
   */
  //Form Key
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  // Faild Var
  var userNa, userNy, password, email;

  Future creat_e_fun() async {
    var formdata = formkey.currentState;

    if (formdata!.validate() == true) {
      formdata.save();
      print("${userNa}" + "_______" + "${email}" + "_____" + "${password}");
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          AwesomeDialog(
                  context: context,
                  title: "password Erro",
                  body: Text("The password provided is too weak."))
              .show();
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          AwesomeDialog(
                  context: context,
                  title: "Email Erro",
                  body: Text("The account already exists for that email."))
              .show();
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("not filed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          /*LOgo Icon */
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 50,
              ),
              IconDis("images/logo0.png", 100, 100),
              SizedBox(
                width: double.infinity,
                height: 50,
              ),
            ],
          ),
          Form(
            key: formkey,
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
                    onSaved: (value) {
                      email = value;
                    },
                    validator: ((value) {
                      if (value!.isEmpty == true) {
                        return "Enter True Email";
                      } else if (value.length < 5) {
                        return "R-Chack Email is so short";
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
                    onSaved: (value) {
                      password = value;
                    },
                    validator: ((value) {
                      if (value!.isEmpty == true) {
                        return "Enter Password";
                      } else if (value.length < 4) {
                        return "Week Password";
                      }
                    }),
                  ),
                ),
                /**PassWord R-Enter filed */

                /**User Public Name  */
                Container(
                  margin: EdgeInsets.all(18.5),
                  child: TextFormField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Name",
                      prefixIcon: Icon(Icons.person_add),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    obscureText: false,
                    onSaved: ((value) {
                      userNy = value;
                    }),
                    validator: ((value) {
                      if (value!.isEmpty == true) {
                        return "Enter Your Name";
                      }
                    }),
                  ),
                ),
                /**User Name App */
                Container(
                  margin: EdgeInsets.all(18.5),
                  child: TextFormField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "UserName",
                      prefixIcon: Icon(Icons.person_add_alt_1_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    obscureText: false,
                    onSaved: (value) {
                      userNa = value;
                    },
                    validator: ((value) {
                      if (value?.isEmpty == true) {
                        return "must add user name id";
                      } else if (value!.length < 4) {
                        return "short user name";
                      }
                    }),
                  ),
                ),
              ],
            ),
          ),
          /** Row Button Auth  */
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                Button3lsaramegy_text(
                    Color(0xff72716D), 75, 75, Image.asset("images/google.png"),
                    () async {
                  await signInWithGoogle();
                  Navigator.pushReplacementNamed(context, "Noter1");
                }, 50),
              ],
            ),
          ),
          /**Sing UP  Buttons */
          /*SizedBox(
            width: double.infinity,
            height: 100,
          ),*/ //27
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await creat_e_fun();
                    Navigator.pushReplacementNamed(context, "login");
                  },
                  child: Text("Singup"),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffEFBF00)),
                    fixedSize: MaterialStateProperty.all(Size(150, 45)),
                  ),
                ),
                Button3lsaramegy_text(
                    Color(0xff72716D),
                    150,
                    45,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "I realy have account",
                          style: TextStyle(fontSize: 12),
                        ),
                        Icon(
                          Icons.arrow_back,
                          size: 10,
                        )
                      ],
                    ), () {
                  Navigator.pushReplacementNamed(context, "login");
                }, 25),
              ],
            ),
          )
        ]),
      ),
    );
  }
}





 /*
  // Fun To Sing data in firebase
  Future Creat_e_fun() async {
    var formdata = formkey.currentState;
    formdata!.save();
    if (formdata.validate()) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password2,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
                  context: context,
                  title: "password Erro",
                  body: Text("The password provided is too weak."))
              .show();
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
                  context: context,
                  title: "Email Erro",
                  body: Text("The account already exists for that email."))
              .show();
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("not valid");
    }
    print("+++++++++++++++++++++++++++++++++++++++");
    if (respons != null) {
      print(respons);
    } else {
      print("find some problm");
    }
    print("+++++++++++++++++++++++++++++++++++++++");
 
  } */

  /*
  Container(
                  margin: EdgeInsets.all(18.5),
                  child: TextFormField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Password Again",
                      prefixIcon: Icon(Icons.password_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    onSaved: (value) {
                      password2 = value;
                    },
                    validator: ((value) {
                      if (value!.isEmpty == true) {
                        return "Enter Password";
                      } else if (value.length < 4) {
                        return "Week Password";
                      } else if (password1 = !password2) {
                        return "not same password";
                      }
                    }),
                    obscureText: true,
                  ),
                ),
   */