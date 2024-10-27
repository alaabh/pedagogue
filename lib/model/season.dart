import 'package:pedagogue/model/base_model.dart';
import 'package:pedagogue/utils/json_utils.dart';

class Season extends BaseModel {
  String? name;
  String? description;
  int? userId;

  Season({
    int? id,
    this.name,
    this.description,
    this.userId,
  }) {
    this.id = id;
  }

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      id: JsonUtils.attribute(json['id']),
      name: JsonUtils.attribute(json['name']),
      description: JsonUtils.attribute(json['description']),
      userId: JsonUtils.attribute(json['user_id']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'user_id': userId,
    };
  }
}
