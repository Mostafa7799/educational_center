import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_Button extends StatelessWidget {
  final String text;
  final String icon;
  Widget? Function()? onpressed;

  Custom_Button(
      {required this.text, required this.icon, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: 70,
            height: 70,
            child: IconButton(
              icon: new Image.asset(icon),
              onPressed: onpressed,
            )),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        )
      ],
    );
  }
}

class CustomTButton extends StatelessWidget {
  final String text;

  CustomTButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          onPressed: null,
          child: Text(
            text,
            style: TextStyle(color: Color(0xffFF9D02)),
          ),
        ),
      ],
    );
  }
}

class CustomTSButton extends StatelessWidget {
  final String text;

  CustomTSButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          onPressed: null,
          child: Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class CustomNav extends StatelessWidget {
  final String icon;

  CustomNav({required this.icon});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
        width: 35,
        height: 35,
        child: IconButton(
          icon: Image.asset(icon),
          onPressed: () {},
        ));
  }
}
