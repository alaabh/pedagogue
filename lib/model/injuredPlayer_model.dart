import '../utils/json_utils.dart';
import 'Joueur_model.dart';
import 'base_model.dart';

class PlayerInjured extends BaseModel {
  int? id;
  String? injury_en;
  String? injury_ar;
  String? injury_fr;
  DateTime? endDateInjury;
  DateTime? startDateInjury;
  String? image;
  int? playerId;
  int? userId;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  Player? player;

  PlayerInjured({
    this.id,
    this.injury_en,
    this.injury_ar,
    this.injury_fr,
    this.endDateInjury,
    this.startDateInjury,
    this.image,
    this.playerId,
    this.userId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.player,
  });

  factory PlayerInjured.fromJson(Map<String, dynamic> json) {
    return PlayerInjured(
      id: JsonUtils.attribute(json['id']),
      injury_en: JsonUtils.attribute(json['injury_en']),
      injury_ar: JsonUtils.attribute(json['injury_ar']),
      injury_fr: JsonUtils.attribute(json['injury_fr']),
      endDateInjury:
          JsonUtils.attribute(DateTime.parse(json['end_date_injury'])),
      startDateInjury: DateTime.parse(json['start_date_injury']),
      image: JsonUtils.attribute(json['image']),
      playerId: JsonUtils.attribute(json['player_id']),
      userId: JsonUtils.attribute(json['user_id']),
      player: Player.fromJson(json['player']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'injury_en': injury_en,
      'injury_ar': injury_ar,
      'injury_fr': injury_fr,
      'end_date_injury': endDateInjury,
      'start_date_injury': startDateInjury,
      'image': image,
      'player_id': playerId,
      'user_id': userId,
      'deleted_at': deletedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'player': player,
    };
  }
}
