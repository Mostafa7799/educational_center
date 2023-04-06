import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

import 'Matt.dart';

class MaterialStudent extends StatefulWidget {
  const MaterialStudent({Key? key}) : super(key: key);

  @override
  State<MaterialStudent> createState() => _MaterialStudentState();
}

class _MaterialStudentState extends State<MaterialStudent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar:

      CurvedNavigationBar(
        height: 50,
        backgroundColor: Colors.white,
        color: Color(0xFF002746),
        items: <Widget>[
          CustomNav(icon: 'assets/images/home.png'),
          CustomNav(icon: 'assets/images/ach.png'),
          CustomNav(icon: 'assets/images/checklist.png'),
          CustomNav(icon: 'assets/images/achievement.png'),
          CustomNav(icon: 'assets/images/user.png'),

        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      backgroundColor: Colors.white,


      body:

      ListView.builder(
          itemCount:1,
          itemBuilder: (context,i)
          {
            return Container(

              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 3),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0,left: 10, bottom: 2),
                          child: Text("English", style: TextStyle(
                              color: Colors.black,fontWeight: FontWeight.w900,fontSize: 25
                          ),),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 0),
                          child: Text("First Secondary", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
                        ),

                      ],

                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0,left: 110),
                          child:
                          Container(

                          ),
                        ),

                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child:   CustomTSButton(text: "Material"),
                          ),


                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child:   CustomTButton(text: "Homework"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child:   CustomTButton(text: "Quiz"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child:   CustomTButton(text: "Grade"),
                          ),




                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 600,
                          height: 600,
                          child: ListView.builder(
                              itemCount: 20,
                              itemBuilder: (context,i)
                          {


                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text("12/8/2022",style: TextStyle(fontWeight: FontWeight.bold),),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: SingleChildScrollView(
                                      child: SizedBox(
                                        width: 350,
                                        height: 120,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1,color: Colors.orange
                                            ),
                                            borderRadius: BorderRadius.circular(25)
                                          ),

                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: CircleAvatar(
                                                        radius: 15,
                                                        backgroundColor: Colors.red,
                                                      ),
                                                    ),
                                                    Text("T_Name"),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 300,
                                                  height: 40,
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 1,color: Colors.black
                                                          ),
                                                          borderRadius: BorderRadius.circular(25)
                                                      ),

                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                              child: Icon(Icons.adobe_rounded),
                                                            ),
                                                            Text("Lec1"),
                                                            Padding(
                                                              padding: const EdgeInsets.only(left: 180.0),
                                                              child: Icon(Icons.expand_circle_down_rounded),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );


                          }),
                        ),
                      ],
                    )

                  ],
                ),
              ),


            );
          }),


    );
  }
}
