import 'package:educational_center/controller/courses_cotroller/course_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key, required this.endPoint}) : super(key: key);
  final String endPoint;

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await CourseCubit.get(context)
        .getTodayCoursesList(endPoint: widget.endPoint);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CourseCubit, CourseState>(
        builder: (context, state) {
          var coursesList = CourseCubit.get(context).todayListCourses;
          if (state is TodayCoursesListErrorState) {
            return const Center(
              child: Text('No Data'),
            );
          }
          if (state is TodayCoursesListLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
            child: Table(
              children: [
                TableRow(
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.teal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.date_range,
                          ),
                          Text(
                            "  Today Courses",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .8,
                      child: coursesList.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'No Courses Today',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 22),
                              ),
                            )
                          : ListView.builder(
                              itemCount: coursesList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 40,
                                  width: double.infinity,
                                  color: Colors.orange,
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${coursesList[index].firstDay!}, ${coursesList[index].firstDay!}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Container(
                                        color: Colors.black87,
                                        height: 20,
                                        width: 1.9,
                                      ),
                                      Text(
                                        coursesList[index].firstDay!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
