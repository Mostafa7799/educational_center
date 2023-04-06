import 'dart:convert';
import 'package:educational_center/HomeworkS.dart';
import 'package:educational_center/Login.dart';

import 'package:educational_center/MatterialS.dart';
import 'package:educational_center/Register.dart';
import 'package:educational_center/aboutUs.dart';
import 'package:educational_center/class_not_started.dart';
import 'package:educational_center/homeNotActive.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:educational_center/MatterialS.dart';
import 'TeachersSearch.dart';

import 'Model.dart';
import 'QuizS.dart';
import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:FutureBuilder(
        builder: (context,dataSnapShot){
          return Home();
        },
      ) ,

    );
  }
}
  class FirstScreen extends StatefulWidget {
    const FirstScreen({Key? key}) : super(key: key);

    @override
    State<FirstScreen> createState() => _FirstScreenState();
  }

  class _FirstScreenState extends State<FirstScreen> {
    UsersList? usersList;
     List useer =[];
    Future<UsersList?> Getdata() async {

      String url = "http://192.168.1.5/project_backend/getData.php";
      var res = await http.get(Uri.parse(url));
      if (res.statusCode==200)                {
        var red = json.decode(res.body);
        useer.addAll(red);
        print(useer);
        setState(() {

        });
      }

    }
    @override
  void initState() {
    // TODO: implement initState
      Getdata();
    super.initState();

  }
      @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('ko'),

        ),
         body:
   ListView.builder(
       itemCount:useer.length,
       itemBuilder: (context,i)
       {
     return Container(

      child: Text("${useer[i]['username']}")
     );
   })

      );
    }
  }



