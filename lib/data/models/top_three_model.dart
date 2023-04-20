class TopThreeModel {
  int? userId;
  int? grade;
  User? user;

  TopThreeModel({this.userId, this.grade, this.user});

  TopThreeModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    grade = json['grade'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
  }
}

class User {
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
  String? imageUrl;

  User(
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
        this.updatedAt,
        this.imageUrl});

  User.fromJson(Map<String, dynamic> json) {
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
    imageUrl = json['image_url'];
  }

}