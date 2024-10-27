import 'package:pedagogue/model/base_model.dart';

class BilanFinCycle extends BaseModel {
  dynamic value1;

  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  BilanFinCycle({
    int? id,
    this.value1,
  
     this.userId,
    this.createdAt,
    this.updatedAt,
  }) {
    this.id = id;
  }

  factory BilanFinCycle.fromJson(Map<String, dynamic> json) {
    return BilanFinCycle(
      id: json['id'],
      value1: json['value1'],
    
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
   
      'user_id': userId,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
