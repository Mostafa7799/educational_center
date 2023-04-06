
import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  int CurrentIcon=0;
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
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 3 ),
            child: Column(
              children: [
                Container(
                  decoration:BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                        width: 2,
                        color: Colors.yellowAccent
                    ),
                  ) ,
                  width: 370,
                  height: 45,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius:16,
                          backgroundImage: AssetImage(
                            'assets/images/me.jpeg'),),
                        Padding(
                          padding: const EdgeInsets.all( 8.0),
                          child: Text("Ahmed Tarek",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black),),
                        ),
Spacer(),
                        IconButton(onPressed: (){
                          setState(() {
                          CurrentIcon=0;
                          });
                        }, icon: Icon(Icons.check_circle_outline),
                            iconSize: 30,
                        color: CurrentIcon==0?
                          Colors.green:Colors.black),
                        IconButton(onPressed: (){
                          setState(() {
                            CurrentIcon=1;
                          });
                        }, icon:Icon(Icons.cancel_outlined),
                            iconSize: 30,
                            color: CurrentIcon==1?
                            Colors.red:Colors.black),
                      ],
                    ),
                  ),
                ),
           /* SizedBox(
                  width: 120,
                  child:   RaisedButton(
                    color: Colors.teal,
                    shape: StadiumBorder(),
                    onPressed: (){}, child: Text("Submit",),
                  ),
                ),*/
              ],
            ),
          );
        }

        ),
      )
    );
   
  }
}

