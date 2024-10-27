import 'package:pedagogue/model/base_model.dart';
import 'package:pedagogue/utils/json_utils.dart';

class SessionModel extends BaseModel {
  SessionModel({
    int? id,
  }) {
    this.id = id;
  }

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      id: JsonUtils.attribute(json['id']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
