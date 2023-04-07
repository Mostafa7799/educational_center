import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:educational_center/screens/profile/teacher/teacher_profile.dart';
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
import '../notification/notification_screen.dart';
import '../profile/student/student_profile.dart';
import 'home_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  List<Widget> screens = const [
    HomeScreen(),
    TeacherProfile(),
    QuizS(),
    AboutUs(),
    ProfileStudent(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Educational Center",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const NotificationScreen();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.mark_unread_chat_alt_sharp,
              color: Colors.orange,
              size: 30,
            ),
          )
        ],
      ),
      // body: screens[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        height: 50,
        backgroundColor: Colors.white,
        color: const Color(0xFF002746),
        items: [
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

      ),
      body:screens[currentIndex],
    );
  }
}
