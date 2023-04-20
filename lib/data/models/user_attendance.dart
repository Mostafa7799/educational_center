import 'package:educational_center/data/models/student_model.dart';

class UserAttendance {
  int? id;
  int? userId;
  int? courseId;
  String? day;
  String? time;
  String? startDate;
  String? endDate;
  int? attendanceNumber;
  int? absenceNumber;
  String? updatedAt;
  StudentModel? studentModel;

  UserAttendance(
      {this.id,
        this.userId,
        this.courseId,
        this.day,
        this.time,
        this.startDate,
        this.endDate,
        this.attendanceNumber,
        this.absenceNumber,
        this.updatedAt,
       });

  UserAttendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    courseId = json['course_id'];
    day = json['day'];
    time = json['time'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    attendanceNumber = json['attendance_number'];
    absenceNumber = json['absence_number'];
    updatedAt = json['updated_at'];
    studentModel = json['user'] != null ?  StudentModel.fromJson(json['user']) : null;
  }


}