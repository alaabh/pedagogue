import 'Joueur_model.dart';
import 'base_model.dart';

class PlayerSuspended extends BaseModel {
  final int? id;
  final String? suspension_en;
  final String? suspension_fr;
  final String? suspension_ar;
  final String? comment;
  final DateTime? startDateSuspension;
  final DateTime? endDateSuspension;
  final int? playerId;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Player? player;

  PlayerSuspended({
    this.id,
    this.suspension_en,
    this.suspension_fr,
    this.suspension_ar,
    this.comment,
    this.startDateSuspension,
    this.endDateSuspension,
    this.playerId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.player,
  });

  factory PlayerSuspended.fromJson(Map<String, dynamic> json) {
    return PlayerSuspended(
      id: json['id'],
      suspension_en: json['suspension_en'],
      suspension_ar: json['suspension_ar'],
      suspension_fr: json['suspension_fr'],
      comment: json['comment'],
      startDateSuspension: json['start_date_suspension'] != null
          ? DateTime.parse(json['start_date_suspension'])
          : null,
      endDateSuspension: json['end_date_suspension'] != null
          ? DateTime.parse(json['end_date_suspension'])
          : null,
      playerId: json['player_id'],
      userId: json['user_id'],
      player: Player.fromJson(json['player']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'suspension_en': suspension_en,
      'suspension_fr': suspension_fr,
      'suspension_ar': suspension_ar,
      'comment': comment,
      'start_date_suspension': startDateSuspension?.toIso8601String(),
      'end_date_suspension': endDateSuspension?.toIso8601String(),
      'player_id': playerId,
      'user_id': userId,
      'player': player,
    };
  }
}
