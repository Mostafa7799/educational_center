import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Matt.dart';

class QuizS extends StatefulWidget {
  const QuizS({Key? key}) : super(key: key);

  @override
  State<QuizS> createState() => _QuizSState();
}

class _QuizSState extends State<QuizS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Colors.white,
        color: Color(0xFF002746),
        items: <Widget>[
          CustomNav(icon: 'assets/images/home.png'),
          CustomNav(icon: 'assets/images/ach.png'),
          CustomNav(icon: 'assets/images/checklist.png'),
          CustomNav(icon: 'assets/images/achievement.png'),
          CustomNav(icon: 'assets/images/user.png'),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 10, bottom: 2),
                        child: Text(
                          "English",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 0),
                        child: Text(
                          "First Secondary",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 110),
                        child: Container(),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 5.0),
                          child: CustomTButton(text: "Material"),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 5.0),
                          child: CustomTButton(text: "Homework"),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 15.0),
                          child: CustomTSButton(text: "Quiz"),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 5.0),
                          child: CustomTButton(text: "Grade"),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 600,
                        height: 600,
                        child: ListView.builder(
                            itemCount: 20,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "12/8/2022",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: SingleChildScrollView(
                                        child: SizedBox(
                                          width: 350,
                                          height: 120,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.orange),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: SizedBox(
                                                            width: 100,
                                                            height: 100,
                                                            child: Image.asset(
                                                                'assets/images/quiz.png'))),
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 100,
                                                                  top: 14,
                                                                  bottom: 4),
                                                          child: Row(
                                                              children: [
                                                                Text(
                                                                  "Quiz 2",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight.w500),
                                                                ),
                                                              ]),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                              children: [
                                                                Text(
                                                                  "2019-2323-2323",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight.w500),
                                                                ),
                                                              ]),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
    ;
  }
}
