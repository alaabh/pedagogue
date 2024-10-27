import 'package:pedagogue/model/base_model.dart';

import '../utils/json_utils.dart';

class Coaching1 extends BaseModel {
  final int? id;
  final dynamic name;
  final dynamic place;
  final dynamic time;
  final dynamic rating;
  final dynamic theme;
  final dynamic theme_2;
  final dynamic game_stage;
  final dynamic date;
  final dynamic userId;
  final dynamic session_id;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic sessions;

  Coaching1({
    this.id,
    this.name,
    this.place,
    this.time,
    this.rating,
    this.theme,
    this.theme_2,
    this.game_stage,
    this.date,
    this.userId,
    this.session_id,
    this.createdAt,
    this.updatedAt,
    this.sessions,
  });

  factory Coaching1.fromJson(Map<String, dynamic> json) {
    return Coaching1(
      id: json['id'],
      name: json['name'],
      place: json['place'],
      time: json['time'],
      rating: json['rating'],
      theme: json['theme'],
      theme_2: json['theme_2'],
      game_stage: json['game_stage'],
      date: json['date'],
      userId: json['user_id'],
      session_id: json['session_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      sessions: JsonUtils.attribute(json['sessions']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'place': place,
      'time': time,
      'rating': rating,
      'theme': theme,
      'theme_2': theme_2,
      'game_stage': game_stage,
      'date': date,
      'user_id': userId,
      'session_id': session_id,
    };
  }
}
