import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/pref.dart';
import '../HomeworkS.dart';
import '../Matt.dart';
import '../QuizS.dart';
import '../TeachersSearch.dart';
import '../aboutUs.dart';
import '../subject/subjects.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userName;
  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    userName = await SharedPreferencesHelper.getAccessName();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {


    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Welcome, $userName",
                style:const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                  width: 300,
                  height: 250,
                  child: Image.asset(
                    'assets/images/homepik.png',
                    bundle: null,
                  )),
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Custom_Button(
                            text: "Subjects",
                            icon: 'assets/images/books.png',
                            onpressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Subjects(),
                                ),
                              );
                              return null;
                            })),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Custom_Button(
                          text: "Points",
                          icon: 'assets/images/points.png',
                          onpressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Subjects(),
                              ),
                            );
                          }),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Custom_Button(
                          text: "Grade",
                          icon: 'assets/images/score.png',
                          onpressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Subjects()));
                          }),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Custom_Button(
                          text: "Homework",
                          icon: 'assets/images/list.png',
                          onpressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeworkS()));
                          }),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Custom_Button(
                          text: "TO-DO List",
                          icon: 'assets/images/to-do-list.png',
                          onpressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Subjects()));
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Custom_Button(
                          text: "Quizzes",
                          icon: 'assets/images/quiz.png',
                          onpressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizS(),
                              ),
                            );
                          }),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Custom_Button(
                          text: "Teachers",
                          icon: 'assets/images/teacher.png',
                          onpressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TeachersSearch()));
                          }),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Custom_Button(
                          text: "Languages",
                          icon: 'assets/images/languages.png',
                          onpressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Subjects()));
                          }),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Custom_Button(
                          text: "Programming",
                          icon: 'assets/images/programming.png',
                          onpressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Subjects()));
                          }),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Custom_Button(
                          text: "About Us",
                          icon: 'assets/images/info.png',
                          onpressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutUs()));
                          }),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
