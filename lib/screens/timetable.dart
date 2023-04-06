import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Padding(
            padding: const EdgeInsets.only(top: 2.5),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.email_outlined,color: Colors.black,),
                    Text("TimeTable",style: TextStyle(color: Colors.black,fontSize: 23),)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(children: [
                    Icon(Icons.date_range,color: Colors.black,size: 20,),
                    Text("Tuesday",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.black),)
                  ],),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text("LOGO",style: TextStyle(color: Colors.black,fontSize: 30),),
            )
          ],
          toolbarHeight: 45,backgroundColor: Colors.white,shadowColor: Colors.white10.withOpacity(0.1),
        ),
        body:Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ListView.builder(
            shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (context, index) {
            return  CustomTable(
              day: "Today",
            );
          }),
        ),
    );
  }
}

class CustomTable extends StatelessWidget {
  final String? day;
  CustomTable({required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          child: Text("${day}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
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
    );
  }
}
