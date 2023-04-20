import 'package:educational_center/controller/profile_controller/profile_cubit.dart';
import 'package:educational_center/data/models/teacher_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TeacherProfile extends StatefulWidget {
  const TeacherProfile({
    Key? key,
    required this.teacherModel,
  }) : super(key: key);
  final TeacherModel teacherModel;

  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  TextEditingController feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double ratingValue = widget.teacherModel.rate?.toDouble() ??3;
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
               CircleAvatar(
                radius: 72,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                    widget.teacherModel.image ??'https://pic.onlinewebfonts.com/svg/img_405324.png',
                  ),
                ),
              ),
              Text(
                widget.teacherModel.username!,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                widget.teacherModel.school!,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: RatingBar.builder(
                  initialRating: widget.teacherModel.rate?.toDouble() ??3,
                  itemBuilder: (context, index) {
                    return const Icon(
                      Icons.star,
                      color: Colors.amber,
                    );
                  },
                  onRatingUpdate: (double value) {
                    setState(() {
                      ratingValue = value;
                    });
                    print(value);
                  },
                  allowHalfRating: true,
                ),
              ),
              TextField(
                controller: feedbackController,
                maxLines: 5,
                decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1.5, color: Colors.orange),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1.5, color: Colors.orange),
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                  hintText: "your feedback",
                ),
              ),
              SizedBox(
                width: 120,
                child: MaterialButton(
                  color: Colors.teal,
                  shape: StadiumBorder(),
                  onPressed: () {
                    ProfileCubit.get(context).studentSendFeedback(
                      data: {
                        'teacher_id': widget.teacherModel.id,
                        'review':feedbackController.text,
                        'rate': ratingValue,
                      }
                    );
                  },
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
                  widget.teacherModel.about!,
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
