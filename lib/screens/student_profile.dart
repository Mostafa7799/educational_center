import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileStudent extends StatefulWidget {
  const ProfileStudent({Key? key}) : super(key: key);

  @override
  State<ProfileStudent> createState() => _ProfileStudentState();
}

class _ProfileStudentState extends State<ProfileStudent> {
  TextEditingController school = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController birthday = TextEditingController();
  List<String> Levels = ["Level one", "Level two", "Level three"];
  String? SelectedLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Row(
            children: [
              Icon(
                Icons.email_outlined,
                color: Colors.black,
              ),
              Text(
                "Profile",
                style: TextStyle(color: Colors.black, fontSize: 25),
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "LOGO",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          )
        ],
        toolbarHeight: 45,
        backgroundColor: Colors.white,
        shadowColor: Colors.white10.withOpacity(0.1),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 600),
            decoration: BoxDecoration(color: Colors.teal),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Icon(Icons.open_in_full),
                      Text(
                        "First grade secondary",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 180, top: 62),
                      child: Column(
                        children: [
                          Text(
                            "MohamedHassan",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Text("@Username",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 45,
            left: 17,
            child: CircleAvatar(
              child: Align(
                alignment: Alignment.bottomRight,
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
              radius: 80,
              backgroundImage: AssetImage('assets/images/me.jpeg'),
            ),
          ),
          Positioned(
            top: 133,
            left: 280,
            child: IconButton(
              onPressed: () {},
              color: Colors.red[800],
              splashColor: Colors.white,
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 230,
            left: 360,
            child: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Edit informations:"),
                        content: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 320,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 55,
                                    width: 300,
                                    child: DropdownButtonFormField<String>(
                                      items: Levels.map((item) {
                                        return DropdownMenuItem(
                                            value: item, child: Text(item));
                                      }).toList(),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.edit,
                                            color: Colors.black),
                                        hintText: "Enter your level",
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.yellowAccent),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1.5,
                                                color: Colors.yellowAccent),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          SelectedLevel = value;
                                        });
                                      },
                                      value: SelectedLevel,
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
                            child: Container(
                              height: 35,
                              width: 100,
                              child: MaterialButton(
                                onPressed: () {},
                                child: Text("Edit"),
                                color: Colors.green,
                                shape: StadiumBorder(),
                                splashColor: Colors.blueAccent,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 18),
                            child: Container(
                              height: 35,
                              width: 100,
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Cancel"),
                                color: Colors.red[700],
                                shape: StadiumBorder(),
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              },
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 230, right: 305),
                child: Text(
                  "Level:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              CardInfo(
                icon: Icons.edit,
                text: "My_Level",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 305),
                child: Text(
                  "School:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              CardInfo(
                icon: Icons.school_outlined,
                text: "My_School",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 310),
                child: Text(
                  "Email:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              CardInfo(
                icon: Icons.email_outlined,
                text: "My_MyEmail",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 230),
                child: Text(
                  "PhoneNamber:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              CardInfo(
                icon: Icons.phone_android_sharp,
                text: "01125469588",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 275),
                child: Text(
                  "Birthday:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              CardInfo(
                icon: Icons.date_range,
                text: "02-07-2000",
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon1;
  final TextEditingController controller;

  CustomTextField(
      {required this.hint, required this.icon1, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
