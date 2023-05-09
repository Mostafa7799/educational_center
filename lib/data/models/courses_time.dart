import 'package:educational_center/data/models/course_model.dart';

class CoursesTime{
  List<CourseModel>? sunday;
  List<CourseModel>? monday;
  List<CourseModel>? tuesday;
  List<CourseModel>? wednesday;
  List<CourseModel>? thursday;
  List<CourseModel>? saturday;
  List<CourseModel>? friday;
  String? today;
  List<CourseModel>? todaycourses;

  CoursesTime(
      {this.sunday,
        this.monday,
        this.tuesday,
        this.wednesday,
        this.thursday,
        this.saturday,
        this.friday,
        this.today,
        this.todaycourses});

  CoursesTime.fromJson(Map<String, dynamic> json) {
    if (json['sunday'] != null) {
      sunday = [];
      json['sunday'].forEach((v) {
        sunday!.add( CourseModel.fromJson(v));
      });
    }
    if (json['monday'] != null) {
      monday = [];
      json['monday'].forEach((v) {
        monday!.add( CourseModel.fromJson(v));
      });
    }
    if (json['tuesday'] != null) {
      tuesday = <CourseModel>[];
      json['tuesday'].forEach((v) {
        tuesday!.add( CourseModel.fromJson(v));
      });
    }
    if (json['wednesday'] != null) {
      wednesday = <CourseModel>[];
      json['wednesday'].forEach((v) {
        wednesday!.add( CourseModel.fromJson(v));
      });
    }
    if (json['thursday'] != null) {
      thursday = [];
      json['thursday'].forEach((v) {
        thursday!.add( CourseModel.fromJson(v));
      });
    }
    if (json['saturday'] != null) {
      saturday = [];
      json['saturday'].forEach((v) {
        saturday!.add( CourseModel.fromJson(v));
      });
    }
    if (json['friday'] != null) {
      friday = <CourseModel>[];
      json['friday'].forEach((v) {
        friday!.add( CourseModel.fromJson(v));
      });
    }
    today = json['today'];
    if (json['todaycourses'] != null) {
      todaycourses = <CourseModel>[];
      json['todaycourses'].forEach((v) {
        todaycourses!.add( CourseModel.fromJson(v));
      });
    }
  }
}