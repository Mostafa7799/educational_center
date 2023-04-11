import 'package:educational_center/controller/profile_controller/profile_cubit.dart';
import 'package:educational_center/data/models/teacher_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TeacherProfile extends StatelessWidget {
  const TeacherProfile({
    Key? key,
    required this.teacherModel,
  }) : super(key: key);
  final TeacherModel teacherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Teacher Profile",
        ),
        toolbarHeight: 45,
        backgroundColor: Colors.white,
        shadowColor: Colors.white10.withOpacity(0.1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 72,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(
                    'assets/images/me.png',
                  ),
                ),
              ),
              Text(
                teacherModel.username!,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                teacherModel.school!,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: RatingBar.builder(
                  itemBuilder: (context, index) {
                    return const Icon(
                      Icons.star,
                      color: Colors.amber,
                    );
                  },
                  onRatingUpdate: (double value) {
                    print(value);
                  },
                  allowHalfRating: true,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 2, color: Colors.black54),
                ),
                height: 100,
                width: double.infinity,
              ),
              SizedBox(
                width: 120,
                child: MaterialButton(
                  color: Colors.teal,
                  shape: StadiumBorder(),
                  onPressed: () {},
                  child: const Text(
                    "Submit",
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "About:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  teacherModel.about!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
