class Assets {
  static const logoDark = 'assets/logo-dark.png';
  static const logoLight = 'assets/logo-light.jpeg';

  static const dividedTerrain = 'assets/divided-terrain.png';

  static const administrative = 'assets/staff/administrative.png';
  static const assistant = 'assets/staff/assistant.png';
  static const coach = 'assets/staff/coach.png';
  static const delegate = 'assets/staff/delegate.png';
  static const director = 'assets/staff/director.png';
  static const doctor = 'assets/staff/doctor.png';
  static const fitness = 'assets/staff/fitness.png';
  static const goalkeeper = 'assets/staff/goalkeeper.png';
  static const material = 'assets/staff/material.png';
  static const nutritionist = 'assets/staff/nutritionist.png';
  static const physiotherapist = 'assets/staff/physiotherapist.png';
  static const statistician = 'assets/staff/statistician.png';

  static const manBodyBack = 'assets/human_body/man_body_back.svg';
  static const manBodyFront = 'assets/human_body/man_body_front.svg';
  static const womanBodyBack = 'assets/human_body/woman_body_back.svg';
  static const womanBodyFront = 'assets/human_body/woman_body_front.svg';
}

class TechnicalDrawingAssets {
  static const athleticsIcon = 'assets/technical_drawing/athletics.png';
  static const basketballIcon = 'assets/technical_drawing/basketball.png';
  static const footballIcon = 'assets/technical_drawing/football.png';
  static const handballIcon = 'assets/technical_drawing/handball.png';
  static const rugbyIcon = 'assets/technical_drawing/rugby.png';
  static const tennisIcon = 'assets/technical_drawing/tennis.png';
  static const volleyballIcon = 'assets/technical_drawing/volleyball.png';

  static const _path = 'assets/technical_drawing';

  static const athleticsTerrain = '$_path/athletics/_terrain.png';
  static const basketballTerrain = '$_path/basketball/_terrain.png';
  static const footballTerrain = '$_path/football/_terrain.png';
  static const handballTerrain = '$_path/handball/_terrain.png';
  static const rugbyTerrain = '$_path/rugby/_terrain.png';
  static const tennisTerrain = '$_path/tennis/_terrain.png';
  static const volleyballTerrain = '$_path/volleyball/_terrain.png';

  static List<String> athleticsDraggableItems = List.generate(
    27,
    (index) => '$_path/athletics/${index + 1}.png',
  );
  static List<String> basketballDraggableItems = List.generate(
    26,
    (index) => '$_path/basketball/${index + 1}.png',
  );
  static List<String> footballDraggableItems = List.generate(
    28,
    (index) => '$_path/football/${index + 1}.png',
  );
  static List<String> handballDraggableItems = List.generate(
    26,
    (index) => '$_path/handball/${index + 1}.png',
  );
  static List<String> rugbyDraggableItems = List.generate(
    26,
    (index) => '$_path/rugby/${index + 1}.png',
  );
  static List<String> tennisDraggableItems = List.generate(
    28,
    (index) => '$_path/tennis/${index + 1}.png',
  );
  static List<String> volleyballDraggableItems = List.generate(
    27,
    (index) => '$_path/volleyball/${index + 1}.png',
  );
}
