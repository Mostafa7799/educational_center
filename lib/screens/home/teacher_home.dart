import 'dart:ffi';

import 'package:educational_center/controller/courses_cotroller/course_cubit.dart';
import 'package:educational_center/screens/material/add_material_screen.dart';
import 'package:educational_center/screens/quiz/teacher_add_quiz.dart';
import 'package:educational_center/screens/timetable.dart';
import 'package:flutter/material.dart';

import '../../core/pref.dart';
import '../Matt.dart';
import '../homework/teacher_add_homework.dart';
import '../notification/notification_screen.dart';
import '../notification/teacher_add_message.dart';
import '../profile/teacher/profille_for_teacher.dart';
import '../profile/teacher/teacher_profile.dart';
import '../quiz/quiz_teacher_list.dart';
import '../teacher_atendance/teacher_courses.dart';

class TeacherHomeScreen extends StatefulWidget {
  const TeacherHomeScreen({Key? key}) : super(key: key);

  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
  String? userName;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await CourseCubit.get(context).getCoursesList(endPoint: 'teacher/courses');
    userName = await SharedPreferencesHelper.getAccessName();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Welcome, $userName",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 250,
                width: double.infinity,
                child: TimeTable(endPoint: 'teacher/todayCoursesListForTeacher'),
              ),
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Custom_Button(
                            text: "Add Quizzes",
                            icon: 'assets/images/quiz.png',
                            onpressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const QuizTeacherList(),
                                ),
                              );
                            }),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Custom_Button(
                            text: "Add Material",
                            icon: 'assets/images/to-do-list.png',
                            onpressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AddMaterialScreen(),
                                ),
                              );
                            }),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Custom_Button(
                            text: "Add Homework",
                            icon: 'assets/images/new-document.png',
                            onpressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TeacherAddHomework(),
                                ),
                              );
                            }),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Custom_Button(
                            text: "Add Message",
                            icon: 'assets/images/new-message.png',
                            onpressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TeacherAddMessage(),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Custom_Button(
                            text: "Teachers",
                            icon: 'assets/images/teacher.png',
                            onpressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileForTeacher(),
                                ),
                              );
                            }),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Custom_Button(
                            text: "Attendance",
                            icon: 'assets/images/info.png',
                            onpressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TeacherCourse(),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
