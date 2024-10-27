import '../utils/json_utils.dart';

class PlayerTerrain {
  Team? team1;
  Team? team2;

  PlayerTerrain({
    this.team1,
    this.team2,
  }) {}

  factory PlayerTerrain.fromJson(Map<String, dynamic> json) {
    return PlayerTerrain(
      team1: json['team_1'] != null ? Team.fromJson(json['team_1']) : null,
      team2: json['team_2'] != null ? Team.fromJson(json['team_2']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'team_1': team1,
      'team_2': team2,
    };
  }
}

class Team {
  String? name;
  String? category;
  int? userId;
  List<dynamic>? player;

  Team({
    int? id,
    this.name,
    this.category,
    this.userId,
    this.player,
  }) {}

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: JsonUtils.attribute(json['id']),
      name: JsonUtils.attribute(json['name']),
      category: JsonUtils.attribute(json['categories']),
      userId: JsonUtils.attribute(json['user_id']),
      player: JsonUtils.attribute(json['player']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'categories': category,
      'user_id': userId,
      'player': player,
    };
  }
}
