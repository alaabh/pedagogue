import 'Joueur_model.dart';
import 'base_model.dart';

class JoueurPresence extends BaseModel {
  final int? id;
  final String? type_en;
  final String? type_fr;
  final String? type_ar;
  final DateTime? endDatePresence;
  final DateTime? startDatePresence;
  final int? playerId;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Player? player;

  JoueurPresence({
    required this.id,
    this.type_en,
    this.type_fr,
    this.type_ar,
    this.endDatePresence,
    this.startDatePresence,
     this.playerId,
     this.userId,
     this.createdAt,
     this.updatedAt,
     this.player,
  });

  factory JoueurPresence.fromJson(Map<String, dynamic> json) {
    return JoueurPresence(
      id: json['id'],
      type_en: json['type_en'],
      type_fr: json['type_fr'],
      type_ar: json['type_ar'],
      endDatePresence: json['end_date_presence'] != null
          ? DateTime.parse(json['end_date_presence'])
          : null,
      startDatePresence: json['start_date_presence'] != null
          ? DateTime.parse(json['start_date_presence'])
          : null,
      playerId: json['player_id'],
      userId: json['user_id'],
   
      player: Player.fromJson(json['player']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type_en': type_en,
      'type_fr': type_fr,
      'type_ar': type_ar,
      'end_date_presence': endDatePresence?.toIso8601String(),
      'start_date_presence': startDatePresence?.toIso8601String(),
      'player_id': playerId,
      'user_id': userId,
   
      'player': player?.toJson(),
    };
  }
}
