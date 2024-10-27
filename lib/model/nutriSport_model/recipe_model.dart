class Recipe {
  final dynamic id;
  final dynamic name;
  final dynamic introduction;
  final dynamic image;
  final dynamic dynamicroduction;
  final dynamic ingredients;
  final dynamic directions;
  final dynamic type;
  final dynamic prepare;
  final dynamic calories;
  final dynamic fat;
  final dynamic cholesterol;
  final dynamic sodium;
  final dynamic carbs;
  final dynamic fiber;
  final dynamic cook;
  final dynamic servings;
  final dynamic recipe;
  final dynamic time;
  final dynamic protein;
  final dynamic createdAt;
  final dynamic updatedAt;

  Recipe({
    required this.id,
    required this.name,
    required this.introduction,
    this.image,
    this.dynamicroduction,
    required this.ingredients,
    required this.directions,
    required this.type,
    this.prepare,
    this.calories,
    this.fat,
    this.cholesterol,
    this.sodium,
    this.carbs,
    this.fiber,
    this.cook,
    this.servings,
    this.recipe,
    this.time,
    this.protein,
    this.createdAt,
    this.updatedAt,
  });

  factory Recipe.fromJson(Map<dynamic, dynamic> json) {
    return Recipe(
      id: json['id'],
      introduction: json['introduction'],
      name: json['name'],
      image: json['image'],
      dynamicroduction: json['dynamicroduction'],
      ingredients: json['ingredients'],
      directions: json['directions'],
      type: json['type'],
      prepare: json['prepare'],
      calories: json['calories'],
      fat: json['fat'],
      cholesterol: json['cholesterol'],
      sodium: json['sodium'],
      carbs: json['carbs'],
      fiber: json['fiber'],
      cook: json['cook'],
      servings: json['servings'],
      recipe: json['recipe'],
      time: json['time'],
      protein: json['protein'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'introduction': introduction,
      'image': image,
      'dynamicroduction': dynamicroduction,
      'ingredients': ingredients,
      'directions': directions,
      'type': type,
      'prepare': prepare,
      'calories': calories,
      'fat': fat,
      'cholesterol': cholesterol,
      'sodium': sodium,
      'carbs': carbs,
      'fiber': fiber,
      'cook': cook,
      'servings': servings,
      'recipe': recipe,
      'time': time,
      'protein': protein,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}