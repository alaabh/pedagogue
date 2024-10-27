import 'package:pedagogue/model/base_model.dart';
import 'package:pedagogue/utils/json_utils.dart';

class Report extends BaseModel {
  String? match;
  String? yellowCard;
  String? redCard;
  String? scorer;
  String? assistantGoalscoring;
  String? score;
  String? goalsConceded;

  Report({
    int? id,
    this.match,
    this.yellowCard,
    this.redCard,
    this.scorer,
    this.assistantGoalscoring,
    this.score,
    this.goalsConceded,
  }) {
    this.id = id;
  }

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: JsonUtils.attribute(json['id']),
      match: JsonUtils.attribute(json['match']),
      yellowCard: JsonUtils.attribute(json['yellow_card']),
      redCard: JsonUtils.attribute(json['red_card']),
      scorer: JsonUtils.attribute(json['scorer']),
      assistantGoalscoring: JsonUtils.attribute(json['assistant_goalscoring']),
      score: JsonUtils.attribute(json['score']),
      goalsConceded: JsonUtils.attribute(json['goals_conceded']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'match': match,
      'yellow_card': yellowCard,
      'red_card': redCard,
      'scorer': scorer,
      'assistant_goalscoring': assistantGoalscoring,
      'score': score,
      'goals_conceded': goalsConceded,
    };
  }
}
