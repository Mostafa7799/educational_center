class QuizModel {
  int? id;
  int? courseId;
  String? date;
  String? startTime;
  String? endTime;
  dynamic totalGrade;
  String? details;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<UserGrade>? userGrade;

  QuizModel(
      {this.id,
        this.courseId,
        this.date,
        this.startTime,
        this.endTime,
        this.totalGrade,
        this.details,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.userGrade,
        });

  QuizModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id']??'';
    date = json['date']??'';
    startTime = json['start_time']??'';
    endTime = json['end_time']??'';
    totalGrade = json['total_grade'];
    details = json['details']??'';
    status = json['status'].toString();
    createdAt = json['created_at']??'';
    updatedAt = json['updated_at']??'';
    userGrade = json['user_grade'] != null
        ? List<UserGrade>.from(
      (json['user_grade'] as List).map(
            (e) => UserGrade.fromJson(e),
      ),
    )
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['course_id'] = courseId;
    data['date'] = date;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['total_grade'] = totalGrade;
    data['details'] = details;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
class UserGrade {
  int? id;
  int? quizId;
  int? userId;
  dynamic userGrade;
  String? createdAt;
  String? updatedAt;

  UserGrade(
      {this.id,
        this.quizId,
        this.userId,
        this.userGrade,
        this.createdAt,
        this.updatedAt});

  UserGrade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quizId = json['quiz_id'];
    userId = json['user_id'];
    userGrade = json['user_grade'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}
