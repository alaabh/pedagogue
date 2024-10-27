import 'package:pedagogue/model/base_model.dart';
import 'package:pedagogue/utils/json_utils.dart';

class Team extends BaseModel {
  String? name;
  String? category;
  int? userId;
  List<dynamic>? playerStarting;

  Team({
    int? id,
    this.name,
    this.category,
    this.userId,
    this.playerStarting,
  }) {
    this.id = id;
  }

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: JsonUtils.attribute(json['id']),
      name: JsonUtils.attribute(json['name']),
      category: JsonUtils.attribute(json['categories']),
      userId: JsonUtils.attribute(json['user_id']),
      playerStarting: JsonUtils.attribute(json['plyer_starting']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'categories': category,
      'user_id': userId,
      'plyer_starting': playerStarting,
    };
  }
}
