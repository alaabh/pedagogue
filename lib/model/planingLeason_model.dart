import 'dart:io';

import 'package:pedagogue/model/base_model.dart';

class PlaningLeasonModel extends BaseModel {
  final String? theme;
  final String? cycle;
  final String? material;
  final String? Capacities1;
  final String? Description1;
  final File? Organization1;
  final String? Coaching1;
  final String? Duration1;
  final String? Capacities2;
  final String? Description2;
  final File? Organization2;
  final String? Coaching2;
  final String? Duration2;
  final String? Capacities3;
  final String? Description3;
  final File? Organization3;
  final String? Coaching3;
  final String? Duration3;
  final String? Capacities4;
  final String? Description4;
  final File? Organization4;
  final String? Coaching4;
  final String? Duration4;
  final String? team;
  final String? desicion;

  PlaningLeasonModel( {
    this.theme,
    this.cycle,
    this.material,
    this.Capacities1,
    this.Description1,
    this.Organization1,
    this.Coaching1,
    this.Duration1,
    this.Capacities2,
    this.Description2,
    this.Organization2,
    this.Coaching2,
    this.Duration2,
    this.Capacities3,
    this.Description3,
    this.Organization3,
    this.Coaching3,
    this.Duration3,
    this.Capacities4,
    this.Description4,
    this.Organization4,
    this.Coaching4,
    this.Duration4,
    this.team,
     this.desicion,
  });

  factory PlaningLeasonModel.fromJson(Map<String, dynamic> json) {
    return PlaningLeasonModel(
      theme: json['theme'],
      cycle: json['cycle'],
      material: json['material'],
      Capacities1: json['Capacities_1'],
      Description1: json['Description_1'],
      Organization1: json['Organization_1'],
      Coaching1: json['Coaching_1'],
      Duration1: json['Duration_1'],
      Capacities2: json['Capacities_2'],
      Description2: json['Description_2'],
      Organization2: json['Organization_2'],
      Coaching2: json['Coaching_2'],
      Duration2: json['Duration_2'],
      Capacities3: json['Capacities_3'],
      Description3: json['Description_3'],
      Organization3: json['Organization_3'],
      Coaching3: json['Coaching_3'],
      Duration3: json['Duration_3'],
      Capacities4: json['Capacities_4'],
      Description4: json['Description_4'],
      Organization4: json['Organization_4'],
      Coaching4: json['Coaching_4'],
      Duration4: json['Duration_4'],
      team: json['team'],
      desicion: json['desicion'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'theme': theme,
      'cycle': cycle,
      'material': material,
      'Capacities_1': Capacities1,
      'Description_1': Description1,
      'Organization_1': Organization1,
      'Coaching_1': Coaching1,
      'Duration_1': Duration1,
      'Capacities_2': Capacities2,
      'Description_2': Description2,
      'Organization_2': Organization2,
      'Coaching_2': Coaching2,
      'Duration_2': Duration2,
      'Capacities_3': Capacities3,
      'Description_3': Description3,
      'Organization_3': Organization3,
      'Coaching_3': Coaching3,
      'Duration_3': Duration3,
      'Capacities_4': Capacities4,
      'Description_4': Description4,
      'Organization_4': Organization4,
      'Coaching_4': Coaching4,
      'Duration_4': Duration4,
      'team': team,
      'desicion': desicion,
    };
  }
}
