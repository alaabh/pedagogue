import 'package:pedagogue/model/base_model.dart';

class CaloriesModel {
  final Nutrients? nutrients;
  final List<Meal>? meals;

  CaloriesModel({this.nutrients, this.meals});

  factory CaloriesModel.fromJson(Map<String, dynamic> json) {
    return CaloriesModel(
      nutrients: Nutrients.fromJson(json['nutrients']),
      meals: (json['meals'] as List).map((i) => Meal.fromJson(i)).toList(),
    );
  }
}

class Nutrients {
  final dynamic? calories;
  final dynamic? protein;
  final dynamic? fat;
  final dynamic? carbohydrates;

  Nutrients({
    this.calories,
    this.protein,
    this.fat,
    this.carbohydrates,
  });

  factory Nutrients.fromJson(Map<String, dynamic> json) {
    return Nutrients(
      calories: json['calories'],
      protein: json['protein'],
      fat: json['fat'],
      carbohydrates: json['carbohydrates'],
    );
  }
}

class Meal {
  final int? id;
  final String? title;
  final String? image;

  Meal({this.id, this.title, this.image});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}
