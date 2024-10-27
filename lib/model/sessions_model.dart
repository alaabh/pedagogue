import '../utils/json_utils.dart';
import 'base_model.dart';

class Sessions extends BaseModel {
  final int? id;
  final dynamic name;
  final dynamic rating;
  final dynamic date;
  final dynamic userId;
  final dynamic theme;
  final dynamic theme_2;
  final dynamic game_stage;
  final dynamic categories;

  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic exercice_id;
  final dynamic exercices;

  Sessions({
    this.id,
    this.name,
    this.rating,
    this.date,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.theme_2,
    this.game_stage,
    this.exercice_id,
    this.categories,
    this.theme,
    this.exercices,
  });

  factory Sessions.fromJson(Map<String, dynamic> json) {
    return Sessions(
      id: json['id'],
      name: json['name'],
      rating: json['rating'],
      date: json['date'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      theme: json['theme'],
      theme_2: json['theme_2'],
      game_stage: json['game_stage'],
      categories: json['categories'],
      exercice_id: json['exercice_id'],
      exercices: JsonUtils.attribute(json['exercices']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'rating': rating,
      'date': date,
      'user_id': userId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'theme': theme,
      'theme_2': theme_2,
      'game_stage': game_stage,
      'exercice_id': exercice_id,
      'categories': categories
    };
  }
}

class Exercice {
  final int? id;
  final String? name;
  final int? rating;
  // Include other fields as necessary

  Exercice({
    this.id,
    this.name,
    this.rating,
    // Initialize other fields here
  });

  factory Exercice.fromJson(Map<String, dynamic> json) {
    return Exercice(
      id: json['id'],
      name: json['name'],
      rating: json['rating'],
      // Parse other fields here
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'rating': rating,
      // Convert other fields to JSON here
    };
  }
}
