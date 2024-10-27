import 'package:pedagogue/model/base_model.dart';
import 'package:pedagogue/utils/json_utils.dart';

class Coaching extends BaseModel {
  String? name;
  String? place;
  int? rating;
  String? theme;
  String? theme2;
  String? gameStage;
  DateTime? dateTime;
  String? sessionId;
  int? userId;
  List<dynamic>? sessions;

  Coaching({
    int? id,
    this.name,
    this.place,
    this.rating,
    this.theme,
    this.theme2,
    this.gameStage,
    this.dateTime,
    this.sessionId,
    this.userId,
    this.sessions,
  }) {
    this.id = id;
  }

  factory Coaching.fromJson(Map<String, dynamic> json) {
    final date = JsonUtils.dateFromString(json['date']);
    final time = JsonUtils.timeOfDayFromString(json['time']);
    final dateTime = date?.copyWith(hour: time?.hour, minute: time?.minute);

    return Coaching(
      id: JsonUtils.attribute(json['id']),
      name: JsonUtils.attribute(json['name']),
      place: JsonUtils.attribute(json['place']),
      rating: JsonUtils.attribute(json['rating']),
      theme: JsonUtils.attribute(json['theme']),
      theme2: JsonUtils.attribute(json['theme_2']),
      gameStage: JsonUtils.attribute(json['game_stage']),
      dateTime: dateTime,
      sessionId: JsonUtils.attribute(json['session_id']),
      userId: JsonUtils.attribute(json['user_id']),
      sessions: JsonUtils.attribute(json['sessions']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'place': place,
      'rating': rating,
      'theme': theme,
      'theme_2': theme2,
      'game_stage': gameStage,
      'date': JsonUtils.toStringDate(dateTime),
      'time': JsonUtils.toStringTime(dateTime),
      'session_id': sessionId,
      'user_id': userId,
      'sessions': sessions,
    };
  }
}
