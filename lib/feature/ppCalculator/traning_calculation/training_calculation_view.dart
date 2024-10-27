import 'package:flutter/material.dart';

import 'package:pedagogue/feature/ppCalculator/traning_calculation/aerobic_speed.dart';
import 'package:pedagogue/feature/ppCalculator/traning_calculation/cat.dart';
import 'package:pedagogue/feature/ppCalculator/traning_calculation/cooper.dart';
import 'package:pedagogue/feature/ppCalculator/traning_calculation/distance_based.dart';
import 'package:pedagogue/feature/ppCalculator/traning_calculation/hrmax.dart';
import 'package:pedagogue/feature/ppCalculator/traning_calculation/karnoven.dart';
import 'package:pedagogue/feature/ppCalculator/traning_calculation/kilometer_based.dart';
import 'package:pedagogue/feature/ppCalculator/traning_calculation/ruffier.dart';
import 'package:pedagogue/feature/ppCalculator/traning_calculation/speed_based.dart';
import 'package:pedagogue/feature/ppCalculator/traning_calculation/time_based.dart';
import 'package:pedagogue/feature/ppCalculator/traning_calculation/weight_height.dart';
import 'package:pedagogue/feature/ppCalculator/traning_calculation/ymca.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';

import 'half_cooper.dart';
import 'strength.dart';

class TrainingCalculationView extends StatefulWidget {
  const TrainingCalculationView({super.key});

  @override
  State<TrainingCalculationView> createState() =>
      _TrainingCalculationViewState();
}

class _TrainingCalculationViewState extends State<TrainingCalculationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.trainingCalculation),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                intl.trainingCalculationTitle1,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              Dimensions.verticalSpacingSmall,
              Hrmax(),
              Dimensions.verticalSpacingSmall,
              Karnoven(),
              Dimensions.verticalSpacingSmall,
              AerobicSpeed(),
              Dimensions.verticalSpacingSmall,
              HalfCooper(),
              Dimensions.verticalSpacingMedium,
              Cooper(),
              Dimensions.verticalSpacingMedium,
              Cat(),
              Dimensions.verticalSpacingMedium,
              TimeBased(),
              Dimensions.verticalSpacingMedium,
              Dimensions.verticalSpacingMedium,
              DistanceBased(),
              Dimensions.verticalSpacingMedium,
              SpeedBased(),
              Dimensions.verticalSpacingMedium,
              KilometerBased(),
              Dimensions.verticalSpacingMedium,
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  intl.trainingCalculationTitle2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Dimensions.verticalSpacingMedium,
              Ruffer(),
              Dimensions.verticalSpacingMedium,
              WeightHeight(),
              Dimensions.verticalSpacingMedium,
              Ymca(),
              Dimensions.verticalSpacingMedium,
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  intl.trainingCalculationTitle3,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Dimensions.verticalSpacingSmall,
              Strength(),
              Dimensions.verticalSpacingMedium,
              Dimensions.verticalSpacingMedium,
              Dimensions.verticalSpacingMedium,
            ],
          ),
        ),
      ),
    );
  }
}
