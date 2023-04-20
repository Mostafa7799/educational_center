class MessagesModel {
  int? id;
  int? courseId;
  String? text;
  String? createdAt;
  String? updatedAt;

  MessagesModel(
      {this.id,
        this.courseId,
        this.text,
        this.createdAt,
        this.updatedAt,
        });

  MessagesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    text = json['text'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['course_id'] = courseId;
    data['text'] = text;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
