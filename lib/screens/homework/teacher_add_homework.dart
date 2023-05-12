import 'package:educational_center/controller/home_controller/home_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/courses_cotroller/course_cubit.dart';
import '../../widget/input_widget.dart';

class TeacherAddHomework extends StatefulWidget {
  const TeacherAddHomework({Key? key}) : super(key: key);

  @override
  State<TeacherAddHomework> createState() => _TeacherAddHomeworkState();
}

class _TeacherAddHomeworkState extends State<TeacherAddHomework> {
  TextEditingController srcController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await CourseCubit.get(context).getCoursesList(endPoint: 'teacher/courses');
    super.didChangeDependencies();
  }

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Homework",
        ),
      ),
      body: BlocBuilder<HomeControllerCubit, HomeControllerState>(
        builder: (context, state) {
          var cubit = HomeControllerCubit.get(context);
          var coursesLise = CourseCubit.get(context).coursesList;
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  DropdownButtonFormField<String>(
                    items: coursesLise.map((item) {
                      return DropdownMenuItem(
                          value: item.id.toString(),
                          child: Text(
                            item.details.toString(),
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
                    " Source",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  InputWidget(
                    controller: srcController,
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

                  const Text(
                    " Start Date",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InputWidget(
                    controller: startDateController,
                    onPressed: () async {
                      DateTime? pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));
                      if (pickeddate != null) {
                        setState(() {
                          startDateController.text = pickeddate.toString();
                        });
                      }
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    isPasswordType: false,
                    labeltext: '',
                    icon: Icons.date_range,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    " End Date",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InputWidget(
                    controller: endDateController,
                    onPressed: () async {
                      DateTime? pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));
                      if (pickeddate != null) {
                        setState(() {
                          endDateController.text = pickeddate.toString();
                        });
                      }
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    isPasswordType: false,
                    labeltext: '',
                    icon: Icons.date_range,
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      await HomeControllerCubit.get(context).teacherAddHomework(
                        data: {
                          'course_id': cubit.selectedCourse,
                          'src': srcController.text,
                          'start_date': startDateController.text.split(' ')[0],
                          'end_date': endDateController.text.split(' ')[0],
                        },
                      );
                    },
                    child: const Text('Send'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
