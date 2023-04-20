class MaterialModel {
  int? id;
  int? subjectId;
  String? name;
  String? details;
  String? src;
  String? createdAt;
  String? updatedAt;

  MaterialModel({
    this.id,
    this.subjectId,
    this.name,
    this.details,
    this.src,
    this.createdAt,
    this.updatedAt,
  });

  MaterialModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectId = json['subject_id'];
    name = json['name'];
    details = json['details'];
    src = json['src'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
