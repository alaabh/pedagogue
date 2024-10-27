import 'package:flutter/material.dart';
import 'package:pedagogue/feature/beeper/topCrono.dart/top_crono_view.dart';

import '../../shared/style/dimensions.dart';
import 'beep_intermittent_training/beep_intermittent_training_view.dart';
import 'beep_test/beep_test_view.dart';
import 'timer/timer_view.dart';
import 'package:pedagogue/l10n/localization.dart';

class BeeperMAin extends StatefulWidget {
  const BeeperMAin({super.key});

  @override
  State<BeeperMAin> createState() => _BeeperMAinState();
}

class _BeeperMAinState extends State<BeeperMAin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.beeper)),
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
                      builder: (context) => const TopCronoView(),
                    ),
                  );
                },
                child: Text(intl.topCrono),
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
                      builder: (context) => const BeepTestView(),
                    ),
                  );
                },
                child: Text(intl.beepTest),
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
                      builder: (context) =>
                          const BeepIntermittentTrainingView(),
                    ),
                  );
                },
                child: Text(intl.beepIntermittentTraining),
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
                      builder: (context) => const TimerView(),
                    ),
                  );
                },
                child: Text(intl.timer),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
