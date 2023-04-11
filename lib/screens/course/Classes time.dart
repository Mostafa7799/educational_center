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
  bool? _isChecked = false;

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
      // appBar: AppBar(
      //   toolbarHeight: 50,
      //   backgroundColor: Colors.white,
      //   shadowColor: Colors.white.withOpacity(0.01),
      //   leading: Icon(Icons.message_sharp, color: Colors.black),
      //   title: Text(
      //     "Classes",
      //     style: TextStyle(
      //         fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      //   ),
      //   actions: [],
      // ),
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
                          onChanged: (value) {
                            CourseCubit.get(context).enrollCourse(
                              id: coursesList[index].id!,
                            );
                            setState(() {
                              _isChecked = value;
                              print(value);
                            });
                          },
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
