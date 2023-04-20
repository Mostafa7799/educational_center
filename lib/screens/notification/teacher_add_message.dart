import 'package:educational_center/controller/home_controller/home_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/courses_cotroller/course_cubit.dart';
import '../../widget/input_widget.dart';

class TeacherAddMessage extends StatefulWidget {
  const TeacherAddMessage({Key? key}) : super(key: key);

  @override
  State<TeacherAddMessage> createState() => _TeacherAddMessageState();
}

class _TeacherAddMessageState extends State<TeacherAddMessage> {
  TextEditingController newMessageController = TextEditingController();

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await CourseCubit.get(context).getCoursesList(endPoint: 'teacher/courses');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Material",
        ),
      ),
      body: BlocBuilder<HomeControllerCubit, HomeControllerState>(
        builder: (context, state) {
          var cubit = HomeControllerCubit.get(context);
          var coursesLise =  CourseCubit.get(context).coursesList;
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                DropdownButtonFormField<String>(
                  items: coursesLise.map((item) {
                    return DropdownMenuItem(
                        value: item.id.toString(),
                        child: Text(
                          item.id.toString(),
                        ));
                  }).toList(),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    hintText: "Select Course",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(width: 1.5, color: Colors.amber),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      cubit.selectedCourse = value;
                    });
                  },
                  value: cubit.selectedCourse,
                ),
                const SizedBox(
                  height: 10,
                ),

                /// Material name
                const Text(
                  " New Message",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                InputWidget(
                  controller: newMessageController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  isPasswordType: false,
                  labeltext: '',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    await HomeControllerCubit.get(context).teacherAddMessage(data: {
                      'course_id': cubit.selectedCourse,
                      'text': newMessageController.text,
                    });
                  },
                  child: const Text('Send'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
