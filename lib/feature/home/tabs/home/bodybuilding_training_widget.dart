import 'package:flutter/material.dart';
import 'package:pedagogue/feature/home/tabs/home/bodybuilding_training/bodybuilding_training_view.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/shared/style/dimensions.dart';

class BodyBuildingTrainingWidget extends StatelessWidget {
  const BodyBuildingTrainingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimensions.paddingMedium,
      child: SizedBox(
        height: 55,
        width: double.maxFinite,
        child: FilledButton.icon(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const BodyBuildingTrainingView(),
            ),
          ),
          label: Text(intl.bodyBuildingTraining),
          icon: const Icon(Icons.fitness_center),
        ),
      ),
    );
  }
}
