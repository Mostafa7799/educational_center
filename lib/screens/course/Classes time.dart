import 'package:educational_center/controller/courses_cotroller/course_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'course_card.dart';

class Classes extends StatefulWidget {
  const Classes({Key? key}) : super(key: key);

  @override
  State<Classes> createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  bool? _isChecked = true;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await CourseCubit.get(context).getCoursesList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        return CourseCard(
                          isChecked: _isChecked,
                          // iconCourse: CheckboxListTile(
                          //   value: _isChecked,
                          //   onChanged: (bool? newValue) {
                          //     setState(() {
                          //       _isChecked = newValue;
                          //     });
                          //   },
                          //   activeColor: Colors.white,
                          //   checkColor: Colors.black,
                          // ),
                          iconCourse: _isChecked == true
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isChecked =false;
                                    });
                                    CourseCubit.get(context).enrollCourse(
                                      id: coursesList[index].id!,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.add_task_outlined,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isChecked =true;
                                    });
                                    CourseCubit.get(context).disEnrollCourse(
                                      id: coursesList[index].id!,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.task_alt,
                                    color: Colors.green,
                                  ),
                                ),
                          subjectName: coursesList[index].subject!.name!,
                          day: coursesList[index].day!,
                          time: coursesList[index].time!,
                        );
                      },
                    ),
            );
          },
        ),
      ),
    );
  }
}
