import 'base_model.dart';

class ObservationsList extends BaseModel {
  final List<Observation> data;

  ObservationsList({required this.data});

  factory ObservationsList.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Observation> observationsList = list.map((i) => Observation.fromJson(i)).toList();
    return ObservationsList(data: observationsList);
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((v) => v.toJson()).toList(),
    };
  }
}

class Observation extends BaseModel{
  final int id;
  final String? value1;
  final int? userId;
  final String? createdAt;
  final String? updatedAt;

  Observation({
    required this.id,
    this.value1,
     this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory Observation.fromJson(Map<String, dynamic> json) {
    return Observation(
      id: json['id'],
      value1: json['value1'] as String?,
      userId: json['user_id'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'value1': value1,
      'user_id': userId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}