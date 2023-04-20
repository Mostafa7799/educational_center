import 'package:educational_center/data/models/course_model.dart';

class ActiveHomework {
  int? id;
  int? courseId;
  String? startDate;
  String? endDate;
  String? src;
  String? createdAt;
  String? updatedAt;
  CourseModel? course;

  ActiveHomework({this.id,
    this.courseId,
    this.startDate,
    this.endDate,
    this.src,
    this.createdAt,
    this.updatedAt,
    this.course,
  });

  ActiveHomework.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    src = json['src'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    course =
    json['course'] != null ?  CourseModel.fromJson(json['course']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['course_id'] = courseId;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['src'] = src;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    // if (course != null) {
    //   data['course'] = course!.toJson();
    // }
    return data;
  }
}