import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Classes extends StatelessWidget {
  const Classes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child:   Column(
            children: [
              Row(
                children: [
                  Icon(Icons.email_outlined,color: Colors.black,),
                  Text("Classes",style: TextStyle(color: Colors.black),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 5),
                child: Row(children: [
                  Icon(Icons.open_in_full,color: Colors.black,size: 15,),
                  Text("Matmatics",style: TextStyle(fontSize: 15,color: Colors.black),)
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
      body:
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context,index){
            return
              CustomButton(
                Classestext: "Class 1-1st Secondary",
              );}
        ),
      ),

    );

  }
}

class CustomButton extends StatelessWidget {
  final String Classestext;
  CustomButton({required this.Classestext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38,vertical: 8),
      child: Container(
        height: 50,
        width: 180,
        decoration:BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
              width: 2,
              color: Colors.yellowAccent
          ),
        ) ,
        child: RaisedButton(
          onPressed: (){},
          splashColor: Colors.teal,
          shape: StadiumBorder(),
          color: Colors.white,
          child: Row(
            children: [
             Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Image.asset('assets/images/books.png',width: 30,height: 50,),
              ),
              SizedBox(
                width: 190,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text("$Classestext",style: TextStyle(fontSize:17,fontWeight: FontWeight.bold ),),
                ),
              ),
             Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
