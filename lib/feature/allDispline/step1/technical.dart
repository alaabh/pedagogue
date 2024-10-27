// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pedagogue/feature/allDispline/step1/individualTactic.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../../shared/widget/custom_input.dart';

class TechnicalStep1 extends StatefulWidget {
  final List<String> controllerPreparationPhysiqueList;
  const TechnicalStep1(
      {super.key, required this.controllerPreparationPhysiqueList});

  @override
  State<TechnicalStep1> createState() => _TechnicalStep1State();
}

class _TechnicalStep1State extends State<TechnicalStep1> {
  final List<String> titleList = [
    intl.technical1,
    intl.technical2,
    intl.technical3,
    intl.technical4,
    intl.technical5,
    intl.technical6,
  ];
  List<TextEditingController> controllerList = [];
  final TextEditingController _CorrectExecution = TextEditingController();
  final TextEditingController _AccuracyConsistency = TextEditingController();
  final TextEditingController _Coordination = TextEditingController();
  final TextEditingController _TechnicalTransformation =
      TextEditingController();
  final TextEditingController _MotorAcquisition = TextEditingController();
  final TextEditingController _StabilizationOfAchievements =
      TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    controllerList = [
      _CorrectExecution,
      _AccuracyConsistency,
      _Coordination,
      _TechnicalTransformation,
      _MotorAcquisition,
      _StabilizationOfAchievements,
    ];
    super.initState();
  }

  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.technical),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: GridView.count(
                      crossAxisCount: 2,

                      childAspectRatio: MediaQuery.of(context).size.width *
                          0.0035, // Adjust based on your needs
                      children: List.generate(
                        controllerList.length,
                        (index) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: CustomInput(
                                controller: controllerList[index],
                                hint: intl.selectThetype,
                                title: titleList[index],
                                inputType: InputType.dropdown,
                                dropdownItems:  [
                                   intl.mAJ,
                                 intl.iMP,
                                 intl.mOD,
                                 intl.lOW,
                                 intl.nA,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.06,
                          width: MediaQuery.sizeOf(context).width * 0.3,
                          child: FilledButton(
                            onPressed: () => Navigator.of(context)..pop(),
                            child: isRtl
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.keyboard_arrow_right),
                                      Text(intl.back),
                                    ],
                                  )
                                : Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Add space between icon and text
                                      Icon(Icons.keyboard_arrow_left),

                                      Text(intl.back),
                                    ],
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.06,
                          width: MediaQuery.sizeOf(context).width * 0.3,
                          child: FilledButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => IndividualTactic(
                                    controllerTechnicalList: [
                                      _CorrectExecution.text,
                                      _AccuracyConsistency.text,
                                      _Coordination.text,
                                      _TechnicalTransformation.text,
                                      _MotorAcquisition.text,
                                      _StabilizationOfAchievements.text,
                                    ],
                                    controllerPreparationPhysiqueList: widget
                                        .controllerPreparationPhysiqueList,
                                  ),
                                ),
                              );
                            },
                            child: isRtl
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.keyboard_arrow_left),
                                      Text(intl.next),
                                    ],
                                  )
                                : Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Add space between icon and text
                                      Icon(Icons.keyboard_arrow_right),

                                      Text(intl.next),
                                    ],
                                  ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
