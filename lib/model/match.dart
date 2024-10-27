import 'package:pedagogue/model/base_model.dart';
import 'package:pedagogue/utils/json_utils.dart';

class Match extends BaseModel {
  String? opponent;
  String? resOut;
  String? goRet;
  String? place;
  String? arbitrator;
  String? assistant1;
  String? assistant2;
  String? file;
  DateTime? dateTime;
  int? competitionId;
  int? userId;

  Match({
    int? id,
    this.opponent,
    this.resOut,
    this.goRet,
    this.place,
    this.arbitrator,
    this.assistant1,
    this.assistant2,
    this.file,
    this.dateTime,
    this.competitionId,
    this.userId,
  }) {
    this.id = id;
  }

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      id: JsonUtils.attribute(json['id']),
      opponent: JsonUtils.attribute(json['opponent']),
      resOut: JsonUtils.attribute(json['res_out']),
      goRet: JsonUtils.attribute(json['go_ret']),
      place: JsonUtils.attribute(json['place']),
      arbitrator: JsonUtils.attribute(json['arbitrator']),
      assistant1: JsonUtils.attribute(json['assistant_1']),
      assistant2: JsonUtils.attribute(json['assistant_2']),
      file: JsonUtils.attribute(json['file']),
      dateTime: JsonUtils.dateFromString(json['date']),
      competitionId: JsonUtils.attribute(json['competition_id']),
      userId: JsonUtils.attribute(json['user_id']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'opponent': opponent,
      'res_out': resOut,
      'go_ret': goRet,
      'place': place,
      'arbitrator': arbitrator,
      'assistant_1': assistant1,
      'assistant_2': assistant2,
      'file': file,
      'date': JsonUtils.toStringDate(dateTime),
      'competition_id': competitionId,
      'user_id': userId,
    };
  }
}
