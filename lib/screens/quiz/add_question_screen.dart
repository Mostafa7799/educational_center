import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/quiz_controller/quiz_cubit.dart';
import '../../widget/input_widget.dart';

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({Key? key, required this.quizId}) : super(key: key);
  final int quizId;

  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  TextEditingController questionNameController = TextEditingController();
  TextEditingController answerAController = TextEditingController();
  TextEditingController answerBController = TextEditingController();
  TextEditingController answerCController = TextEditingController();
  TextEditingController answerDController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    List<String> correctChoice = [
      "choice_a",
      "choice_b",
      "choice_c",
      "choice_d",
    ];
    var formKey = GlobalKey<FormState>();
    String? selectedCorrectChoice = correctChoice[0];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Question",
        ),
      ),
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const Text(
                    " Question Name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  InputWidget(
                    controller: questionNameController,
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

                  /// Choice A
                  const Text(
                    " Choice A",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  InputWidget(
                    controller: answerAController,
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

                  /// Choice B
                  const Text(
                    " Choice B",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  InputWidget(
                    controller: answerBController,
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

                  /// Choice C
                  const Text(
                    " Choice C",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  InputWidget(
                    controller: answerCController,
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

                  /// Choice D
                  const Text(
                    " Choice D",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  InputWidget(
                    controller: answerDController,
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

                  /// Grade
                  const Text(
                    " Grade",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  InputWidget(
                    controller: gradeController,
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
                  /// Correct Choice
                  const Text(
                    " Correct Choice",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    value: selectedCorrectChoice,
                    items: correctChoice.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                        ),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      hintText: "Select correct choice",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.amber),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.5,
                          color: Colors.amber,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedCorrectChoice = value;
                        print(selectedCorrectChoice);
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    color: Colors.black,
                    textColor: Colors.white,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        await QuizCubit.get(context).teacherAddAnswerToQuiz(
                          data: {
                            'quiz_id': widget.quizId,
                            'question': questionNameController.text,
                            'choice_a': answerAController.text,
                            'choice_b': answerBController.text,
                            'choice_c': answerCController.text,
                            'choice_d': answerDController.text,
                            'grade': gradeController.text,
                            'correct_answer': selectedCorrectChoice,
                          },
                        ).then((value) {
                          questionNameController.clear();
                          answerAController.clear();
                          answerBController.clear();
                          answerCController.clear();
                          answerDController.clear();
                          gradeController.clear();
                        });
                      }
                    },
                    child: const Text(
                      'Send',
                    ),
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
