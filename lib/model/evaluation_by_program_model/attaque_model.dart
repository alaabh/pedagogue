import 'package:pedagogue/model/base_model.dart';

class AttaqueModel extends BaseModel{
 String? team;
  String? season;
  String? player;
  String? month;
  final String? L1, L2, L3, L4, L5, L6, L7, L8, L9, L10;
  final String? L11, L12, L13, L14, L15, L16, L17, L18, L19, L20;
  final String? L21, L22, L23, L24, L25, L26, L27, L28;

  AttaqueModel({
    this.team,
    this.player,
    this.season,
    this.month,
   this.L1, this.L2, this.L3, this.L4, this.L5, this.L6, this.L7, this.L8, this.L9, this.L10,
    this.L11, this.L12, this.L13, this.L14, this.L15, this.L16, this.L17, this.L18, this.L19, this.L20,
    this.L21, this.L22, this.L23, this.L24, this.L25, this.L26, this.L27, this.L28,
  });

  factory AttaqueModel.fromJson(Map<String, dynamic> json) {
    return AttaqueModel(
       team: json['team'],
      player: json['coach'],
      season: json['season'],
      month: json['program'],
     L1: json['L1'],
      L2: json['L2'],
      L3: json['L3'],
      L4: json['L4'],
      L5: json['L5'],
      L6: json['L6'],
      L7: json['L7'],
      L8: json['L8'],
      L9: json['L9'],
      L10: json['L10'],
      L11: json['L11'],
      L12: json['L12'],
      L13: json['L13'],
      L14: json['L14'],
      L15: json['L15'],
      L16: json['L16'],
      L17: json['L17'],
      L18: json['L18'],
      L19: json['L19'],
      L20: json['L20'],
      L21: json['L21'],
      L22: json['L22'],
      L23: json['L23'],
      L24: json['L24'],
      L25: json['L25'],
      L26: json['L26'],
      L27: json['L27'],
      L28: json['L28'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
       'team': team,
      'player': player,
      'season': season,
      'month': month,
      'L1': L1, 'L2': L2, 'L3': L3, 'L4': L4, 'L5': L5,
        'L6': L6, 'L7': L7, 'L8': L8, 'L9': L9, 'L10': L10,
        'L11': L11, 'L12': L12, 'L13': L13, 'L14': L14, 'L15': L15,
        'L16': L16, 'L17': L17, 'L18': L18, 'L19': L19, 'L20': L20,
        'L21': L21, 'L22': L22, 'L23': L23, 'L24': L24, 'L25': L25,
        'L26': L26, 'L27': L27, 'L28': L28,
    };
  }


}