import 'base_model.dart';

class BibliothequeExercicee  extends BaseModel{

  final int? id;
  final String? name;
  final int? rating;
  final String? pedagogy;
  final String? gameStage;
  final String? part;
  final String? theme;
  final String? categories;
  final String? intensity;
  final int? workTime;
  final int? totalDuration;
  final int? numberOfSeries;
  final int? numberOfRepetitions;
  final int? repos;
  final String? image; // Nullable since it can be null in JSON
  final String? dimension;
  final String? instruction;
  final String? expected;
  final String? duplicate;
  final int? userId;
  final String? deletedAt; // Nullable since it can be null in JSON
  final String? createdAt;
  final String? updatedAt;

  BibliothequeExercicee({
     this.id,
     this.name,
     this.rating,
     this.pedagogy,
     this.gameStage,
     this.part,
     this.theme,
     this.categories,
     this.intensity,
     this.workTime,
     this.totalDuration,
     this.numberOfSeries,
     this.numberOfRepetitions,
     this.repos,
    this.image,
     this.dimension,
     this.instruction,
     this.expected,
     this.duplicate,
     this.userId,
    this.deletedAt,
     this.createdAt,
     this.updatedAt,
  });

  factory BibliothequeExercicee.fromJson(Map<String, dynamic> json) => BibliothequeExercicee(
    id: json['id'],
    name: json['name'],
    rating: json['rating'],
    pedagogy: json['pedagogy'],
    gameStage: json['game_stage'],
    part: json['part'],
    theme: json['theme'],
    categories: json['categories'],
    intensity: json['intensity'],
    workTime: json['work_time'],
    totalDuration: json['total_duration'],
    numberOfSeries: json['number_of_series'],
    numberOfRepetitions: json['number_of_repetitions'],
    repos: json['repos'],
    image: json['image'],
    dimension: json['dimension'],
    instruction: json['instruction'],
    expected: json['expected'],
    duplicate: json['duplicate'],
    userId: json['user_id'],
    deletedAt: json['deleted_at'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'rating': rating,
    'pedagogy': pedagogy,
    'game_stage': gameStage,
    'part': part,
    'theme': theme,
    'categories': categories,
    'intensity': intensity,
    'work_time': workTime,
    'total_duration': totalDuration,
    'number_of_series': numberOfSeries,
    'number_of_repetitions': numberOfRepetitions,
    'repos': repos,
    'image': image,
    'dimension': dimension,
    'instruction': instruction,
    'expected': expected,
    'duplicate': duplicate,
    'user_id': userId,
    'deleted_at': deletedAt,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}
