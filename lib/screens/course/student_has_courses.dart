import 'package:educational_center/controller/courses_cotroller/course_cubit.dart';
import 'package:educational_center/screens/homework/HomeworkS.dart';
import 'package:educational_center/screens/quiz/quiz_student_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'course_card.dart';

class StudentHasThisCourse extends StatefulWidget {
  const StudentHasThisCourse({
    Key? key,
    this.isHomework = false,
  }) : super(key: key);
  final bool? isHomework;

  @override
  State<StudentHasThisCourse> createState() => _StudentHasThisCourseState();
}

class _StudentHasThisCourseState extends State<StudentHasThisCourse> {
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await CourseCubit.get(context).getCoursesList(endPoint: 'user/courses');
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
                              if(widget.isHomework ==true){
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return HomeworkS(
                                          courseId:
                                          coursesList[index].id.toString(),
                                        );
                                      },
                                    ),
                                );
                              }else{
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return QuizStudentScreen(
                                        courseId:
                                        coursesList[index].id.toString(),
                                      );
                                    },
                                  ),
                                );
                              }
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
