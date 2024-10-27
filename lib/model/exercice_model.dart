import 'base_model.dart';

class Exercise extends BaseModel {
  final int? id;
  final dynamic? name;
  final dynamic? rating;
  final dynamic? pedagogy;
  final dynamic? gameStage;
  final dynamic? part;
  final dynamic? theme;
  final dynamic? categories;
  final dynamic? intensity;
  final dynamic? workTime;
  final dynamic? totalDuration;
  final dynamic? numberOfSeries;
  final dynamic? numberOfRepetitions;
  final dynamic? repos;
  final dynamic? image;
  final dynamic? dimension;
  final dynamic? instruction;
  final dynamic? expected;
  final dynamic? duplicate;
  final dynamic? userId;
  final dynamic? deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  Exercise({
    this.id,
    this.name,
    this.rating,
    this.userId,
    this.createdAt,
    this.updatedAt,
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
    this.deletedAt,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id']as int?,
      name: json['name']as dynamic?,
      rating: json['rating']as dynamic?,
      pedagogy: json['pedagogy']as dynamic?,
      gameStage: json['game_stage']as dynamic?,
      part: json['part']as dynamic?,
      theme: json['theme']as dynamic?,
      categories: json['categories']as dynamic?,
      intensity: json['intensity']as dynamic?,
      workTime: json['work_time']as dynamic?,
      totalDuration: json['total_duration']as dynamic?,
      numberOfSeries: json['number_of_series']as dynamic?,
      numberOfRepetitions: json['number_of_repetitions']as dynamic?,
      repos: json['repos']as dynamic?,
      image: json['image']as dynamic?,
      dimension: json['dimension']as dynamic?,
      instruction: json['instruction']as dynamic?,
      expected: json['expected']as dynamic?,
      duplicate: json['duplicate']as dynamic?,
      userId: json['user_id']as dynamic?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
