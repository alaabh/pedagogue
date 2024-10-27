import 'package:pedagogue/model/base_model.dart';

class Emploi extends BaseModel {
  String? lundi1;
  String? lundi2;
  String? lundi3;
  String? lundi4;
  String? lundi5;
  String? lundi6;
  String? lundi7;
  String? lundi8;
  String? mardi1;
  String? mardi2;
  String? mardi3;
  String? mardi4;
  String? mardi5;
  String? mardi6;
  String? mardi7;
  String? mardi8;
  String? mercredi1;
  String? mercredi2;
  String? mercredi3;
  String? mercredi4;
  String? mercredi5;
  String? mercredi6;
  String? mercredi7;
  String? mercredi8;
  String? jeudi1;
  String? jeudi2;
  String? jeudi3;
  String? jeudi4;
  String? jeudi5;
  String? jeudi6;
  String? jeudi7;
  String? jeudi8;
  String? vendredi1;
  String? vendredi2;
  String? vendredi3;
  String? vendredi4;
  String? vendredi5;
  String? vendredi6;
  String? vendredi7;
  String? vendredi8;
  String? samedi1;
  String? samedi2;
  String? samedi3;
  String? samedi4;
  String? samedi5;
  String? samedi6;
  String? samedi7;
  String? samedi8;
  int userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Emploi({
    int? id,
    this.lundi1,
    this.lundi2,
    this.lundi3,
    this.lundi4,
    this.lundi5,
    this.lundi6,
    this.lundi7,
    this.lundi8,
    this.mardi1,
    this.mardi2,
    this.mardi3,
    this.mardi4,
    this.mardi5,
    this.mardi6,
    this.mardi7,
    this.mardi8,
    this.mercredi1,
    this.mercredi2,
    this.mercredi3,
    this.mercredi4,
    this.mercredi5,
    this.mercredi6,
    this.mercredi7,
    this.mercredi8,
    this.jeudi1,
    this.jeudi2,
    this.jeudi3,
    this.jeudi4,
    this.jeudi5,
    this.jeudi6,
    this.jeudi7,
    this.jeudi8,
    this.vendredi1,
    this.vendredi2,
    this.vendredi3,
    this.vendredi4,
    this.vendredi5,
    this.vendredi6,
    this.vendredi7,
    this.vendredi8,
    this.samedi1,
    this.samedi2,
    this.samedi3,
    this.samedi4,
    this.samedi5,
    this.samedi6,
    this.samedi7,
    this.samedi8,
    required this.userId,
    this.createdAt,
    this.updatedAt,
  }) {
    this.id = id;
  }

  factory Emploi.fromJson(Map<String, dynamic> json) {
    return Emploi(
      id: json['id'],
      lundi1: json['lundi1'],
      lundi2: json['lundi2'],
      lundi3: json['lundi3'],
      lundi4: json['lundi4'],
      lundi5: json['lundi5'],
      lundi6: json['lundi6'],
      lundi7: json['lundi7'],
      lundi8: json['lundi8'],
      mardi1: json['mardi1'],
      mardi2: json['mardi2'],
      mardi3: json['mardi3'],
      mardi4: json['mardi4'],
      mardi5: json['mardi5'],
      mardi6: json['mardi6'],
      mardi7: json['mardi7'],
      mardi8: json['mardi8'],
      mercredi1: json['mercredi1'],
      mercredi2: json['mercredi2'],
      mercredi3: json['mercredi3'],
      mercredi4: json['mercredi4'],
      mercredi5: json['mercredi5'],
      mercredi6: json['mercredi6'],
      mercredi7: json['mercredi7'],
      mercredi8: json['mercredi8'],
      jeudi1: json['jeudi1'],
      jeudi2: json['jeudi2'],
      jeudi3: json['jeudi3'],
      jeudi4: json['jeudi4'],
      jeudi5: json['jeudi5'],
      jeudi6: json['jeudi6'],
      jeudi7: json['jeudi7'],
      jeudi8: json['jeudi8'],
      vendredi1: json['vendredi1'],
      vendredi2: json['vendredi2'],
      vendredi3: json['vendredi3'],
      vendredi4: json['vendredi4'],
      vendredi5: json['vendredi5'],
      vendredi6: json['vendredi6'],
      vendredi7: json['vendredi7'],
      vendredi8: json['vendredi8'],
      samedi1: json['samedi1'],
      samedi2: json['samedi2'],
      samedi3: json['samedi3'],
      samedi4: json['samedi4'],
      samedi5: json['samedi5'],
      samedi6: json['samedi6'],
      samedi7: json['samedi7'],
      samedi8: json['samedi8'],
      userId: json['user_id'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lundi1': lundi1,
      'lundi2': lundi2,
      'lundi3': lundi3,
      'lundi4': lundi4,
      'lundi5': lundi5,
      'lundi6': lundi6,
      'lundi7': lundi7,
      'lundi8': lundi8,
      'mardi1': mardi1,
      'mardi2': mardi2,
      'mardi3': mardi3,
      'mardi4': mardi4,
      'mardi5': mardi5,
      'mardi6': mardi6,
      'mardi7': mardi7,
      'mardi8': mardi8,
      'mercredi1': mercredi1,
      'mercredi2': mercredi2,
      'mercredi3': mercredi3,
      'mercredi4': mercredi4,
      'mercredi5': mercredi5,
      'mercredi6': mercredi6,
      'mercredi7': mercredi7,
      'mercredi8': mercredi8,
      'jeudi1': jeudi1,
      'jeudi2': jeudi2,
      'jeudi3': jeudi3,
      'jeudi4': jeudi4,
      'jeudi5': jeudi5,
      'jeudi6': jeudi6,
      'jeudi7': jeudi7,
      'jeudi8': jeudi8,
      'vendredi1': vendredi1,
      'vendredi2': vendredi2,
      'vendredi3': vendredi3,
      'vendredi4': vendredi4,
      'vendredi5': vendredi5,
      'vendredi6': vendredi6,
      'vendredi7': vendredi7,
      'vendredi8': vendredi8,
      'samedi1': samedi1,
      'samedi2': samedi2,
      'samedi3': samedi3,
      'samedi4': samedi4,
      'samedi5': samedi5,
      'samedi6': samedi6,
      'samedi7': samedi7,
      'samedi8': samedi8,
      'user_id': userId,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
