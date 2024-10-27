import 'package:flutter/material.dart';
import 'package:pedagogue/feature/evaluationByPosition/attaque/attaque_view.dart';
import 'package:pedagogue/feature/evaluationByPosition/deffense/deffense_view.dart';
import 'package:pedagogue/feature/evaluationByPosition/goalKeeper/goalKeeper_view.dart';
import 'package:pedagogue/feature/evaluationByPosition/middle/middle_view.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../shared/style/dimensions.dart';

class EvaluationByPositionMAin extends StatefulWidget {
  const EvaluationByPositionMAin({super.key});

  @override
  State<EvaluationByPositionMAin> createState() =>
      _EvaluationByPositionMAinState();
}

class _EvaluationByPositionMAinState extends State<EvaluationByPositionMAin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.evaluationByPosition)),
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
                      builder: (context) => const GoalKeeperView(),
                    ),
                  );
                },
                child: Text(intl.goalkeeper),
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
                      builder: (context) => const DeffenseView(),
                    ),
                  );
                },
                child: Text(intl.defender),
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
                      builder: (context) => const MiddleView(),
                    ),
                  );
                },
                child: Text(intl.middle),
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
                      builder: (context) => const AttaqueView(),
                    ),
                  );
                },
                child: Text(intl.attacker),
              ),
            ),
            Dimensions.verticalSpacingSmall,
          ],
        ),
      ),
    );
  }
}
