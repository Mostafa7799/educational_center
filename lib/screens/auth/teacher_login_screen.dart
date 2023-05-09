import 'package:educational_center/controller/auth_controller/auth_cubit.dart';
import 'package:educational_center/screens/course/Classes%20time.dart';
import 'package:educational_center/screens/home/teacher_home.dart';
import 'package:educational_center/screens/profile/teacher/teacher_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../widget/input_widget.dart';
import '../home/layout_screen.dart';
import '../home/teacher_layout.dart';
import 'Forget Password.dart';
import 'Register.dart';

class TeacherLoginScreen extends StatefulWidget {
  const TeacherLoginScreen({Key? key}) : super(key: key);

  @override
  State<TeacherLoginScreen> createState() => _TeacherLoginScreenState();
}

class _TeacherLoginScreenState extends State<TeacherLoginScreen> {
  late bool _passwordVisible;

  @override
  initState() {
    super.initState();
    _passwordVisible = true;
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context,state){
          if(state is LoginTeacherSuccessState){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const TeacherLayoutScreen();
                },
              ),
            );
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                100,
                20,
                0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 20, 10),
                      child: Text(
                        "Teacher Login",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    logoWidget(
                      imageName: 'assets/images/1.png',
                      width: 200,
                      height: 100,
                    ),
                    const SizedBox(height: 20),
                    InputWidget(
                      controller: usernameController,
                      isPasswordType: false,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'This field is required';
                        }
                      },
                      labeltext: 'email',
                      icon: Icons.person_outline,
                    ),
                    const SizedBox(height: 20),
                    InputWidget(
                      controller: passWordController,
                      isPasswordType: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'This field is required';
                        }
                      },
                      labeltext: 'Password',
                      icon: Icons.lock_outline,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 130,
                      height: 50,
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            cubit.loginTeacher({
                              'email': usernameController.text,
                              'password': passWordController.text,
                            });
                          }else{
                            Fluttertoast.showToast(
                              msg: 'Please enter a valid data',
                              backgroundColor: Colors.red,
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.white;
                            }
                            return Colors.orange;
                          }),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Row forgetPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ForgetPassword(),
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Forget Password?",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        )
      ],
    );
  }
}
