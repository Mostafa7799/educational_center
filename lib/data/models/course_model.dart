import 'package:educational_center/data/models/subject_model.dart';
import 'package:educational_center/data/models/top_three_model.dart';

class CourseModel {
  int? id;
  String? details;
  int? subjectId;
  String? image;
  int? noOfStudents;
  int? noOfAvilables;
  String? firstDay;
  String? secondDay;
  String? firstDayTime;
  String? secondDayTime;
  String? time;
  String? startDate;
  String? endDate;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? firstDayTimeClock;
  String? today;
  String? secondDayTimeClock;
  bool? loggedUserHaveThisCourse;
  SubjectModel? subject;
  List<TopThreeModel>? topThree;
//"": " 08:00 AM - 10:00 AM",
//             "": " 10:00 AM - 12:00 AM",
  CourseModel(
      {this.id,
        this.details,
        this.subjectId,
        this.image,
        this.noOfStudents,
        this.noOfAvilables,
        this.firstDay,
        this.firstDayTime,
        this.secondDay,
        this.secondDayTime,
        this.time,
        this.startDate,
        this.endDate,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.loggedUserHaveThisCourse,
        this.subject,
        this.topThree,
        this.firstDayTimeClock,
        this.secondDayTimeClock,
        this.today
      });
  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    details = json['details'];
    subjectId = json['subject_id'];
    image = json['image'];
    today = json['today'];
    noOfStudents = json['no_of_students'];
    noOfAvilables = json['no_of_avilables'];
    firstDay = json['firstday'] ??'';
    firstDayTimeClock = json['firstdaytimeclock'] ??'';
    secondDayTimeClock = json['seconddaytimeclock'] ??'';
    firstDayTime = json['firstdaytime']??'';
    secondDay = json['secondday']??'';
    secondDayTime = json['seconddaytime']??'';
    time = json['time']??'';
    startDate = json['start_date']??'';
    endDate = json['end_date']??'';
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    loggedUserHaveThisCourse = json['logged_user_have_this_course'];
    subject =
    json['subject'] != null ?  SubjectModel.fromJson(json['subject']) : null;
    topThree = json['first_three_users'] != null
        ? List<TopThreeModel>.from(
      (json['first_three_users'] as List).map(
            (e) => TopThreeModel.fromJson(e),
      ),
    )
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['details'] = details;
    data['subject_id'] = subjectId;
    data['image'] = image;
    data['no_of_students'] = noOfStudents;
    data['no_of_avilables'] = noOfAvilables;
    data['firstday'] = firstDay ;
    data['firstdaytime'] = firstDayTime ;
    data['secondday']  = secondDay ;
    data['seconddaytime'] = secondDayTime;
    data['time'] = time;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['logged_user_have_this_course'] = loggedUserHaveThisCourse;
    if (subject != null) {
      data['subject'] = subject!.toJson();
    }
    return data;
  }
}
