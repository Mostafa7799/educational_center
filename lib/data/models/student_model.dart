class StudentModel {
  int? id;
  String? email;
  String? phone;
  String? birthdate;
  String? username;
  String? school;
  String? emailVerifiedAt;
  int? levelId;
  String? image;
  String? createdAt;
  String? updatedAt;

  StudentModel(
      {this.id,
        this.email,
        this.phone,
        this.birthdate,
        this.username,
        this.school,
        this.emailVerifiedAt,
        this.levelId,
        this.image,
        this.createdAt,
        this.updatedAt});

  StudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    birthdate = json['birthdate'];
    username = json['username'];
    school = json['school'];
    emailVerifiedAt = json['email_verified_at'];
    levelId = json['level_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['email'] = email;
    data['phone'] = phone;
    data['birthdate'] = birthdate;
    data['username'] = username;
    data['school'] = school;
    data['email_verified_at'] = emailVerifiedAt;
    data['level_id'] = levelId;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}