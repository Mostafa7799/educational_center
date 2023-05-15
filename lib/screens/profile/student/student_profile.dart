import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:educational_center/controller/profile_controller/profile_cubit.dart';

import 'package:educational_center/screens/auth/LoginScreen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileStudent extends StatefulWidget {
  const ProfileStudent({Key? key}) : super(key: key);

  @override
  State<ProfileStudent> createState() => _ProfileStudentState();
}

class _ProfileStudentState extends State<ProfileStudent> {
  File? pickedImageFile;
  FormData? formData;

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var studentData = ProfileCubit.get(context).studentModel;
          if (state is StudentProfileErrorState) {
            return const Center(
              child: Text('No Data'),
            );
          }
          if (state is StudentProfileLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          /// Variables
          String? selectedLevel = studentData!.levelId.toString();
          TextEditingController school =
              TextEditingController(text: studentData.school);
          TextEditingController email =
              TextEditingController(text: studentData.email);
          TextEditingController phone =
              TextEditingController(text: studentData.phone);
          TextEditingController birthday =
              TextEditingController(text: studentData.birthdate);
          List<String> levels = ["1", "2", "3", "4"];

          return RefreshIndicator(
            onRefresh: ()async{
              setState(() {
                ProfileCubit.get(context).getStudentProfile();
                studentData = ProfileCubit.get(context).studentModel;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      pickedImageFile != null
                          ? CircleAvatar(
                              radius: 80,
                              backgroundImage: FileImage(
                                pickedImageFile!,
                              ),
                            )
                          : CircleAvatar(
                              radius: 80,
                              backgroundImage: NetworkImage(
                                'http://10.0.2.2:8000${studentData?.image!}',
                              ),
                            ),
                      Positioned(
                        bottom: 10,
                        left: 220,
                        child: InkWell(
                          onTap: () async {
                            final ImagePicker _picker = ImagePicker();
                            final XFile? pickedFile = await _picker.pickImage(
                              source: ImageSource.gallery,
                              maxWidth: 512,
                              maxHeight: 512,
                            );
                            if (pickedFile != null) {
                              setState(() {
                                pickedImageFile = File(pickedFile.path);
                              });
                            }
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: Icon(
                              Icons.camera_alt,
                              size: 35,
                              color: Color(0xFF404040),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      studentData?.username ?? 'none',
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ),

                  /// Edit
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Edit profile",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                    "Edit information:",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  content: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 320,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              height: 55,
                                              width: 300,
                                              child:
                                                  DropdownButtonFormField<String>(
                                                items: levels.map((item) {
                                                  return DropdownMenuItem(
                                                      value: item,
                                                      child: Text(item));
                                                }).toList(),
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(
                                                    Icons.edit,
                                                    color: Colors.black,
                                                  ),
                                                  hintText: "Enter your level",
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.yellowAccent),
                                                    borderRadius:
                                                        BorderRadius.circular(30),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1.5,
                                                        color:
                                                            Colors.yellowAccent),
                                                    borderRadius:
                                                        BorderRadius.circular(30),
                                                  ),
                                                ),
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedLevel = value;
                                                  });
                                                },
                                                value: selectedLevel,
                                              ),
                                            ),
                                          ),
                                          CustomTextField(
                                            hint: 'Your School',
                                            icon1: Icons.school_outlined,
                                            controller: school,
                                          ),
                                          CustomTextField(
                                            controller: email,
                                            hint: 'Your Email@gmail.com',
                                            icon1: Icons.email_outlined,
                                          ),
                                          CustomTextField(
                                            controller: phone,
                                            hint: 'Your Phone',
                                            icon1: Icons.phone_android_sharp,
                                          ),
                                          CustomTextField(
                                            controller: birthday,
                                            hint: 'Your Birthday',
                                            icon1: Icons.date_range,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 60,
                                      ),
                                      child: SizedBox(
                                        height: 35,
                                        width: 100,
                                        child: MaterialButton(
                                          onPressed: () async {
                                            await ProfileCubit.get(context)
                                                .updateStudentProfile(data: {
                                              "username": studentData?.username ??'',
                                              "email": email.text,
                                              "phone": phone.text,
                                              "school": school.text,
                                              "birthdate": birthday.text,
                                              "level_id": selectedLevel,
                                            });
                                          },
                                          color: Colors.green,
                                          shape: StadiumBorder(),
                                          splashColor: Colors.blueAccent,
                                          child: const Text(
                                            "Edit",
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 18),
                                      child: SizedBox(
                                        height: 35,
                                        width: 100,
                                        child: MaterialButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          color: Colors.red[700],
                                          shape: StadiumBorder(),
                                          child: Text("Cancel"),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  /// Logout
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await ProfileCubit.get(context)
                              .logout(endPoint: 'user/logout')
                              .then((value) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const LoginPage();
                                },
                              ),
                            );
                          });
                        },
                        color: Colors.red[800],
                        splashColor: Colors.white,
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  /// Profile data
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Level:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      CardInfo(
                        icon: Icons.edit,
                        text: studentData!.levelId!.toString(),
                      ),
                      const Text(
                        "School:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      CardInfo(
                        icon: Icons.school_outlined,
                        text: studentData?.school ?? 'none',
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, right: 310),
                        child: Text(
                          "Email:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      CardInfo(
                        icon: Icons.email_outlined,
                        text: studentData?.email ?? 'none',
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, right: 230),
                        child: Text(
                          "PhoneNamber:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      CardInfo(
                        icon: Icons.phone_android_sharp,
                        text: studentData?.phone ?? 'none',
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, right: 275),
                        child: Text(
                          "Birthday:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ),
                      CardInfo(
                        icon: Icons.date_range,
                        text: studentData?.birthdate ?? 'none',
                      ),
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

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon1;
  TextEditingController controller;

  CustomTextField(
      {required this.hint, required this.icon1, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 45,
        width: 300,
        child: TextField(
          controller: controller,
          cursorColor: Colors.yellowAccent,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon1),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.yellowAccent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.yellowAccent)),
          ),
        ),
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  final String text;
  final IconData icon;

  CardInfo({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 2, color: Colors.yellowAccent),
        ),
        width: 370,
        height: 45,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Icon(icon),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
