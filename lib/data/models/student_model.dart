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
    image = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}