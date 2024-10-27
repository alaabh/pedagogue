class StatisticGameLiveModel {
  final dynamic compressive_support;
  final dynamic block_counter_attack;
  final dynamic retaining_superiority;
  final dynamic dependence_skills;
  final dynamic playing_means;
  final dynamic team_success_experience;
  final dynamic the_capabilities_of_the_coach;
  final dynamic mental_toughness;
  final dynamic team_trust;
  final dynamic team_persistence;
  final dynamic team_fighting_spirit;
  final dynamic the_team_win;
  final dynamic there_is_player;
  final dynamic team_competitiveness;
  final dynamic team_social;
  final dynamic play_direct;
  final dynamic good;
  final dynamic depend;
  final dynamic depends_offside;
  final dynamic technical;
  final dynamic goodKick;
  final dynamic offencive;
  final dynamic leader;
  final dynamic attack;
  final dynamic goodGK;
  StatisticGameLiveModel({
    this.compressive_support,
    this.block_counter_attack,
    this.retaining_superiority,
    this.dependence_skills,
    this.playing_means,
    this.team_success_experience,
    this.the_capabilities_of_the_coach,
    this.mental_toughness,
    this.team_trust,
    this.team_persistence,
    this.team_fighting_spirit,
    this.the_team_win,
    this.there_is_player,
    this.team_competitiveness,
    this.team_social,
    this.play_direct,
    this.good,
    this.depend,
    this.depends_offside,
    this.technical,
    this.goodKick,
    this.offencive,
    this.leader,
    this.attack,
    this.goodGK,
  });

  factory StatisticGameLiveModel.fromJson(Map<dynamic, dynamic> json) {
    return StatisticGameLiveModel(
      compressive_support: json['compressive_support'],
      retaining_superiority: json['retaining_superiority'],
      block_counter_attack: json['block_counter_attack'],
      dependence_skills: json['dependence_skills'],
      playing_means: json['playing_means'],
      team_success_experience: json['team_success_experience'],
      the_capabilities_of_the_coach: json['the_capabilities_of_the_coach'],
      mental_toughness: json['mental_toughness'],
      team_trust: json['team_trust'],
      team_persistence: json['team_persistence'],
      team_fighting_spirit: json['team_fighting_spirit'],
      the_team_win: json['the_team_win'],
      there_is_player: json['there_is_player'],
      team_competitiveness: json['team_competitiveness'],
      team_social: json['team_social'],
      play_direct: json['play_direct'],
      good: json['good'],
      depend: json['depend'],
      depends_offside: json['depends_offside'],
      technical: json['technical'],
      goodKick: json['goodKick'],
      offencive: json['created_at'],
      leader: json['updated_at'],
      attack: json['attack'],
      goodGK: json['goodGK'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'compressive_support': compressive_support,
      'block_counter_attack': block_counter_attack,
      'retaining_superiority': retaining_superiority,
      'dependence_skills': dependence_skills,
      'playing_means': playing_means,
      'team_success_experience': team_success_experience,
      'the_capabilities_of_the_coach': the_capabilities_of_the_coach,
      'mental_toughness': mental_toughness,
      'team_trust': team_trust,
      'team_persistence': team_persistence,
      'team_fighting_spirit': team_fighting_spirit,
      'the_team_win': the_team_win,
      'there_is_player': there_is_player,
      'team_competitiveness': team_competitiveness,
      'team_social': team_social,
      'play_direct': play_direct,
      'good': good,
      'depend': depend,
      'depends_offside': depends_offside,
      'technical': technical,
      'goodKick': goodKick,
      'offencive': offencive,
      'leader': leader,
      'attack': attack,
      'goodGK': goodGK,
    };
  }
}
