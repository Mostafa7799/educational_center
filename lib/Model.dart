import 'dart:core';

import 'dart:ffi';

import 'package:flutter/material.dart';
 class UsersList{
   List<User>? users;
   UsersList.fromjson(Map<String, dynamic> json){
json['data'].forEach((element)=>users!.add(User.fromJson(element)));
   }
 }
class User{
  int? userId;
  String? name;
  String? userName;
  String? email;
  int? phone;
  DateTime? birthdate;
  String? password;
  bool? active;
  DateTime? startDate;
  DateTime? endDate;
  int? modelId;
  //Methods from php
 User.fromJson(Map<String,dynamic> json){
   userId = json['user_id'];
   name = json['name'];
   userName = json['username'];
   email = json['email'];
   phone = json['phone'];
   password = json['password'];
   active = json['active'];
   startDate = json['StartDateActive'];
   endDate = json['EndDate'];
   modelId = json['Model_id'];
   birthdate = json['birthday'];
 }
bool login(String? username, String? password ) {
  if (username == this.userName && password == this.password)
    return this.active = true;
  else
    return this.active = false;
  }
 void register ({required int userId,required String username,required String email,
   required int level,required int phoneNumber,required DateTime birthday,required String password}){
   if (userId != Null ||
       username != Null ||
        email != Null ||
       level != Null ||
       phoneNumber != Null ||
       birthday != Null ||
       password != Null

   )
     {
       this.userId == userId  ;
       this.userName == userName  ;
       this.email == email  ;

       phoneNumber == this.phone;
       birthday == this.birthdate;
       password == this.password;

     }

 }
 }






class Level{
  int? levelId;
  int? level;

}
class Classes{
  int? classId;
  int? teacherId;
  int? subjectId;
  String? name;
  String? details;
  String? time;

}
class TeacherSubject{
  int? teacherId;
  String? subjectId;
}
class message{
  int? messageId;
  int? classId;
  DateTime? date;
  String? messageInfo;

}
class StudentClass{
  int? studentId;
  int? classId;
  DateTime? date;

}
class Model{
  int? modelId;
  String? model;
}
class Matterial{
  int? matterialId;
  String? srcMatt;

}

class teacherMatterial{
  int? teacherId;
  int? subjectId;
  int? classId;
  int? matterialId;
  String? name;
  String? details;

}
class StudentClasses{
  int? id;
  int? classId;
  int? studentId;
}
class StudentHomework{
  int? id;
  int? studentId;
  int? hwId;
  DateTime? uploadDate;
  String? hwSrc;
}
class StudentAttendance{
  int? attendanceId;
  int? studentId;
  int? classId;
  Bool? attendance;

}
class Points{
  int? pointsId;
  int? rank;
  int? points;
  int? studentId;
}
class HomeWork{
  int? homeworkId;
  int? classId;
  DateTime? startDate;
  DateTime? endDate;
  String? srcHw;
}
class Quiz{
  int? quizId;
  int? classId;
  int? grade;
  String? name;
  String? details;
  DateTime? startDate;
  DateTime? endDate;

}
class Question{
  int? questionId;
  int? quizId;
  String? choice1;
  String? choice2;
  String? choice3;
  String? choice4;
  int? grade;
  int? answer;

}
class Subject{
  int? subjectId;
  int? levelId;
  String? name;
  String? details;

}
