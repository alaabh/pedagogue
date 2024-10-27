class WorkoutModel {
 

    final dynamic   push_set;
    final dynamic    push_rep ;
     final dynamic   pull_set ;
     final dynamic   pull_rep ;
      final dynamic  sit_set ;
      final dynamic  sit_rep ;
      final dynamic  walk_set ;
      final dynamic  walk_rep ;
      final dynamic  squat_set ;
      final dynamic  squat_rep ;
      final dynamic  date ;
  WorkoutModel( {
    this.push_set, this.push_rep, this.pull_set, this.pull_rep, this.sit_set, this.sit_rep, this.walk_set, this.walk_rep, this.squat_set, this.squat_rep, this.date,
   
    
  });

  factory WorkoutModel.fromJson(Map<dynamic, dynamic> json) {
    return WorkoutModel(
      push_set: json['push_set'],
      push_rep: json['push_rep'],
      pull_set: json['pull_set'],
      pull_rep: json['pull_rep'],
      sit_set: json['sit_set'],
      sit_rep: json['sit_rep'],
      walk_set: json['walk_set'],
      walk_rep: json['walk_rep'],
      squat_set: json['squat_set'],
      squat_rep: json['squat_rep'],
      date: json['date'],
     
     
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'push_set': push_set,
      'push_rep': push_rep,
      'pull_set': pull_set,
      'pull_rep': pull_rep,
      'sit_set': sit_set,
      'sit_rep': sit_rep,
      'walk_set': walk_set,
      'walk_rep': walk_rep,
      'squat_set': squat_set,
      'squat_rep': squat_rep,
      'date': date,
     
    };
  }
}