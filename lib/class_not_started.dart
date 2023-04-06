
import 'dart:ffi';

import 'package:educational_center/subjects.dart';
import 'package:educational_center/timetable.dart';
import 'package:flutter/material.dart';

class ClassNotStarted extends StatelessWidget {
  int currentPage =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 5),
          child:   Column(
            children: [
              Row(
                children: [
                  Icon(Icons.email_outlined,color: Colors.black,),
                  Text("Class",style: TextStyle(color: Colors.black),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 5),
                child: Row(children: [
                  Icon(Icons.open_in_full,color: Colors.black,size: 15,),
                  Text("First grade secondary-Mathematics",style: TextStyle(fontSize: 15,color: Colors.black),)
                ],),
              ),

            ],
          ),
        ),
        actions: [
          Text("Logo",style: TextStyle(color: Colors.black,fontSize: 30),)
        ],

        toolbarHeight: 45,backgroundColor: Colors.white,shadowColor: Colors.white10.withOpacity(0.1),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 30,top: 10),
          child: Row(children: [
            CustomTButton(text: "Material",
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Subjects()));
            },),
           CustomTButton(text: "Homework",onPressed: null,),
            CustomTButton(text: "Quiz",onPressed: null,),
            CustomTButton(text: "Attendace",onPressed: null,),
          ],),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18.0,bottom: 15),
          child: Image.asset('assets/images/class.png',width: 350,height: 300,),
        ),
      Container(
      margin: EdgeInsets.symmetric(horizontal: 40,vertical: 5),

      child: Table(
        border: TableBorder.all(),
        children: [
          TableRow(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: Row(
                      children: [
                        Icon(Icons.date_range),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("Today",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                        ),
                      ],
                    ),
                  ),height: 40,width:100,color: Colors.teal,),
              ]
          ),
          TableRow(
              children: [
                Container(child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text("13:00 - 15:00    |",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Text("Class A - English",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                      ),
                    ],
                  ),
                ),height: 40,width:100,color: Colors.orange,),
              ]
          ),

        ],
      ),
    )
      ],),
    );
  }
}

class CustomTButton extends StatelessWidget {
  final String text;
 Widget? Function()? onPressed;

  CustomTButton({required this.text,required this.onPressed});
  @override Widget build(BuildContext context)
  {
    return
      Row(
        children: [
          Icon(Icons.lens,color:Color(0xffFF9D02),size: 5,),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            onPressed: onPressed,
            child: Text(text, style: TextStyle(color: Color(0xffFF9D02)),
            ),
          ),
        ],
      );
  }}