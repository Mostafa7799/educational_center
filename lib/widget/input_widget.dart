import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? labeltext;
  final IconData icon;
  final bool isPasswordType;
  final Function(String value)? validator;

  const InputWidget({
    required this.controller,
    required this.labeltext,
    required this.icon,
    required this.isPasswordType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        controller: controller,

        validator: (value) => validator!(value!),
        obscureText: isPasswordType,
        enableSuggestions: !isPasswordType,
        autocorrect: !isPasswordType,
        cursorColor: Colors.orange,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.blue,
          labelText: labeltext,
          labelStyle: const TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.5,
                color: Colors.orange,
              ),
              borderRadius: BorderRadius.circular(45.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.5,
                color: Colors.orange,
              ),
              borderRadius: BorderRadius.circular(45.0)),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1.5,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(45.0),
          ),
        ),
        keyboardType: isPasswordType
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
      ),
    );
  }
}

Widget textField(
    {required TextEditingController controller, required String? hintText}) {
  return TextFormField(
    decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey,
        ))),
  );
}

Image logoWidget(
    {required String imageName,
    required double width,
    required double height}) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitHeight,
    width: width,
    height: height,
  );
}

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: 170,
    height: 60,
    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.white;
          }
          return Colors.orange;
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Text(
        isLogin ? 'Login' : 'Sign Up',
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    ),
  );
}
