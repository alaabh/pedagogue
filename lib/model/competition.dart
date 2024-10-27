import 'package:pedagogue/model/base_model.dart';
import 'package:pedagogue/utils/json_utils.dart';

class Competition extends BaseModel {
  String? name;
  String? description;

  @override
  String get mainAttribute => name ?? '';

  Competition({
    int? id,
    this.name,
    this.description,
  }) {
    this.id = id;
  }

  factory Competition.fromJson(Map<String, dynamic> json) {
    return Competition(
      id: JsonUtils.attribute(json['id']),
      name: JsonUtils.attribute(json['name']),
      description: JsonUtils.attribute(json['description']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
