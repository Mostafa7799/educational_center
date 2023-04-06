import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Register.dart';
import 'home.dart';
import 'input_widget.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget  {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>  {
  TextEditingController usernameController = TextEditingController();
  TextEditingController PassWordController = TextEditingController();
 void LoginAuth(String email,String password){


   String url = "http://192.168.1.5/Fullgrade/user.php";
     http.post(Uri.parse(url),

   body: {
     "email" :email,
     "password":password
   }).then((res) =>print(res.body) ).catchError((error)=>{print(error),
   print("helloo")});



 }

 Future Login() async{

LoginAuth(usernameController.toString(), PassWordController.toString());
   print("here2");
   // if(data["result"]=="not here"){
   //   await Future.delayed(Duration(seconds: 3));
   //   setState(() {
   //
   //   });
   //   print("login");
   //   showDialog(context: context, builder: (context)=>AlertDialog(
   //     content: Text("this email not here"),
   //   ));
   // }
   // else{
   //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
   //
   // }

 }





  /*UsersList? usersList;  List useer =[];  Future<UsersList?> Getdata() async
  {String url = "http://192.168.1.5/project_backend/getData.php";var res = await http.get(Uri.parse(url));if (res.statusCode==200)
  {var red = json.decode(res.body);useer.addAll(red);print(useer);setState(() {});}}
  @override  void initState() {// TODO: implement initStateGetdata();super.initState();}*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: SingleChildScrollView(
            child:Padding(
              padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
              child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 20, 10),
                      child: Text("Login",style: TextStyle(fontSize:25,color: Colors.black),),
                    ),
                      logoWidget(imageName:'assets/images/1.png',width: 500,height: 300,),
                      const SizedBox(height: 20),
                    InputWidget(
                      controller: usernameController,
                      isPasswordType: false,
                      labeltext: 'username',
                      icon: Icons.person_outline,
                    ),SizedBox(height: 20),
                    InputWidget(
                      controller: PassWordController,
                      isPasswordType: true,
                      labeltext: 'Password',
                      icon: Icons.lock_outline,
                    ),SizedBox(height: 30),
                    Container(
                      width: 130,
                      height: 50,
                      margin: const EdgeInsets.fromLTRB(0,0, 0,0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      child:
                      ElevatedButton(
                        onPressed: (){

                         Login();
                         },
                          child: Text("Login",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ForgetPassword(),
                    ),SizedBox(height: 20,),
                    signUpOption()
                  ],
              ),
            ) ,

        ),

      ),
    );
  }
  Row signUpOption() {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?", style: TextStyle(color: Colors.black),),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignUp()),);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: const Text("Sign UP", style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold),),
          ),

        )
      ],
    );
  }
  Row ForgetPassword() {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignUp()),);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: const Text("Forget Password?", style: TextStyle(
              color: Colors.black,),),
          ),

        )
      ],
    );
  }
}

