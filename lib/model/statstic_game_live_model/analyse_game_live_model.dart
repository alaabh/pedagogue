class AnalysisGameLiveModel {
  final dynamic Match_Speed;
  final dynamic Playing_Style;
  final dynamic Game_Transformation_1;
  final dynamic Game_Transformation_2;
  final dynamic Attack_Building;
  final dynamic Pressure;
  final dynamic Offside;
  final dynamic Long_shots_on_goal;
  final dynamic Chance_To_Shoot;
  final dynamic Left_Side;
  final dynamic Right_Side;
  final dynamic Head_Kick;
  final dynamic Comments;
  
  AnalysisGameLiveModel( {
     this.Match_Speed,
     this.Playing_Style,
  this.Game_Transformation_1,
   this.Game_Transformation_2,
    this.Attack_Building,
    this.Pressure,
     this.Offside,
     this.Long_shots_on_goal,
     this.Chance_To_Shoot,
    this.Left_Side,
    this.Right_Side,
    this.Head_Kick,
    this.Comments,
   
  });

  factory AnalysisGameLiveModel.fromJson(Map<dynamic, dynamic> json) {
    return AnalysisGameLiveModel(
      Match_Speed: json['Match_Speed'],
      Game_Transformation_1: json['Game_Transformation_1'],
      Game_Transformation_2: json['Game_Transformation_2'],
      Playing_Style: json['Playing_Style'],
      Attack_Building: json['Attack_Building'],
      Pressure: json['Pressure'],
      Offside: json['Offside'],
      Long_shots_on_goal: json['Long_shots_on_goal'],
      Chance_To_Shoot: json['Chance_To_Shoot'],
      Left_Side: json['Left_Side'],
      Right_Side: json['Right_Side'],
      Head_Kick: json['Head_Kick'],
      Comments: json['Comments'],
     
      
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'Match_Speed': Match_Speed,
      'Playing_Style': Playing_Style,
      'Game_Transformation_1': Game_Transformation_1,
      'Game_Transformation_2': Game_Transformation_2,
      'Attack_Building': Attack_Building,
      'Pressure': Pressure,
      'Offside': Offside,
      'Long_shots_on_goal': Long_shots_on_goal,
      'Chance_To_Shoot': Chance_To_Shoot,
      'Left_Side': Left_Side,
      'Right_Side': Right_Side,
      'Head_Kick': Head_Kick,
      'Comments': Comments,
      
      
    };
  }
}