import 'package:educational_center/controller/courses_cotroller/course_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../course/course_card.dart';
import 'attendance.dart';

class TeacherCourse extends StatefulWidget {
  const TeacherCourse({
    Key? key,
    this.isHomework = false,
  }) : super(key: key);
  final bool? isHomework;

  @override
  State<TeacherCourse> createState() => _TeacherCourseState();
}

class _TeacherCourseState extends State<TeacherCourse> {
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await CourseCubit.get(context).getCoursesList(endPoint: 'teacher/courses');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Your Courses'),
      ),
      body: SafeArea(
        child: BlocBuilder<CourseCubit, CourseState>(
          builder: (context, state) {
            var coursesList = CourseCubit.get(context).coursesList;
            if (state is CoursesListErrorState) {
              return const Center(
                child: Text('No Data'),
              );
            }
            if (state is CoursesListLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: coursesList.isEmpty
                  ? const Center(
                      child: Text('No Data'),
                    )
                  : ListView.builder(
                      itemCount: coursesList.length,
                      itemBuilder: (context, index) {
                        {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Attendance(
                                      courseId: coursesList[index].id.toString(),
                                    );
                                  },
                                ),
                              );
                            },
                            child: CourseCard(
                              iconCourse: SizedBox(),
                              subjectName: coursesList[index].subject!.name!,
                              day: coursesList[index].firstDay!,
                              time: coursesList[index].firstDayTime!,
                              sDay: coursesList[index].secondDay!,
                              sTime: coursesList[index].secondDayTime!,
                            ),
                          );
                        }
                      },
                    ),
            );
          },
        ),
      ),
    );
  }
}
