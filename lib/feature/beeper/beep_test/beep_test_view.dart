import 'package:flutter/material.dart';
import 'package:pedagogue/feature/beeper/beep_test/audio_widget.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../../shared/style/dimensions.dart';

class BeepTestView extends StatefulWidget {
  const BeepTestView({super.key});

  @override
  State<BeepTestView> createState() => _BeepTestViewState();
}

class _BeepTestViewState extends State<BeepTestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.beepTest),
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
                      "Luc leger",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Dimensions.verticalSpacingMedium,
                    Text(
                      intl.beepTestparag1,
                    ),
                    Dimensions.verticalSpacingMedium,
                    AudioWidget(
                      source:
                          "https://back.sportspedagogue.com/Beep_Test/test_luc_leger.mp3",
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
                      "Test 30-15 Intermittent IFT - Develop VMA",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Dimensions.verticalSpacingMedium,
                    Text(
                      intl.beepTestparag2,
                    ),
                    Dimensions.verticalSpacingMedium,
                    AudioWidget(
                      source:
                          "https://back.sportspedagogue.com/Beep_Test/vma.mp3",
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
                      "VMA test",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Dimensions.verticalSpacingMedium,
                    Text(
                      intl.beepTestparag3,
                    ),
                    Dimensions.verticalSpacingMedium,
                    AudioWidget(
                      source:
                          "https://back.sportspedagogue.com/Beep_Test/testvma.mp3",
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
                      "Yo Yo Intermitent Recovery Test",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Dimensions.verticalSpacingMedium,
                    Text(
                      intl.beepTestparag4,
                    ),
                    Dimensions.verticalSpacingMedium,
                    Text(
                      "Level 1",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    AudioWidget(
                      source:
                          "https://back.sportspedagogue.com/Beep_Test/Yo_yo_Intermittent_Recovery_Test_Level_1.mp3",
                    ),
                    Dimensions.verticalSpacingMedium,
                    Text(
                      "Level 2",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    AudioWidget(
                      source:
                          "https://back.sportspedagogue.com/Beep_Test/Yo_Yo_Intermitent_Recovery_Test_Level_2.mp3",
                    ),
                  ],
                ),
                Dimensions.verticalSpacingMedium,
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
                      "Yo Yo endurance test",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Dimensions.verticalSpacingMedium,
                    Text(
                      intl.beepTestparag5,
                    ),
                    Dimensions.verticalSpacingMedium,
                    Text(
                      "Level 1",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    AudioWidget(
                      source:
                          "https://back.sportspedagogue.com/Beep_Test/YOYO_20m_level_1.mp3",
                    ),
                    Dimensions.verticalSpacingMedium,
                    Text(
                      "Level 2",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    AudioWidget(
                      source:
                          "https://back.sportspedagogue.com/Beep_Test/YOYO_20m_level_2.mp3",
                    ),
                  ],
                ),
                Dimensions.verticalSpacingMedium,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
