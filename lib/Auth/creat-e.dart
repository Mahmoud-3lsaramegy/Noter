import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:noter/ClassGUI.dart';
import 'package:firebase_auth/firebase_auth.dart';



class SingUp extends StatefulWidget {
  SingUp({super.key});
  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  GlobalKey<FormState> formkey = new GlobalKey<FormState>() ;
  var userNa, userNy, password1, password2, email;
   Creat_e_fun() {
    var formdata = formkey.currentState;
    if (formdata!.validate()) {
      print("valid");
    }else{
      print("not valid");
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
            key:  formkey,
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
                    validator: ((value) {
                      if (value!.isEmpty == true) {
                        return "Enter True Email"; 
                      }
                      
                      if (value.length <= 3) {
                        return "R-Chack Email is so short";
                      } else {
                        return value;
                      }
                    }),
                    onSaved: (value) {
                      value = email;
                    },
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
                      value = password1 ;
                    },
                    validator: ((value) {
                      if (value!.isEmpty == true) {
                        return "Enter Password";
                      }
                      if (value.length <= 4) {
                        return "Week Password";
                      }
                    }),
                  ),
                ),
                /**PassWord R-Enter filed */
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
                      value = password2 ;
                    },
                    validator: ((value) {
                      if (value!.isEmpty == true) {
                        return "Enter Password";
                      }
                      if (value.length <= 4) {
                        return "Week Password";
                      }else if (password1=!password2) {
                        return "not same password"; 
                      }
                      else {
                        return value;
                      }
                    }),
                    obscureText: true,
                  ),
                ),
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
                    onSaved: (value) {
                      value = userNy; 
                    },
                    validator: ((value) {
                      if (value?.isEmpty == true) {
                        return "Enter Your Name";
                      } else {
                        return value;
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
                    validator: ((value) {
                      if (value?.isEmpty == true) {
                        return "must add user name id";
                      }
                      if (value?.length == 4) {
                        return "short user name";
                      } else {
                        return value;
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
              ],
            ),
          ),
          /**Sing UP  Buttons */
          /*SizedBox(
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
                    Color(0xffEFBF00), 175, 50, Text("Snigin"), () {
                  Creat_e_fun();
                }, 27),
                Button3lsaramegy_text(
                    Color(0xff72716D),
                    175,
                    50,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("I realy have account"),
                        Icon(Icons.arrow_back)
                      ],
                    ), () {
                  Navigator.pushReplacementNamed(context, "login");
                }, 27),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
