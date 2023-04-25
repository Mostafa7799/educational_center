class LevelsModel {
  int? id;
  String? levelName;
  String? createdAt;
  String? updatedAt;

  LevelsModel({this.id, this.levelName, this.createdAt, this.updatedAt});

  LevelsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    levelName = json['level_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}