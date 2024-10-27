import 'package:flutter/material.dart';
import 'package:pedagogue/feature/trainingBook/planingLeason/planingLeasonView.dart';
import 'package:pedagogue/feature/trainingBook/reportSemestre1/reportSemestreOneView.dart';
import 'package:pedagogue/feature/trainingBook/reportSemestre2/reportSemestreTwoView.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../shared/style/dimensions.dart';
import 'characteristic/characteristic_view.dart';
import 'reportWeeklyPlaning/reportWeeklyPlaningView.dart';

class TrainingBookMain extends StatefulWidget {
  const TrainingBookMain({super.key});

  @override
  State<TrainingBookMain> createState() => _TrainingBookMainState();
}

class _TrainingBookMainState extends State<TrainingBookMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.trainingBook)),
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
                      builder: (context) => const CharacteristicView(),
                    ),
                  );
                },
                child:  Text(intl.characteristic),
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
                      builder: (context) => const ReportSemestreOneView(),
                    ),
                  );
                },
                child:  Text(intl.reportSemestre1),
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
                      builder: (context) => const ReportSemestreTwoView(),
                    ),
                  );
                },
                child:  Text(intl.reportSemestre2),
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
                      builder: (context) => const RepportWeeklyPlaningView(),
                    ),
                  );
                },
                child:  Text(intl.reportWeeklyPlaning),
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
                      builder: (context) => const PlaningLeasonView(),
                    ),
                  );
                },
                child:  Text(intl.planingALeason),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
