import 'package:educational_center/controller/profile_controller/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/home_controller/home_controller_cubit.dart';

class Attendance extends StatefulWidget {
  const Attendance({
    Key? key,
    required this.courseId,
  }) : super(key: key);
  final String courseId;

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  int attendance = 0;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await ProfileCubit.get(context).getUsersList(id: widget.courseId);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Attendance",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white10.withOpacity(0.1),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var users = ProfileCubit.get(context).usersList;
          if (state is StudentListErrorState) {
            return const Center(
              child: Text('No Data'),
            );
          }
          if (state is StudentListLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: users.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    showAnimatedDialog(
                      context,
                      addHomework(id:  users[index].id.toString()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 2, color: Colors.yellowAccent),
                          ),
                          width: double.infinity,
                          height: 55,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                 CircleAvatar(
                                  radius: 16,
                                  backgroundImage: NetworkImage(
                                    users[index].studentModel?.image ?? 'https://pic.onlinewebfonts.com/svg/img_405324.png',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    users[index].studentModel!.username??'',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  var formKey = GlobalKey<FormState>();

  Widget addHomework({required String id}) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          height: 150,
          padding: const EdgeInsets.only(top: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () async{
                          await ProfileCubit.get(context).teacherSendAttendance(
                            data: {
                              'course_id': widget.courseId,
                              'status': 'true',
                              'user_id': id,
                            }
                          );
                          setState(() {
                            attendance = 1;
                          });

                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.check_circle_outline),
                        iconSize: 40,
                        color: attendance == 1 ? Colors.green : Colors.black),
                    IconButton(
                      onPressed: () async{
                        await ProfileCubit.get(context).teacherSendAttendance(
                            data: {
                              'course_id': widget.courseId,
                              'status': 'false',
                              'user_id': id,
                            }
                        );
                        setState(() {
                          attendance = 0;
                        });
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.cancel_outlined),
                      iconSize: 40,
                      color: attendance == 0 ? Colors.red : Colors.black,
                    ),
                  ],
                ),

                /// Material name
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await HomeControllerCubit.get(context)
                          .studentAnswerHomework(
                        data: {
                          'homework_id': 1,
                        },
                      );
                    }
                  },
                  child: const Text('Send'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showAnimatedDialog(BuildContext context, Widget dialog,
      {bool isFlip = false, bool dismissible = true}) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (context, animation1, animation2) => dialog,
      transitionDuration: Duration(milliseconds: 500),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: widget,
          ),
        );
      },
    );
  }
}
