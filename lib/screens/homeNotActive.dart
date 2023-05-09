import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:educational_center/screens/subject/subjects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import '../controller/profile_controller/profile_cubit.dart';
import 'Matt.dart';

import 'Model.dart';
import 'auth/LoginScreen.dart';

class HomeNotActive extends StatefulWidget {
  const HomeNotActive({Key? key}) : super(key: key);

  @override
  State<HomeNotActive> createState() => _HomeNotActiveState();
}

class _HomeNotActiveState extends State<HomeNotActive> {
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
                            "Welcome ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, left: 110),
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
                        height: 300,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          await ProfileCubit.get(context)
                              .logout(endPoint: 'user/logout')
                              .then((value) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const LoginPage();
                                },
                              ),
                            );
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.white;
                            }
                            return Colors.orange;
                          }),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
