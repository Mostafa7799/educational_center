import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TeacherProfile extends StatefulWidget {
  const  TeacherProfile({Key? key}) : super(key: key);

  @override
  State< TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State< TeacherProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top:10,),
          child: Row(
            children: [
              Icon(Icons.email_outlined,color: Colors.black,),
              Text("Profile",style: TextStyle(color: Colors.black,fontSize: 25),)

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
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 610),
            decoration: BoxDecoration(color: Colors.teal),
          ),

          Positioned(
            top:40,
            left:13,

            child: CircleAvatar(
              radius: 72,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(
                    'assets/images/me.jpeg'),
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 163,
            child:  Row(
              children: [
                Column(children: [
                Text("MohamedHassan",style:TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.w400) ,),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Text("Mathmatics",style: TextStyle(color:Colors.yellowAccent,fontSize: 15,fontWeight: FontWeight.bold)),
                )
          ],),
                Text("*********",style: TextStyle(color: Colors.deepOrange),)
              ],
            ),),

          Padding(
            padding: const EdgeInsets.only(top:210),
            child: Column(
              children: [
Padding(
  padding: const EdgeInsets.only(left: 80,bottom: 10),
  child:   Row(

    children: [

          Text("Your Rate :"),

      RatingBar.builder(itemBuilder: (context, index) {

        return Icon(Icons.star,color: Colors.cyanAccent,);

      }, onRatingUpdate: (double value) {

        print(value);

      },

      allowHalfRating: true,



      ),

    ],

  ),
),
Container(
  decoration:BoxDecoration(
    color:Colors.white,
    borderRadius: BorderRadius.circular(25),
    border: Border.all(
        width: 2,
        color: Colors.black54
    ),
  ) ,
  height: 100,
  width: 360,

  
),
SizedBox(
  width: 120,
  child:   RaisedButton(
    color: Colors.teal,
    shape: StadiumBorder(),
    onPressed: (){}, child: Text("Submit",),
  ),
),
Padding(
  padding: const EdgeInsets.only(right: 350),
  child:   Text("About:"),
),
Padding(
  padding: const EdgeInsets.only(left: 10),
  child:   Text("sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"),
),

              ],
            ),
          ),



        ],
      ),
    );
  }

}



