// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pedagogue/feature/allDispline/step1/technical.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../../shared/widget/custom_input.dart';

class PreparationPhysiqueStep1 extends StatefulWidget {
  const PreparationPhysiqueStep1({super.key});

  @override
  State<PreparationPhysiqueStep1> createState() =>
      _PreparationPhysiqueStep1State();
}

class _PreparationPhysiqueStep1State extends State<PreparationPhysiqueStep1> {
  final List<String> titleList = [
    intl.preparationPhysique1,
    intl.preparationPhysique2,
    intl.preparationPhysique3,
    intl.preparationPhysique4,
    intl.preparationPhysique5,
    intl.preparationPhysique6,
    intl.preparationPhysique7,
    intl.preparationPhysique8,
    intl.preparationPhysique9,
    intl.preparationPhysique10,
    intl.preparationPhysique11,
    intl.preparationPhysique12,
    intl.preparationPhysique13,
    intl.preparationPhysique14,
    intl.preparationPhysique15,
    intl.preparationPhysique16,
    intl.preparationPhysique17,
  ];
  List<TextEditingController> controllerList = [];
  final TextEditingController _AlacticAnaerobicPower = TextEditingController();
  final TextEditingController _AlacticAnaerobicCapacity =
      TextEditingController();
  final TextEditingController _LacticAnaerobicPower = TextEditingController();
  final TextEditingController _LacticAnaerobicCapacity =
      TextEditingController();
  final TextEditingController _MaximumAerobicPower = TextEditingController();
  final TextEditingController _AerobicEndurance = TextEditingController();
  final TextEditingController _Acceleration = TextEditingController();
  final TextEditingController _OptimalSpeed = TextEditingController();
  final TextEditingController _EnduranceSpeed = TextEditingController();
  final TextEditingController _Agility = TextEditingController();
  final TextEditingController _Coordination = TextEditingController();
  final TextEditingController _Equilibrium = TextEditingController();
  final TextEditingController _MaximumForce = TextEditingController();
  final TextEditingController _MaximumStrength = TextEditingController();
  final TextEditingController _EnduranceStrength = TextEditingController();
  final TextEditingController _MusclePower = TextEditingController();
  final TextEditingController _Flexibility = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    controllerList = [
      _AlacticAnaerobicPower,
      _AlacticAnaerobicCapacity,
      _LacticAnaerobicPower,
      _LacticAnaerobicCapacity,
      _MaximumAerobicPower,
      _AerobicEndurance,
      _Acceleration,
      _OptimalSpeed,
      _EnduranceSpeed,
      _Agility,
      _Coordination,
      _Equilibrium,
      _MaximumForce,
      _MaximumStrength,
      _EnduranceStrength,
      _MusclePower,
      _Flexibility,
    ];

    super.initState();
  }

  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.preparationPhysique),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Column(
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
                                  dropdownItems: [
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
                            width: MediaQuery.sizeOf(context).width * 0.35,
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
                            width: MediaQuery.sizeOf(context).width * 0.35,
                            child: FilledButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => TechnicalStep1(
                                      controllerPreparationPhysiqueList: [
                                        _AlacticAnaerobicPower.text,
                                        _AlacticAnaerobicCapacity.text,
                                        _LacticAnaerobicPower.text,
                                        _LacticAnaerobicCapacity.text,
                                        _MaximumAerobicPower.text,
                                        _AerobicEndurance.text,
                                        _Acceleration.text,
                                        _OptimalSpeed.text,
                                        _EnduranceSpeed.text,
                                        _Agility.text,
                                        _Coordination.text,
                                        _Equilibrium.text,
                                        _MaximumForce.text,
                                        _MaximumStrength.text,
                                        _EnduranceStrength.text,
                                        _MusclePower.text,
                                        _Flexibility.text,
                                      ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
