import 'package:educational_center/controller/subject_controller/subject_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../MatterialS.dart';

class Subjects extends StatefulWidget {
  const Subjects({Key? key}) : super(key: key);

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await SubjectCubit.get(context).getSubjectList(endPoint: 'user/subjects');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Subjects",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        toolbarHeight: 45,
        backgroundColor: Colors.white,
        shadowColor: Colors.white10.withOpacity(0.1),
      ),
      body: BlocBuilder<SubjectCubit, SubjectState>(
        builder: (context, state) {
          var subjectList = SubjectCubit.get(context).subjectList;
          if (state is SubjectListErrorState) {
            return const Center(
              child: Text('No Data'),
            );
          }
          if (state is SubjectListLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
                itemCount: subjectList!.length,
                itemBuilder: (context, index) {
                  return subjectList.isEmpty
                      ? const Center(
                          child: Text('No Data'),
                        )
                      : CustomButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MaterialStudent(
                                  material: subjectList[index].matrial,
                                ),
                              ),
                            );
                            return null;
                          },
                          Classestext: subjectList[index].name!,
                        );
                }),
          );
        },
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String Classestext;
  Widget? Function()? onPressed;

  CustomButton({
    super.key,
    required this.Classestext,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 8),
      child: Container(
        height: 50,
        width: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            width: 2,
            color: Colors.yellowAccent,
          ),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          splashColor: Colors.teal,
          shape: const StadiumBorder(),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/books.png',
                width: 30,
                height: 50,
              ),
              Text(
                Classestext,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
