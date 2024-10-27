import 'base_model.dart';

class BilanSeance  extends BaseModel {
  final int id;
  final String? value1;
  final String? value2;
  final String? value3;
  final String? value4;
  final String? value5;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BilanSeance({
    required this.id,
    this.value1,
    this.value2,
    this.value3,
    this.value4,
    this.value5,
     this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory BilanSeance.fromJson(Map<String, dynamic> json) {
    return BilanSeance(
      id: json['id'],
      value1: json['value1'],
      value2: json['value2'],
      value3: json['value3'],
      value4: json['value4'],
      value5: json['value5'],
      userId: json['user_id'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'value1': value1,
      'value2': value2,
      'value3': value3,
      'value4': value4,
      'value5': value5,
      'user_id': userId,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
