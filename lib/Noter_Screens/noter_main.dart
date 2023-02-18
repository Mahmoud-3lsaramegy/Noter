import 'package:flutter/material.dart';
import 'package:noter/ClassGUI.dart';

var data = [
  {
    "note": "Hi Im Note 1 Hi Im Note 1Hi Im Note 1 Hi Im Note 1",
    "image": "images/logo0.png"
  },
  {
    "note": "Hi Im Note 2 Hi Im Note 1Hi Im Note 2 Hi Im Note 2",
    "image": "images/logo0.png"
  },
  {
    "note": "Hi Im Note 3 Hi Im Note 3 Hi Im Note 3 Hi Im Note 1",
    "image": "images/logo0.png"
  }
];

class MainNoter extends StatefulWidget {
  const MainNoter({super.key});

  @override
  State<MainNoter> createState() => _MainNoterState();
}

class _MainNoterState extends State<MainNoter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        /**Drawer */
        drawer: Drawer(
            child: Container(
          margin: EdgeInsets.all(18),
          alignment: Alignment.center,
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black12,
                ),
                width: 100,
                height: 100,
                child: IconDis("images/google.png", 85, 85),
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text("Recycle Notes"),
              leading: Icon(Icons.recycling),
            ),
            ListTile(
              onTap: () {},
              title: Text("Favorite Notes"),
              leading: Icon(Icons.favorite),
            ),
            ListTile(
              onTap: () {},
              title: Text("Private Notes"),
              leading: Icon(Icons.private_connectivity),
            ),
            ListTile(
              onTap: () {},
              title: Text("About"),
              leading: Icon(Icons.question_mark),
            ),
          ]),
        )),

        /**Noter Page controle */
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(children: [
            ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key("$index"),
                    child: Container(
                      width: double.infinity,
                      child: ListTile(
                        onTap: () {},
                        title: Text("Title"),
                        subtitle: Text("${data[index]['note']}"),
                        leading: Image.asset("${data[index]['image']}"),
                      ),
                    ),
                  );
                }),
            Container(
                margin: EdgeInsets.all(18),
                alignment: Alignment.bottomRight,
                child: Button3lsaramegy_text(
                    Color(0xffEFBF00),
                    75,
                    75,
                    Icon(
                      Icons.edit_note,
                      size: (75 / 2),
                    ), () {
                  Navigator.popAndPushNamed(context, "Noter2");
                }, 50)),
          ]),
        ));
  }
}
