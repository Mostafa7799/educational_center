import 'package:educational_center/controller/profile_controller/profile_cubit.dart';
import 'package:educational_center/screens/auth/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileForTeacher extends StatefulWidget {
  const ProfileForTeacher({Key? key}) : super(key: key);

  @override
  State<ProfileForTeacher> createState() => _ProfileForTeacherState();
}

class _ProfileForTeacherState extends State<ProfileForTeacher> {
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await ProfileCubit.get(context).getTeacherProfile();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teacher Profile"),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var teacherData = ProfileCubit.get(context).teacherModel;

          /// Variables
          TextEditingController aboutTeacher =
              TextEditingController(text: teacherData?.createdAt);
          TextEditingController email =
              TextEditingController(text: teacherData?.email);
          TextEditingController phone =
              TextEditingController(text: teacherData!.phone ?? '');
          TextEditingController birthday =
              TextEditingController(text: teacherData.birthdate);
          if (state is TeacherProfileErrorState) {
            return const Center(
              child: Text('No Data'),
            );
          }
          if (state is TeacherProfileLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(
                        'assets/images/me.png',
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 220,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Icon(
                          Icons.camera_alt,
                          size: 35,
                          color: Color(0xFF404040),
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
                    teacherData.username ?? 'none',
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
                                        CustomTextField(
                                          hint: 'About',
                                          icon1: Icons.school_outlined,
                                          controller: aboutTeacher,
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
                                              .updateTeacherProfile(data: {
                                            "username": teacherData.username,
                                            "email": email.text,
                                            "phone": phone.text,
                                            "school": 'cairo',
                                            "about": aboutTeacher.text,
                                            "birthdate": birthday.text,
                                          });
                                        },
                                        child: Text("Edit"),
                                        color: Colors.green,
                                        shape: StadiumBorder(),
                                        splashColor: Colors.blueAccent,
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
                            .logout(endPoint: 'teacher/logout')
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
                      "About:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    CardInfo(
                      icon: Icons.school_outlined,
                      text: teacherData.school ?? 'none',
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
                      text: teacherData.email ?? 'none',
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
                      text: teacherData.phone ?? 'none',
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
                      text: teacherData.birthdate ?? 'none',
                    ),
                  ],
                )
              ],
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
