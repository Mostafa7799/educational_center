import 'package:flutter/material.dart';
import '../../controller/auth_controller/auth_cubit.dart';
import '../../widget/input_widget.dart';
import 'LoginScreen.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? resetPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white.withOpacity(0.1),
        leading: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
            child: Icon(
              Icons.keyboard_backspace_rounded,
              color: Colors.orange,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white;
                }
                return Colors.white;
              }),
            )),
        title: Text(
          "Forget Password",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              logoWidget(
                imageName: 'assets/images/1.png',
                width: 300,
                height: 200,
              ),
              const SizedBox(height: 20),
              InputWidget(
                controller: emailController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'This field is required';
                  }
                },
                isPasswordType: false,
                labeltext: 'Email',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 20),
              InputWidget(
                controller: nameController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'This field is required';
                  }
                },
                isPasswordType: false,
                labeltext: 'User name',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 20),
              InputWidget(
                controller: mobileController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'This field is required';
                  }
                },
                isPasswordType: false,
                labeltext: 'Mobile',
                icon: Icons.send_to_mobile,
              ),
              const SizedBox(height: 20),
              if(resetPassword != null)
              Text(
                'Your password is: $resetPassword' ??  '',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await AuthCubit.get(context).resetPassword(
                        {
                          'email': emailController.text,
                          'username': nameController.text,
                          'phone': mobileController.text,
                        },
                      ).then((value) {
                        setState(() {
                          resetPassword = AuthCubit.get(context).password;
                        });
                      });
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
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
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
