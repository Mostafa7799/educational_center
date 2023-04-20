import 'package:educational_center/data/models/teacher_model.dart';
import 'package:flutter/material.dart';

import 'matrial_model.dart';

class SubjectModel {
  int? id;
  String? name;
  int? levelId;
  int? teacherId;
  String? details;
  String? createdAt;
  String? updatedAt;
  dynamic teacher;
  dynamic matrial;

  SubjectModel(
      {this.id,
        this.name,
        this.levelId,
        this.teacherId,
        this.details,
        this.createdAt,
        this.updatedAt,
        this.teacher,
        this.matrial
        });

  SubjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 'none';
    name = json['name'] ?? 'none';
    levelId = json['level_id'] ?? 'none';
    teacherId = json['teacher_id'] ?? 'none';
    details = json['details'] ?? 'none';
    createdAt = json['created_at'] ?? 'none';
    updatedAt = json['updated_at'] ?? 'none';
    teacher =
    json['teacher'] != null ?  TeacherModel.fromJson(json['teacher']) : null;
    if (json['matterials'] != null) {
      matrial = <MaterialModel>[];
      json['matterials'].forEach((v) {
        matrial!.add( MaterialModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['level_id'] = levelId;
    data['teacher_id'] = teacherId;
    data['details'] = details;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (teacher != null) {
      data['teacher'] = teacher!.toJson();
    }

    return data;
  }
}