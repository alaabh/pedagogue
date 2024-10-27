
import 'package:pedagogue/model/base_model.dart';


class RapportSemestre2Model extends BaseModel {
  String? team;
  String? coach;
  String? season;
  String? program;
  String? January1;
  String? January2;
  String? January3;
  String? January4;
  String? Februry5;
  String? Februry6;
  String? Februry7;
  String? Februry8;
  String? March9;
  String? March10;
  String? March11;
  String? March12;
  String? April13;
  String? April14;
  String? April15;
  String? April16;
  String? May17;
  String? May18;
  String? May19;
  String? May20;
  String? June21;
  String? June22;
  String? June23;
  String? June24;
  String? June25;

  RapportSemestre2Model({
     this.team,
    this.coach,
    this.season,
    this.program,
    this.January1,
    this.January2,
    this.January3,
    this.January4,
    this.Februry5,
    this.Februry6,
    this.Februry7,
    this.Februry8,
    this.March9,
    this.March10,
    this.March11,
    this.March12,
    this.April13,
    this.April14,
    this.April15,
    this.April16,
    this.May17,
    this.May18,
    this.May19,
    this.May20,
    this.June21,
    this.June22,
    this.June23,
    this.June24,
    this.June25,
  });

  factory RapportSemestre2Model.fromJson(Map<String, dynamic> json) {
    return RapportSemestre2Model(
      team: json['team'],
      coach: json['coach'],
      season: json['season'],
      program: json['program'],
      January1: json['January1'],
      January2: json['January2'],
      January3: json['January3'],
      January4: json['January4'],
      Februry5: json['Februry5'],
      Februry6: json['Februry6'],
      Februry7: json['Februry7'],
      Februry8: json['Februry8'],
      March9: json['March9'],
      March10: json['March10'],
      March11: json['March11'],
      March12: json['March12'],
      April13: json['April13'],
      April14: json['April14'],
      April15: json['April15'],
      April16: json['April16'],
      May17: json['May17'],
      May18: json['May18'],
      May19: json['May19'],
      May20: json['May20'],
      June21: json['June21'],
      June22: json['June22'],
      June23: json['June23'],
      June24: json['June24'],
      June25: json['June25'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'team': team,
      'coach': coach,
      'season': season,
      'program': program,
      'January1': January1,
      'January2': January2,
      'January3': January3,
      'January4': January4,
      'Februry5': Februry5,
      'Februry6': Februry6,
      'Februry7': Februry7,
      'Februry8': Februry8,
      'March9': March9,
      'March10': March10,
      'March11': March11,
      'March12': March12,
      'April13': April13,
      'April14': April14,
      'April15': April15,
      'April16': April16,
      'May17': May17,
      'May18': May18,
      'May19': May19,
      'May20': May20,
      'June21': June21,
      'June22': June22,
      'June23': June23,
      'June24': June24,
      'June25': June25,
    };
  }
}