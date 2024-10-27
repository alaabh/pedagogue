import 'package:flutter/material.dart';
import 'package:pedagogue/feature/ppCalculator/traning_calculation/training_calculation_view.dart';
import 'package:pedagogue/feature/ppCalculator/vma/vma.dart';
import 'package:pedagogue/feature/ppCalculator/water_loss/water_loss.dart';

import '../../l10n/localization.dart';
import '../../shared/style/dimensions.dart';
import 'average_resting_heart_rate/average_resting_heart_rate.dart';
import 'blood_presure/blood_presure.dart';
import 'full_body_analysis/full_body_analysis_view.dart';
import 'human_water_requirement/human_water_requirement.dart';
import 'target_heart_rate.dart/target_heart_rate.dart';
import 'vVo2Max/vVo2Max.dart';
import 'vo2max_calcul/vo2max_calcul.dart';
import 'yoyo-test1/yoyo_test1.dart';
import 'yoyo_endurance1_2/yoyo_endurance1_2.dart';
import 'yoyo_test2/yoyo_test2.dart';

class PpCalculatorMAin extends StatefulWidget {
  const PpCalculatorMAin({super.key});

  @override
  State<PpCalculatorMAin> createState() => _PpCalculatorMAinState();
}

class _PpCalculatorMAinState extends State<PpCalculatorMAin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.ppCalculator),
      ),
      body: SingleChildScrollView(
        padding: Dimensions.paddingMedium,
        child: Column(
          children: [
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TrainingCalculationView(),
                    ),
                  );
                },
                child: Text(intl.trainingCalculation),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Vma(),
                    ),
                  );
                },
                child: Text(intl.vma),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const vo2maxCalcul(),
                    ),
                  );
                },
                child: Text(intl.vO2Max),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const VVo2Max(),
                    ),
                  );
                },
                child: Text(intl.vVO2maxMaxListe),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const YoyoTest1(),
                    ),
                  );
                },
                child: Text("${intl.yoyoListe} 1"),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const YoyoTest2(),
                    ),
                  );
                },
                child: Text("${intl.yoyoListe} 2"),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const YoyoEndurance12(),
                    ),
                  );
                },
                child: Text("${intl.yoyoEnduranceList}"),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FullBodyAnalysisView(),
                    ),
                  );
                },
                child: Text("${intl.fullBodyList}"),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TargetHeartRate(),
                    ),
                  );
                },
                child: Text("${intl.targetHeartRateList}"),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AverageRestingHeartRate(),
                    ),
                  );
                },
                child: Text("${intl.averageRestingHeartRateList}"),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BloodPresure(),
                    ),
                  );
                },
                child: Text("${intl.bloodPressureList}"),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HumanWaterRequirement(),
                    ),
                  );
                },
                child: Text("${intl.humanWaterRequirementList}"),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const WaterLoss(),
                    ),
                  );
                },
                child: Text("${intl.waterLossList}"),
              ),
            ),
            Dimensions.verticalSpacingSmall,
          ],
        ),
      ),
    );
  }
}
