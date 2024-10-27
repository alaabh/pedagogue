class BiologicalAge {
  final dynamic sex;
  final dynamic age;
  final dynamic race;
  final dynamic longevity;
  final dynamic Education;
  final dynamic sleep;
  final dynamic cholesterol;
  final dynamic bp;
  final dynamic smoking;
  final dynamic heredity;
  final dynamic weight;
  final dynamic stress;
  final dynamic activity;
  final dynamic medexam;
  final dynamic heart;
  final dynamic lung;
  final dynamic time;
  final dynamic protein;
  final dynamic drugs;
  final dynamic femalehealth;
  final dynamic pill;
  final dynamic breakfast;
  final dynamic meals;
  final dynamic veg;
  final dynamic refined;
  final dynamic alcohol;
  final dynamic happiness;
  final dynamic depression;
  final dynamic anxiety;
  final dynamic relax;
  final dynamic love;
  final dynamic job;
  final dynamic social;
  final dynamic driving;
  final dynamic seatbelt;
  final dynamic risk;
  final dynamic personalT;
  final dynamic cadT;
  final dynamic medicalT;
  final dynamic dietT;
  final dynamic psychT;
  final dynamic safetyT;
  final dynamic total;
  final dynamic expectancy;
  final dynamic healthage;
  final dynamic diferencia;

  BiologicalAge({
    this.pill,
    this.breakfast,
    this.meals,
    this.veg,
    this.refined,
    this.alcohol,
    this.happiness,
    this.depression,
    this.anxiety,
    this.relax,
    this.love,
    this.job,
    this.social,
    this.driving,
    this.seatbelt,
    this.risk,
    this.sex,
    this.age,
    this.race,
    this.longevity,
    this.Education,
    this.sleep,
    this.cholesterol,
    this.bp,
    this.smoking,
    this.heredity,
    this.weight,
    this.stress,
    this.activity,
    this.medexam,
    this.heart,
    this.lung,
    this.time,
    this.protein,
    this.drugs,
    this.femalehealth,
    this.personalT,
    this.cadT,
    this.medicalT,
    this.dietT,
    this.psychT,
    this.safetyT,
    this.total,
    this.expectancy,
    this.healthage,
    this.diferencia,
  });

  factory BiologicalAge.fromJson(Map<dynamic, dynamic> json) {
    return BiologicalAge(
      /*  pill: json['pill'],
      breakfast: json['breakfast'],
      veg: json['veg'],
      meals: json['meals'],
      refined: json['refined'],
      alcohol: json['alcohol'],
      happiness: json['happiness'],
      depression: json['depression'],
      anxiety: json['anxiety'],
      relax: json['relax'],
      love: json['love'],
      job: json['job'],
      social: json['social'],
      driving: json['driving'],
      seatbelt: json['seatbelt'],
      risk: json['risk'],
      sex: json['sex'],
      age: json['age'],
      race: json['race'],
      longevity: json['longevity'],
      Education: json['Education'],
      sleep: json['sleep'],
      cholesterol: json['cholesterol'],
      bp: json['bp'],
      smoking: json['smoking'],
      heredity: json['heredity'],
      weight: json['weight'],
      stress: json['stress'],
      activity: json['activity'],
      medexam: json['medexam'],
      heart: json['heart'],
      lung: json['lung'],
      time: json['time'],
      protein: json['protein'],
      drugs: json['drugs'],
      femalehealth: json['femalehealth'], */
      personalT: json['data']['personalT'],
      cadT: json['data']['cadT'],
      medicalT: json['data']['medicalT'],
      dietT: json['data']['dietT'],
      psychT: json['data']['psychT'],
      safetyT: json['data']['safetyT'],
      total: json['data']['total'],
      expectancy: json['data']['expectancy'],
      healthage: json['data']['healthage'],
      diferencia: json['data']['diferencia'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "pill": pill,
      "breakfast": breakfast,
      "veg": veg,
      "meals": meals,
      "refined": refined,
      "alcohol": alcohol,
      "happiness": happiness,
      "depression": depression,
      "anxiety": anxiety,
      "relax": relax,
      "love": love,
      "job": job,
      "social": social,
      "driving": driving,
      "seatbelt": seatbelt,
      "risk": risk,
      'sex': sex,
      'age': age,
      'race': race,
      'longevity': longevity,
      'Education': Education,
      'sleep': sleep,
      'cholesterol': cholesterol,
      'bp': bp,
      'smoking': smoking,
      'heredity': heredity,
      'weight': weight,
      'stress': stress,
      'activity': activity,
      'medexam': medexam,
      'heart': heart,
      'lung': lung,
      'time': time,
      'protein': protein,
      'drugs': drugs,
      'femalehealth': femalehealth,
      /* 'personalT': personalT,
      'cadT':cadT,
      'medicalT':medicalT,
      'dietT':dietT,
      'psychT':psychT,
      'safetyT':safetyT,
      'total':total,
       'expectancy':expectancy,
       'healthage':healthage,
      'diferencia':diferencia, */
    };
  }
}
