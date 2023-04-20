import 'package:educational_center/data/models/subject_model.dart';

class TeacherModel {
  int? id;
  String? email;
  String? phone;
  String? birthdate;
  String? username;
  String? school;
  String? password;
  String? about;
  int? rate;
  String? image;
  String? createdAt;
  String? updatedAt;
  List<SubjectModel>? subject;

  TeacherModel(
      {this.id,
      this.email,
      this.phone,
      this.birthdate,
      this.username,
      this.school,
      this.password,
      this.about,
      this.image,
      this.createdAt,
      this.updatedAt,
        this.rate,
      this.subject});

  TeacherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phone = json['phone'] ??'';
    birthdate = json['birthdate'];
    username = json['username'];
    school = json['school'];
    password = json['password'];
    about = json['about'];
    image = json['image_url'];
    rate = json['rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subject = json['subjects'] != null
        ? List<SubjectModel>.from(
            (json['subjects'] as List).map(
              (e) => SubjectModel.fromJson(e),
            ),
          )
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['email'] = email;
    data['phone'] = phone;
    data['birthdate'] = birthdate;
    data['username'] = username;
    data['school'] = school;
    data['password'] = password;
    data['about'] = about;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
