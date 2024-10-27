import 'package:flutter/material.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';

class YoyoTest1 extends StatefulWidget {
  const YoyoTest1({super.key});

  @override
  State<YoyoTest1> createState() => _YoyoTest1State();
}

class _YoyoTest1State extends State<YoyoTest1> {
  List<int> distTOTAL = [
    0,
    0,
    0,
    0,
    0,
    40,
    40,
    40,
    40,
    80,
    80,
    120,
    200,
    320,
    480,
    800,
    1120,
    1440,
    1760,
    2080,
    2400,
    2720,
    3040,
    3360
  ];
  TextEditingController level = TextEditingController();
  TextEditingController shuttles = TextEditingController();
  int distanceResult = 0;
  String calcvalResult = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.yoyoTitle1} 1"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Text("${intl.yoyo1Title2}"),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.yoyo1Title3}"),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Text("${intl.sex} :")),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: CustomInput(
                          // controller: VOController,
                          inputType: InputType.dropdown,
                          dropdownItems: ["${intl.male}", "${intl.female}"],
                        )),
                    Dimensions.horizontalSpacingLarge,
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text("${intl.yoyoInput1}:")),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: CustomInput(
                          controller: level,
                          inputType: InputType.text,
                        )),
                    Dimensions.horizontalSpacingLarge,
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text("${intl.yoyoInput2}:")),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: CustomInput(
                          controller: shuttles,
                          inputType: InputType.text,
                        )),
                    Dimensions.horizontalSpacingLarge,
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.25,
                  child: FilledButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.amber.shade400)),
                      onPressed: () {
                        setState(() {
                          int distance = distTOTAL[int.parse(level.text)] +
                              (int.parse(shuttles.text) * 40 - 40);
                          double calcval = (distance * 0.0084 + 36.4);

                          distanceResult = distance;
                          calcvalResult = calcval.toStringAsFixed(1);
                        });
                        //   getResult(VOController.text, context);
                      },
                      child: Text("${intl.calcul}")),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.yOURRESULTS}"),
                Dimensions.verticalSpacingExtraLarge,
                Column(
                  children: [
                    Text("${intl.yoyoOutput1}: $distanceResult"),
                    Text(
                        "${intl.vO2max}: $calcvalResult ${intl.ml}/${intl.kg}/${intl.min}"),
                    Text("${intl.yoyoOutput2}: "),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.yoyo1Title4}"),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.yoyo1Title5}"),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.yoyo1Title6}"),
                Dimensions.verticalSpacingExtraLarge,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
