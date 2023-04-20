import 'package:educational_center/controller/quiz_controller/quiz_cubit.dart';
import 'package:educational_center/screens/quiz/question_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_survey/flutter_survey.dart';

import '../../widget/custom_bottun.dart';

class AnswerStudentScreen extends StatefulWidget {
  const AnswerStudentScreen({Key? key, required this.quizId}) : super(key: key);
  final String quizId;

  @override
  State<AnswerStudentScreen> createState() => _AnswerStudentScreenState();
}


class _AnswerStudentScreenState extends State<AnswerStudentScreen> {


  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await QuizCubit.get(context)
        .getQuestionsList(endPoint: 'user/questionsOfQuiz/${widget.quizId}');
    super.didChangeDependencies();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Question',
        ),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          var questions = QuizCubit.get(context).questionList;
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AnswerCardWidget(
                                  quizId: questions[index].id.toString(),
                                  qName:  questions[index].question!,
                                  choiceA:  questions[index].choiceA!,
                                  choiceB:  questions[index].choiceB!,
                                  choiceC:  questions[index].choiceC!,
                                  choiceD:  questions[index].choiceD!,
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(12),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.amberAccent,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                questions[index].question!,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                /// Save answer
                CustomButton(
                  height: 40,
                  width: 100,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.green,
                  title: 'Finish',
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
