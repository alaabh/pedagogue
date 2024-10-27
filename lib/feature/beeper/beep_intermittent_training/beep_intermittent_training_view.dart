import 'package:flutter/material.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../../shared/style/dimensions.dart';
import '../beep_test/audio_widget.dart';

class BeepIntermittentTrainingView extends StatefulWidget {
  const BeepIntermittentTrainingView({super.key});

  @override
  State<BeepIntermittentTrainingView> createState() =>
      _BeepIntermittentTrainingViewState();
}

class _BeepIntermittentTrainingViewState
    extends State<BeepIntermittentTrainingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.beepIntermittentTraining),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                /////////////////////////////////////////////////////
                ///
                ///
                ///
                ///
                ///
                Column(
                  children: [
                    Text(
                      intl.beepIntermittentTrainingTitle1,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Dimensions.verticalSpacingMedium,
                    Text(
                      intl.beepIntermittentTrainingParag1,
                    ),
                    Dimensions.verticalSpacingMedium,
                    AudioWidget(
                      source:
                          "https://back.sportspedagogue.com/beep_entrainement_intermitent/5_25_10miute.mp3",
                    ),
                  ],
                ),
                /////////////////////////////////////////////////////
                ///
                ///
                ///
                ///
                ///
                Dimensions.verticalSpacingMedium,
                Column(
                  children: [
                    Text(
                      intl.beepIntermittentTrainingTitle2,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Dimensions.verticalSpacingMedium,
                    Text(
                      intl.beepIntermittentTrainingParag2,
                    ),
                    Dimensions.verticalSpacingMedium,
                    AudioWidget(
                      source:
                          "https://back.sportspedagogue.com/beep_entrainement_intermitent/15_10_12miut.mp3",
                    ),
                  ],
                ),

                /////////////////////////////////////////////////////
                ///
                ///
                ///
                ///
                ///
                ///
                Dimensions.verticalSpacingMedium,
                Column(
                  children: [
                    Text(
                      intl.beepIntermittentTrainingTitle3,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Dimensions.verticalSpacingMedium,
                    Text(
                      intl.beepIntermittentTrainingParag3,
                    ),
                    Dimensions.verticalSpacingMedium,
                    AudioWidget(
                      source:
                          "https://back.sportspedagogue.com/beep_entrainement_intermitent/15_15_10min.mp3",
                    ),
                  ],
                ),
                /////////////////////////////////////////////////////
                ///
                ///
                ///
                ///
                ///
                ///
                Dimensions.verticalSpacingMedium,
                Column(
                  children: [
                    Text(
                      intl.beepIntermittentTrainingTitle4,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Dimensions.verticalSpacingMedium,
                    Text(
                      intl.beepIntermittentTrainingParag4,
                    ),
                    Dimensions.verticalSpacingMedium,
                    AudioWidget(
                      source:
                          "https://back.sportspedagogue.com/beep_entrainement_intermitent/20_20_10minute.mp3",
                    ),
                  ],
                ),
                /////////////////////////////////////////////////////
                ///
                ///
                ///
                ///
                ///
                ///
                Dimensions.verticalSpacingMedium,
                Column(
                  children: [
                    Text(
                      intl.beepIntermittentTrainingTitle5,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Dimensions.verticalSpacingMedium,
                    Text(
                      intl.beepIntermittentTrainingParag5,
                    ),
                    Dimensions.verticalSpacingMedium,
                    AudioWidget(
                      source:
                          "https://back.sportspedagogue.com/beep_entrainement_intermitent/30_15_15miut.mp3",
                    ),
                  ],
                ),
                /////////////////////////////////////////////////////
                ///
                ///
                ///
                ///
                ///
                ///
                Dimensions.verticalSpacingMedium,
                Column(
                  children: [
                    Text(
                      intl.beepIntermittentTrainingTitle6,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Dimensions.verticalSpacingMedium,
                    Text(
                      intl.beepIntermittentTrainingParag6,
                    ),
                    Dimensions.verticalSpacingMedium,
                    AudioWidget(
                      source:
                          "https://back.sportspedagogue.com/beep_entrainement_intermitent/20minuites.mp3",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
