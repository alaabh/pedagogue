import 'package:pedagogue/model/base_model.dart';

class BilanDebutCycle extends BaseModel {
  dynamic value1;
  dynamic value2;
  dynamic value3;
  dynamic value4;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  BilanDebutCycle({
    int? id,
    this.value1,
    this.value2,
    this.value3,
    this.value4,
     this.userId,
    this.createdAt,
    this.updatedAt,
  }) {
    this.id = id;
  }

  factory BilanDebutCycle.fromJson(Map<String, dynamic> json) {
    return BilanDebutCycle(
      id: json['id'],
      value1: json['value1'],
      value2: json['value2'],
      value3: json['value3'],
      value4: json['value4'],
      userId: json['user_id'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'value1': value1,
      'value2': value2,
      'value3': value3,
      'value4': value4,
      'user_id': userId,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
