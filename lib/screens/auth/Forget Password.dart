import 'package:flutter/material.dart';
import '../../widget/input_widget.dart';
import 'LoginScreen.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController PassWordController = TextEditingController();
  TextEditingController NewpassWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
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
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              logoWidget(
                imageName: 'assets/images/1.png',
                width: 500,
                height: 300,
              ),
              const SizedBox(height: 20),
              InputWidget(
                controller: PassWordController,
                isPasswordType: false,
                labeltext: 'Old password',
                icon: Icons.lock_outline,
              ),
              SizedBox(height: 20),
              InputWidget(
                controller: NewpassWordController,
                isPasswordType: true,
                labeltext: 'New Password',
                icon: Icons.lock_outline,
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
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
                              borderRadius: BorderRadius.circular(50)))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
