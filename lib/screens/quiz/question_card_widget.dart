import 'package:educational_center/controller/quiz_controller/quiz_cubit.dart';
import 'package:flutter/material.dart';
import '../../widget/custom_bottun.dart';

class AnswerCardWidget extends StatefulWidget {
  AnswerCardWidget({
    Key? key,
    required this.qName,
    required this.choiceA,
    required this.choiceB,
    required this.choiceC,
    required this.choiceD,
    required this.quizId,
  }) : super(key: key);
  final String qName;
  final String quizId;
  final String choiceA;
  final String choiceB;
  final String choiceC;
  final String choiceD;

  @override
  State<AnswerCardWidget> createState() => _AnswerCardWidgetState();
}

class _AnswerCardWidgetState extends State<AnswerCardWidget> {
  List<String> choices = [
    "choice_a",
    "choice_b",
    "choice_c",
    "choice_d",
  ];
  bool? choiceA;
  bool? choiceB;
  bool? choiceC;
  bool? choiceD;
  String? userChoice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Answer'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.orange,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.qName,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),

              /// A
              InkWell(
                onTap: (){
                  setState(() {
                    choiceA = true;
                    choiceC = false;
                    choiceD = false;
                    choiceB = false;
                    userChoice = choices[0];
                  });
                },
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: choiceA == true ? Colors.green : Colors.white,
                        border: Border.all(
                          color: Colors.orange,
                          width: 1.5,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'A',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Flexible(
                      child: Text(
                        widget.choiceA,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// B
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        choiceB = true;
                        choiceA = false;
                        choiceC = false;
                        choiceD = false;
                        userChoice = choices[1];
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: choiceB == true ? Colors.green : Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.orange,
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'B',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Flexible(
                    child: Text(
                      widget.choiceB,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),

              /// C
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        choiceC = true;
                        choiceA = false;
                        choiceB = false;
                        choiceD = false;
                        userChoice = choices[2];
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: choiceC == true ? Colors.green : Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.orange,
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'C',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Flexible(
                    child: Text(
                      widget.choiceC,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),

              /// D
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        choiceD = true;
                        choiceA = false;
                        choiceC = false;
                        choiceB = false;
                        userChoice = choices[3];
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: choiceD == true ? Colors.green : Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.orange,
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'D',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Flexible(
                    child: Text(
                      widget.choiceD,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),

              /// Save answer
              CustomButton(
                height: 40,
                onPressed: () {
                  QuizCubit.get(context).studentAnswerQuiz(
                    data: {
                      'quiz_questions_id':widget.quizId,
                      'user_answer': userChoice
                    }
                  );
                },
                color: Colors.green,
                title: 'Save your answer',
              )
            ],
          ),
        ),
      ),
    );
  }
}
