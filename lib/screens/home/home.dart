import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:educational_center/screens/subjects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../HomeworkS.dart';
import '../Matt.dart';

import '../Model.dart';
import '../QuizS.dart';
import '../TeachersSearch.dart';
import '../aboutUs.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Colors.white,
        color: const Color(0xFF002746),
        items: <Widget>[
          CustomNav(
            icon: 'assets/images/home.png',
          ),
          CustomNav(
            icon: 'assets/images/ach.png',
          ),
          CustomNav(
            icon: 'assets/images/checklist.png',
          ),
          CustomNav(
            icon: 'assets/images/achievement.png',
          ),
          CustomNav(
            icon: 'assets/images/user.png',
          ),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: 300,
                  height: 250,
                  child: Image.asset(
                    'assets/images/homepik.png',
                    bundle: null,
                  )),
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Custom_Button(
                            text: "Subjects",
                            icon: 'assets/images/books.png',
                            onpressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Subjects(),
                                ),
                              );
                              return null;
                            })),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Custom_Button(
                          text: "Points",
                          icon: 'assets/images/points.png',
                          onpressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Subjects(),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Custom_Button(
                          text: "Grade",
                          icon: 'assets/images/score.png',
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
                          text: "Homework",
                          icon: 'assets/images/list.png',
                          onpressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeworkS()));
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Custom_Button(
                          text: "TO-DO List",
                          icon: 'assets/images/to-do-list.png',
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
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Custom_Button(
                          text: "Quizzes",
                          icon: 'assets/images/quiz.png',
                          onpressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuizS()));
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Custom_Button(
                          text: "Teachers",
                          icon: 'assets/images/teacher.png',
                          onpressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TeachersSearch()));
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
                                    builder: (context) => AboutUs()));
                          }),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
