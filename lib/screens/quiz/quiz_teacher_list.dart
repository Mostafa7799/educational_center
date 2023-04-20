import 'package:educational_center/core/api_const.dart';
import 'package:educational_center/screens/quiz/add_question_screen.dart';
import 'package:educational_center/screens/quiz/teacher_add_quiz.dart';
import 'package:educational_center/widget/custom_bottun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/quiz_controller/quiz_cubit.dart';

class QuizTeacherList extends StatefulWidget {
  const QuizTeacherList({Key? key}) : super(key: key);

  @override
  State<QuizTeacherList> createState() => _QuizTeacherListState();
}

class _QuizTeacherListState extends State<QuizTeacherList> {
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await QuizCubit.get(context)
        .getQuizList(endPoint: ApiConstant.quizTeacherEndPoint);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quizzes',
        ),
      ),
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          if (state is QuizListErrorState) {
            return const Center(
              child: Text('No Data'),
            );
          }
          if (state is QuizListLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          var quizzes = QuizCubit
              .get(context)
              .quizList;
          return ListView.builder(
            itemCount: quizzes!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return AddQuestionScreen(quizId: quizzes[index].id!,);
                      },),);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.orange,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/quiz.png',
                          fit: BoxFit.fill,
                          width: 90,
                          height: 100,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Quiz ${quizzes[index].id}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    quizzes[index].details!,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              quizzes[index].date!,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  quizzes[index].startTime!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                const Text(
                                  '  To  ',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  quizzes[index].endTime!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: SizedBox(
        height: 50,
        child: CustomButton(
          width: 150,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TeacherAddQuiz();
                },
              ),
            );
          },
          color: Colors.green,
          title: "Add Quiz",
        ),
      ),
    );
  }
}
