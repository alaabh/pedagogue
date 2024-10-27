import 'package:pedagogue/model/season.dart';
import 'package:pedagogue/model/team.dart';
import 'Joueur_model.dart';
import 'base_model.dart';

class PlayerStarting extends BaseModel {
  final int? id;
  final int? playerId;
  final int? teamId;
  final int? seasonId;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Player? player;
  final Team? team;
  final Season? season;

  PlayerStarting({
    this.id,
    this.playerId,
    this.teamId,
    this.seasonId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.player, // The 'required' keyword is removed since it's already nullable.
    this.team,
    this.season,
  });

  factory PlayerStarting.fromJson(Map<String, dynamic> json) {
    return PlayerStarting(
      id: json['id'],
      playerId: json['player_id'],
      teamId: json['team_id'],
      seasonId: json['season_id'],
      userId: json['user_id'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      team: json['team'] != null ? Team.fromJson(json['team']) : null,
      season: json['season'] != null ? Season.fromJson(json['season']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'player_id': playerId,
      'team_id': teamId,
      'season_id': seasonId,
      'user_id': userId,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'team': team?.toJson(),
      'season': season?.toJson(),
    };
  }
}
