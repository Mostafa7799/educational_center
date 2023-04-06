import 'package:educational_center/widget/custom_bottun.dart';
import 'package:flutter/material.dart';

class QuizStudentScreen extends StatelessWidget {
  const QuizStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quizzes',
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    'assets/images/1.png',
                    fit: BoxFit.fill,
                    width: 70,
                    height: 90,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Quiz1',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            'English',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '2022-2-2',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '/',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '2022-2-2',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children:  [
                           CustomButton(
                             onPressed: (){},
                            color: Colors.amber,
                            title: "Let's go",
                          ),
                          const SizedBox(width: 18,),
                          CustomButton(
                            onPressed: (){},
                            color: Colors.green,
                            title: "Details",
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
      ),
    );
  }
}
