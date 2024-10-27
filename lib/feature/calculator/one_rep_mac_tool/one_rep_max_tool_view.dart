import 'package:flutter/material.dart';
import 'package:pedagogue/feature/calculator/one_rep_mac_tool/progress_widget.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';

import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/CustomizedCounter.dart';

class OneRepMAxToolView extends StatefulWidget {
  const OneRepMAxToolView({super.key});

  @override
  State<OneRepMAxToolView> createState() => _OneRepMAxToolViewState();
}

class _OneRepMAxToolViewState extends State<OneRepMAxToolView> {
  final param1 = 1.0278;
  final param2 = 0.0278;
  final param3 = 0.75;
  final maxReps = 10;
  int oneRepMax = 0;

  String? _character = "";
  TextEditingController nrOfReps = TextEditingController(text: "1");
  TextEditingController weight = TextEditingController(text: "0");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.oneRepMaxTool),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(intl.oneRepMaxToolParagraphe1),
            ),
            Dimensions.verticalSpacingExtraLarge,
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(intl.oneRepMaxToolParagraphe2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Radio<String?>(
                      value: "${intl.pounds}",
                      groupValue: _character,
                      onChanged: (String? value) {
                        setState(() {
                          _character = value;

                          print(_character);
                        });
                      },
                    ),
                    Text("${intl.pounds}")
                  ],
                ),
                Row(
                  children: [
                    Radio<String?>(
                      value: "${intl.kg}",
                      groupValue: _character,
                      onChanged: (String? value) {
                        setState(() {
                          _character = value;

                          print(_character);
                        });
                      },
                    ),
                    Text("${intl.kilogram}")
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: CustomizedCounter(
                        title: "${intl.numberofreps}:",
                        controller: nrOfReps,
                        max: 10,
                      )),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: CustomInput(
                        controller: weight,
                        title: "${intl.weightlifted}:",
                        inputType: InputType.text)),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04,
                  ),
                  child: FilledButton(
                      child: Text(intl.go),
                      onPressed: () {
                        var weigthchange = 0.0;
                        setState(() {
                          if (_character == "${intl.pounds}") {
                            weigthchange = int.parse(weight.text) / 2.20462;
                          }

                          if (_character == "${intl.kg}") {
                            weigthchange = int.parse(weight.text) * 2.20462;
                          }
                          print("weigthchange :$weigthchange");
                          print("we :${int.parse(weight.text)}");
                          print("we :${int.parse(nrOfReps.text)}");

                          if (int.parse(nrOfReps.text) < maxReps) {
                            oneRepMax = (weigthchange /
                                    (param1 -
                                        param2 * int.parse(nrOfReps.text)))
                                .ceil();
                            print((weigthchange /
                                    (param1 -
                                        param2 * int.parse(nrOfReps.text)))
                                .ceil());
                          } else if (int.parse(nrOfReps.text) == maxReps) {
                            oneRepMax = (weigthchange / param3).ceil();

                            print((weigthchange / param3).ceil());
                          }
                          // print(oneRepMax);
                        });
                      }),
                )
              ],
            ),
            Dimensions.verticalSpacingExtraLarge,
            Dimensions.verticalSpacingExtraLarge,
            Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0XFFFFAB40)),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Center(
                    child: Text(
                        "${intl.youronerepmaxis}: $oneRepMax ${intl.pounds}"))),
            Dimensions.verticalSpacingExtraLarge,
            Dimensions.verticalSpacingExtraLarge,
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProgressWidget(
                        label: "${(oneRepMax * 0.5).ceil()} $_character",
                        value: 50),
                    ProgressWidget(
                        label: "${(oneRepMax * 0.55).ceil()} $_character",
                        value: 55),
                    ProgressWidget(
                        label: "${(oneRepMax * 0.6).ceil()} $_character",
                        value: 60),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProgressWidget(
                        label: "${(oneRepMax * 0.65).ceil()} $_character",
                        value: 65),
                    ProgressWidget(
                        label: "${(oneRepMax * 0.7).ceil()} $_character",
                        value: 70),
                    ProgressWidget(
                        label: "${(oneRepMax * 0.75).ceil()} $_character",
                        value: 75),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProgressWidget(
                        label: "${(oneRepMax * 0.8).ceil()} $_character",
                        value: 80),
                    ProgressWidget(
                        label: "${(oneRepMax * 0.85).ceil()} $_character",
                        value: 85),
                    ProgressWidget(
                        label: "${(oneRepMax * 0.90).ceil()} $_character",
                        value: 90),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProgressWidget(
                        label: "${(oneRepMax * 0.95).ceil()} $_character",
                        value: 95),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
