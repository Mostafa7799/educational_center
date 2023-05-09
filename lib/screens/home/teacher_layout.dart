import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:educational_center/controller/profile_controller/profile_cubit.dart';
import 'package:educational_center/screens/course/Classes%20time.dart';
import 'package:educational_center/screens/home/teacher_home.dart';
import 'package:educational_center/screens/profile/teacher/teacher_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Matt.dart';
import '../QuizS.dart';
import '../aboutUs.dart';
import '../homeNotActive.dart';
import '../notification/notification_screen.dart';
import '../profile/student/student_profile.dart';
import '../profile/teacher/profille_for_teacher.dart';
import '../timetable.dart';
import 'home_screen.dart';

class TeacherLayoutScreen extends StatefulWidget {
  const TeacherLayoutScreen({Key? key}) : super(key: key);

  @override
  State<TeacherLayoutScreen> createState() => _TeacherLayoutScreenState();
}

class _TeacherLayoutScreenState extends State<TeacherLayoutScreen> {
  List<Widget> screens = const [
    TeacherHomeScreen(),
    TimeTable(endPoint: 'teacher/todayCoursesListForTeacher'),
    ProfileForTeacher(),
  ];
  int currentIndex = 0;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await ProfileCubit.get(context).getTeacherProfile();
    super.didChangeDependencies();
  }

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
            icon: 'assets/images/checklist.png',
          ),
          CustomNav(
            icon: 'assets/images/user.png',
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
