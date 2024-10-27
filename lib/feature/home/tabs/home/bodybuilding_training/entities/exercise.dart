import 'package:pedagogue/feature/home/tabs/home/bodybuilding_training/entities/body_part.dart';

import '../../../../../../l10n/localization.dart';

class Exercise {
  int? id;
  String title;
  String video1Filename;
  String video2Filename;
  List<String> steps;
  Difficulty difficulty;
  ExerciseCategory exerciseCategory;
  BodyPartId bodyPartId;

  Exercise({
    this.id,
    required this.title,
    required this.steps,
    required this.video1Filename,
    required this.video2Filename,
    required this.difficulty,
    required this.exerciseCategory,
    required this.bodyPartId,
  });
}

enum ExerciseCategory {
  bodyWeight,
  dumbbells,
  barbell,
  stretches,
  band;
}

enum Difficulty {
  beginner,
  intermediate;
}

extension DifficultyExtension on Difficulty {
  String get localizedValue {
    switch (this) {
      case Difficulty.beginner:
        return intl.beginner;
      case Difficulty.intermediate:
        return intl.intermediate;
    }
  }
}
