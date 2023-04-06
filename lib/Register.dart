import 'dart:convert';

import 'package:educational_center/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'input_widget.dart';
import 'Login.dart';
import 'main.dart';
import 'package:http/http.dart' as http;


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController UsernameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController LevelController = TextEditingController();
  TextEditingController PhoneNumberController = TextEditingController();
  TextEditingController BirthdayController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  Future RegAuth() async{
    var url=Uri.http("192.168.1.5",'/gradution_project/student/regester.php',{'q':{'http'}});
    var response = await http.post(url,body: {
      "name" : nameController,
      "username" : UsernameController,
      "email" : EmailController,

      "phone" : PhoneNumberController,
      "birthday" : BirthdayController,
      "password" : PasswordController,

    });
    var data = json.decode(response.body);
    if (data == "data  not inserted" || data == "not connected"){
      Fluttertoast.showToast(
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        msg: "error",
        toastLength: Toast.LENGTH_SHORT
      );

    }
    else{
      Fluttertoast.showToast(
        backgroundColor: Colors.yellow,
        textColor: Colors.white,
        msg: "successful",
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.push(context,
      MaterialPageRoute(builder: (context) => Home()));
    }


  }


  List <String> listoflevel = ["l1", "l2", "l3", "l4"];
  String? selectedlevel ;

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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Icon(Icons.keyboard_backspace_rounded, color: Colors.orange),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white;
                }
                return Colors.white;
              }),
            )),
        title: Text(
          "Register",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            logoWidget(
              imageName: 'assets/images/1.png',
              width: 200,
              height: 60,
            ),
            SizedBox(height: 12),
            InputWidget(
              controller: nameController,
              isPasswordType: false,
              labeltext: 'Enter your Name',
              icon: Icons.person_outline,
            ),
            SizedBox(height: 12),
            InputWidget(
              controller: UsernameController,
              isPasswordType: false,
              labeltext: 'Enter your Username',
              icon: Icons.alternate_email,
            ),
            SizedBox(height: 12),
            InputWidget(
              controller: EmailController,
              isPasswordType: false,
              labeltext: 'Enter your Email',
              icon: Icons.email_outlined,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    prefixIcon:Icon(Icons.border_color_outlined, color: Colors.black),
                    labelText: "Enter your level",
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5,color: Colors.orange),
                      borderRadius: BorderRadius.circular(45.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5,color: Colors.orange),
                      borderRadius: BorderRadius.circular(45.0)
                  ),
                ),
                  value:selectedlevel,
                  items:listoflevel.map((item) =>DropdownMenuItem(value: item,child: Text(item,style: TextStyle(fontSize: 25),),)) .toList()
                  , onChanged: (item)=>setState(()=>selectedlevel=item)),
            ),
            InputWidget(
              controller: PhoneNumberController,
              isPasswordType: false,
              labeltext: "Enter your PhoneNumber",
              icon: Icons.phone,
            ),
            SizedBox(height: 12),
            InputWidget(
              controller: PasswordController,
              isPasswordType: true,
              labeltext: "Enter your Password",
              icon: Icons.password,
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 5),
              child: TextFormField(
                controller: BirthdayController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today_rounded),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.blue,
                  labelText: "Select your Date",
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width :1.5,color: Colors.orange),
                    borderRadius: BorderRadius.circular(45.0)
                  )
                ),
                onTap: ()async{
                  DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101)
                  );
                  if(pickeddate!=null){
                    setState((){
                      BirthdayController.text= DateFormat('yMd').format(pickeddate);
                    });
                  }
                },
              ),
            ),SizedBox(height: 30),
            Container(
              width: 130,
              height: 50,
              margin: const EdgeInsets.fromLTRB(0,0, 0,0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child:
              ElevatedButton(
                onPressed: (){
                  _SignUpState().RegAuth();
                },
                child: Text("Sign up",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states){
                      if(states.contains(MaterialState.pressed)){
                        return Colors.white;
                      }
                      return Colors.orange;
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                    )
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
