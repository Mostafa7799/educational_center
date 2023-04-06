import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:educational_center/screens/subjects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'Matt.dart';

import 'Model.dart';

class homeN extends StatefulWidget {
  const homeN({Key? key}) : super(key: key);

  @override
  State<homeN> createState() => _homeNState();
}

class _homeNState extends State<homeN> {
  @override
  UsersList? usersList;
  List useer = [];

  Future<UsersList?> Getdata() async {
    String url = "http://192.168.1.5/project_backend/getDatacopy.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var red = json.decode(res.body);
      useer.addAll(red);

      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    Getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Colors.white,
        color: Color(0xFF002746),
        items: <Widget>[
          CustomNav(icon: 'assets/images/home.png'),
          CustomNav(icon: 'assets/images/ach.png'),
          CustomNav(icon: 'assets/images/checklist.png'),
          CustomNav(icon: 'assets/images/achievement.png'),
          CustomNav(icon: 'assets/images/user.png'),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, i) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 10, bottom: 2),
                          child: Text(
                            "Home",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 0),
                          child: Text(
                            "Welcome ${useer[1]['username']}",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 110),
                          child: Text(
                            "Pending...waiting for activation",
                            style: TextStyle(
                                color: Color(0xFFD1002B), fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        width: 500,
                        height: 350,
                        child: Image.asset(
                          'assets/images/1.png',
                          bundle: null,
                        )),
                    Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Custom_Button(
                                text: "Teachers",
                                icon: 'assets/images/teacher.png',
                                onpressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Subjects()));
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Custom_Button(
                                text: "Languages",
                                icon: 'assets/images/languages.png',
                                onpressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Subjects()));
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Custom_Button(
                                text: "Programming",
                                icon: 'assets/images/programming.png',
                                onpressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Subjects()));
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Custom_Button(
                                text: "About Us",
                                icon: 'assets/images/info.png',
                                onpressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Subjects()));
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
