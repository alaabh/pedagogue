import 'package:flutter/material.dart';
import 'package:pedagogue/feature/home/tabs/home/bodybuilding_training/entities/body_part.dart';
import 'package:pedagogue/feature/home/tabs/home/bodybuilding_training/entities/exercise.dart';
import 'package:pedagogue/feature/home/tabs/home/bodybuilding_training/data/static_female_exercice_data.dart';
import 'package:pedagogue/feature/home/tabs/home/bodybuilding_training/data/static_male_exercise_data.dart';

import 'exercise_widget.dart';

class ExercisesView extends StatelessWidget {
  final bool isMale;
  final BodyPartId bodyPartId;
  final ExerciseCategory exerciseCategory;

  const ExercisesView({
    super.key,
    required this.isMale,
    required this.bodyPartId,
    required this.exerciseCategory,
  });

  List<Exercise> getExerciseData() {
    switch (bodyPartId) {
      case BodyPartId.abdominal:
        return isMale
            ? StaticMaleExerciseData().abdominal
            : StaticFemaleExerciseData().abdominal;
      case BodyPartId.obliques:
        return isMale
            ? StaticMaleExerciseData().obliques
            : StaticFemaleExerciseData().obliques;
      case BodyPartId.forearms:
        return isMale
            ? StaticMaleExerciseData().forearms
            : StaticFemaleExerciseData().forearms;
      case BodyPartId.biceps:
        return isMale
            ? StaticMaleExerciseData().biceps
            : StaticFemaleExerciseData().biceps;
      case BodyPartId.shoulders:
        return isMale
            ? StaticMaleExerciseData().shoulders
            : StaticFemaleExerciseData().shoulders;
      case BodyPartId.traps:
        return isMale
            ? StaticMaleExerciseData().traps
            : StaticFemaleExerciseData().traps;
      case BodyPartId.chest:
        return isMale
            ? StaticMaleExerciseData().chest
            : StaticFemaleExerciseData().chest;
      case BodyPartId.quads:
        return isMale
            ? StaticMaleExerciseData().quads
            : StaticFemaleExerciseData().quads;
      case BodyPartId.calves:
        return isMale
            ? StaticMaleExerciseData().calves
            : StaticFemaleExerciseData().calves;
      case BodyPartId.hamstrings:
        return isMale
            ? StaticMaleExerciseData().hamstrings
            : StaticFemaleExerciseData().hamstrings;
      case BodyPartId.lowerBack:
        return isMale
            ? StaticMaleExerciseData().lowerBack
            : StaticFemaleExerciseData().lowerBack;
      case BodyPartId.glutes:
        return isMale
            ? StaticMaleExerciseData().glutes
            : StaticFemaleExerciseData().glutes;
      case BodyPartId.lats:
        return isMale
            ? StaticMaleExerciseData().lats
            : StaticFemaleExerciseData().lats;
      case BodyPartId.trapsMiddle:
        return isMale
            ? StaticMaleExerciseData().trapsMiddle
            : StaticFemaleExerciseData().trapsMiddle;
      case BodyPartId.triceps:
        return isMale
            ? StaticMaleExerciseData().triceps
            : StaticFemaleExerciseData().triceps;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final exerciseList = getExerciseData()
        .where((e) => e.exerciseCategory == exerciseCategory)
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(bodyPartId.localizedValue)),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            exerciseList.length,
            (index) => ExerciseWidget(
              exercise: exerciseList[index],
            ),
          ),
        ),
      ),
    );
  }
}
