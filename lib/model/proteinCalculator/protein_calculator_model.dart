import 'package:pedagogue/model/base_model.dart';

class ProteinCalculatorModel {
  String? heightTens;
  String? heightUnits;
  String? weight;
  String? age;
  String? sex;
  String? activity;
  String? goal;
  String? heightSystem;
  String? weightSystem;
  dynamic proteinIntake;

  ProteinCalculatorModel({
    this.heightTens,
    this.heightUnits,
    this.weight,
    this.age,
    this.sex,
    this.activity,
    this.goal,
    this.heightSystem,
    this.weightSystem,
    this.proteinIntake,
  });

  factory ProteinCalculatorModel.fromJson(Map<String, dynamic> json) {
    return ProteinCalculatorModel(
      /*  heightTens: json['heightTens'],
      heightUnits: json['heightUnits'],
      weight: json['weight'],
      age: json['age'],
      sex: json['sex'],
      activity: json['activity'],
      goal: json['goal'],
      heightSystem: json['heightSystem'],
      weightSystem: json['weightSystem'], */
      proteinIntake: json['data']['proteinIntake'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'heightTens': heightTens,
      'heightUnits': heightUnits,
      'weight': weight,
      'age': age,
      'sex': sex,
      'activity': activity,
      'goal': goal,
      'heightSystem': heightSystem,
      'weightSystem': weightSystem,
    };
  }
}
