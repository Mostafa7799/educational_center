  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeeProfile extends StatefulWidget {
  const  SeeProfile({Key? key}) : super(key: key);

  @override
  State< SeeProfile> createState() => _SeeProfileState();
}

class _SeeProfileState extends State< SeeProfile> {

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
            margin: EdgeInsets.only(bottom: 600),
            decoration: BoxDecoration(color: Colors.teal),
            child: Column(
              children: [
                Row(
                  children: [

                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(left:180,top: 85),
                        child: Text("MohamedHassan",style:TextStyle(color:Colors.white,fontSize: 15,fontWeight: FontWeight.w400) ,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 150),
                        child: Text("@Username",style: TextStyle(color:Colors.white,fontSize: 15,fontWeight: FontWeight.w400)),
                      )
                    ],),

                  ],
                )
              ],
            ),
          ),

          Positioned(
            top:45,
            left: 17,

            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                  'assets/images/me.jpeg'),
            ),
          ),
          Positioned(
            top: 300,
            left: 66,
            child: Container(
              color: Colors.teal,
              height: 90,
              width: 280,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top:230),
            child: Column(
              children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Points",style: TextStyle(fontSize: 25,),),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 180),
                    child: Text("Rank: 100",style: TextStyle(fontSize: 25,),),
                  ),

                ],),
                Padding(
                  padding: const EdgeInsets.only(left: 150,),
                  child: Row(children: [
                    Icon(Icons.align_vertical_bottom,color: Colors.black54,),
                    Text("Score",style: TextStyle(fontSize: 25,color: Colors.black54,), ),

                      ],),
                ),
                Text("0190",style: TextStyle(fontSize: 105,fontWeight: FontWeight.w400,color:Colors.white ),),
                Padding(
                  padding: const EdgeInsets.only(right: 320),
                  child: Text("Level:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                ),

                CardInfo(
                  icon1: Icons.edit,
                  text1: "My Level",
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 310),
                  child: Text("School:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                ),
                CardInfo(
                  icon1: Icons.school_outlined,
                  text1: "My School",
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }

}


class CardInfo extends StatelessWidget {
  final String text1;
  final IconData icon1;
  CardInfo({required this.text1,required this.icon1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
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
              Icon(icon1),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(text1,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
