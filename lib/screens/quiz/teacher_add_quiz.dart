import 'package:educational_center/controller/courses_cotroller/course_cubit.dart';
import 'package:educational_center/controller/quiz_controller/quiz_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../widget/input_widget.dart';

class TeacherAddQuiz extends StatefulWidget {
  const TeacherAddQuiz({Key? key}) : super(key: key);


  @override
  State<TeacherAddQuiz> createState() => _TeacherAddQuizState();
}

class _TeacherAddQuizState extends State<TeacherAddQuiz> {
  dynamic selectedTime = '';
  dynamic pickedDate = '';
  dynamic selectedEndTime = '';
  dynamic pickedEndDate = '';

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await CourseCubit.get(context).getCoursesList(endPoint: 'teacher/courses');
    super.didChangeDependencies();
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController gradeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var cubit = QuizCubit.get(context);
    TextEditingController timeController =
    TextEditingController(text: selectedTime.toString());
    TextEditingController dateController =
    TextEditingController(text: pickedDate.toString());

    TextEditingController timeEndController =
    TextEditingController(text: selectedEndTime.toString());
    TextEditingController dateEndController =
    TextEditingController(text: pickedEndDate.toString());

    String _formatTime(TimeOfDay time) {
      // Use intl package to format time
      final timeFormat = DateFormat('HH:mm');
      String formattedTime =
      timeFormat.format(DateTime(2022, 1, 1, time.hour, time.minute));
      return formattedTime;
    }


    var coursesLise =  CourseCubit.get(context).coursesList;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Quiz",
        ),
      ),
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 80,
                  child: DropdownButtonFormField<String>(
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
                      hintText: "Enter Course",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.yellowAccent),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(width: 1.5, color: Colors.yellowAccent),
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
                ),
                const Text(
                  " Quiz Name",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                InputWidget(
                  controller: nameController,
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
                  " Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                InputWidget(
                  controller: detailsController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field is required';
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
                  " Total Grade",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                ),
                InputWidget(
                  controller: gradeController,
                  keyBoardType:  TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field is required';
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
                Row(
                  children: [
                    Flexible(
                      child: InputWidget(
                        controller: dateController,
                        onPressed: () async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));
                          if (pickeddate != null) {
                            setState(() {
                              pickedDate = pickeddate.toString();
                            });
                            print(dateController);
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
                    ),
                    Flexible(
                      child: InputWidget(
                        controller: timeController,
                        onPressed: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          String formatTime = _formatTime(pickedTime!);
                          if (formatTime != null) {
                            setState(() {
                              selectedTime = formatTime;
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
                        icon: Icons.access_time,
                      ),
                    ),
                  ],
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
                Row(
                  children: [
                    Flexible(
                      child: InputWidget(
                        controller: dateEndController,
                        onPressed: () async {

                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));
                          if (pickeddate != null) {
                            setState(() {
                              pickedEndDate = pickeddate.toString();
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
                    ),
                    Flexible(
                      child: InputWidget(
                        controller: timeEndController,
                        onPressed: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          String formatTime = _formatTime(pickedTime!);
                          if (formatTime != null) {
                            setState(() {
                              selectedEndTime = formatTime;
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
                        icon: Icons.access_time,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    await QuizCubit.get(context).teacherAddQuiz(
                        data: {
                          'course_id': cubit.selectedCourse,
                          'date': dateController.text,
                          'start_time': '${timeController.text}:00',
                          'total_grade': gradeController.text,
                          'end_time': '${timeEndController.text}:00',
                          'details': detailsController.text,
                        }
                    );
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
