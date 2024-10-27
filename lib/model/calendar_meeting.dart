import 'package:pedagogue/model/base_model.dart';
import 'package:pedagogue/utils/json_utils.dart';

class CalendarMeeting extends BaseModel {
  String? name;
  String? description;
  DateTime? dateTime;
  String? place;
  int? userId;

  CalendarMeeting({
    int? id,
    this.name,
    this.description,
    this.dateTime,
    this.place,
    this.userId,
  }) {
    this.id = id;
  }

  factory CalendarMeeting.fromJson(Map<String, dynamic> json) {
    final date = JsonUtils.dateFromString(json['date']);
    final time = JsonUtils.timeOfDayFromString(json['time']);
    final dateTime = date?.copyWith(hour: time?.hour, minute: time?.minute);

    return CalendarMeeting(
      id: JsonUtils.attribute(json['id']),
      name: JsonUtils.attribute(json['name']),
      description: JsonUtils.attribute(json['description']),
      dateTime: dateTime,
      place: JsonUtils.attribute(json['place']),
      userId: JsonUtils.attribute(json['user_id']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'date': JsonUtils.toStringDate(dateTime),
      'place': place,
      'time': JsonUtils.toStringTime(dateTime),
      'user_id': userId,
    };
  }
}
