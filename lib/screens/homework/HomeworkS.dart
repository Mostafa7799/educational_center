import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:educational_center/widget/custom_bottun.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/home_controller/home_controller_cubit.dart';
import '../../widget/input_widget.dart';
import '../Matt.dart';

class HomeworkS extends StatefulWidget {
  const HomeworkS({Key? key, required this.courseId}) : super(key: key);
  final String courseId;

  @override
  State<HomeworkS> createState() => _HomeworkSState();
}

class _HomeworkSState extends State<HomeworkS> {
  TextEditingController srcController = TextEditingController();

  Future<void> _launchUrl(String? url) async {
    if (!await launchUrl(Uri.parse(url!))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await HomeControllerCubit.get(context).getHomeworkList(id: widget.courseId);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Homework",
        ),
      ),
      body: BlocBuilder<HomeControllerCubit, HomeControllerState>(
        builder: (context, state) {
          var homeworkList = HomeControllerCubit.get(context).homeworkList;
          return ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 600,
                    height: 600,
                    child: ListView.builder(
                      itemCount: homeworkList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.orange,
                              ),
                              borderRadius: BorderRadius.circular(
                                25,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        homeworkList[index].course!.subject!.name!,
                                        style: const  TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        homeworkList[index].endDate!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          _launchUrl(homeworkList[index].src);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1,
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                                  child:
                                                      Icon(Icons.adobe_rounded),
                                                ),
                                                Text("Homework"),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 140.0),
                                                  child: Icon(
                                                    Icons
                                                        .expand_circle_down_rounded,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          showAnimatedDialog(
                                            context,
                                            addHomework(),
                                          );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(14),
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }

  var formKey = GlobalKey<FormState>();

  Widget addHomework() {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          height: 200,
          padding: const EdgeInsets.only(top: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                /// Material name
                const Text(
                  " Add Homework",
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
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await HomeControllerCubit.get(context)
                          .studentAnswerHomework(
                        data: {
                          'homework_id': 1,
                          'src': srcController.text,
                        },
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Send'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showAnimatedDialog(BuildContext context, Widget dialog,
      {bool isFlip = false, bool dismissible = true}) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (context, animation1, animation2) => dialog,
      transitionDuration: Duration(milliseconds: 500),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: widget,
          ),
        );
      },
    );
  }
}
