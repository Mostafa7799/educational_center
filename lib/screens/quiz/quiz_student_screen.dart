import 'package:educational_center/controller/quiz_controller/quiz_cubit.dart';
import 'package:educational_center/widget/custom_bottun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'answer_student_screen.dart';

class QuizStudentScreen extends StatefulWidget {
  const QuizStudentScreen({
    Key? key,
    required this.courseId,
  }) : super(key: key);
  final String courseId;

  @override
  State<QuizStudentScreen> createState() => _QuizStudentScreenState();
}

class _QuizStudentScreenState extends State<QuizStudentScreen> {
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await QuizCubit.get(context)
        .getQuizList(endPoint: 'user/quizzesForUser/${widget.courseId}');
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
          var quizzes = QuizCubit.get(context).quizList;
          if (state is QuizListErrorState) {
            return const Center(
              child: Text('No Data'),
            );
          }
          if (state is QuizListLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return quizzes!.isEmpty
              ? const Center(
                  child: Text('No Data'),
                )
              : ListView.builder(
                  itemCount: quizzes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: quizzes[index].status == 'inactive'
                                ? Colors.orange
                                : quizzes[index].status == 'active'
                                    ? Colors.green
                                    : Colors.red,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.black45),
                                  ),
                                  child: Center(
                                    child: Text(
                                      quizzes[index].userGrade!.isNotEmpty
                                          ? '${quizzes[index].userGrade![0].userGrade}/${quizzes[index].totalGrade}'
                                          : '0',
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Image.asset(
                                  'assets/images/quiz.png',
                                  fit: BoxFit.fill,
                                  width: 90,
                                  height: 100,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Quiz ${quizzes[index].id.toString()}',
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
                                Row(
                                  children: [
                                    if (quizzes[index].status != 'active')
                                      Text(
                                        quizzes[index].status!,
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    if (quizzes[index].status == 'active')
                                      CustomButton(
                                        width: 100,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return AnswerStudentScreen(
                                                  quizId: quizzes[index]
                                                      .id
                                                      .toString(),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                        color: Colors.amber,
                                        title: "Let's go",
                                      ),
                                    const SizedBox(
                                      width: 18,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
