import 'package:flutter/material.dart';
import 'package:noter/Auth/creat-e.dart';
import 'package:noter/Auth/login.dart';
import 'package:noter/Noter_Screens/FactoryNote.dart';
import 'package:noter/Noter_Screens/noter_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:ui';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const NoterLuncher());
}

class NoterLuncher extends StatefulWidget {
  const NoterLuncher({super.key});

  @override
  State<NoterLuncher> createState() => _NoterLuncherState();
}

class _NoterLuncherState extends State<NoterLuncher> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        "login": (context) => Login(),
        "SingUp": (context) => SingUp(),
        "Noter1": (context) => MainNoter(),
        "Noter2": (context) => AddNote(),
      },
      theme: ThemeData(
        primaryColorLight: Color(0xffEFBF00),
        fontFamily: "Cairo",
        appBarTheme: AppBarTheme(color: Color(0xffEFBF00)),
      ),
    );
  }
}
