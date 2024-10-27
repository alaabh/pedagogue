import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../controller/proteinCalculatorController/protein_calculator_controller.dart';
import '../../shared/widget/custom_button.dart';
import '../../shared/widget/custom_input.dart';

class ProteinCalculatorView extends StatefulWidget {
  const ProteinCalculatorView({super.key});

  @override
  State<ProteinCalculatorView> createState() => _ProteinCalculatorViewState();
}

class _ProteinCalculatorViewState extends State<ProteinCalculatorView> {
  TextEditingController ageController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController heigthSystemController = TextEditingController();
  TextEditingController weightSystemController = TextEditingController();
  TextEditingController heightTensController = TextEditingController();
  TextEditingController heightUnitsController = TextEditingController();
  TextEditingController weigthController = TextEditingController();
  TextEditingController goalController = TextEditingController();
  TextEditingController activityController = TextEditingController();
  ProteinCalculatorController proteinCalculatorControlle =
      ProteinCalculatorController();
  bool proteinLoader = false;
  String? proteinIntake = "";
  //TextEditingController ageController = TextEditingController();
  String x = "";
  late ProteinCalculatorController proteinCalculatorController;

  /*  Future<void> loadData() async {
    ProteinCalculatorModel proteinCalculatorModel = ProteinCalculatorModel(
      sex: sexController.text=="Male" ?"M":"F",
      heightSystem: heigthSystemController.text=="Feet" ?"feet":"meters",
      heightTens: heightTensController.text,
      heightUnits: heightUnitsController.text,
      age: ageController.text,
      weightSystem: weightSystemController.text=="Pounds"?"pounds":"kilogram",
      goal: goalController.text=="Maintain Current Weight"?"maintenance":goalController.text=="Lose Weight"?"fat-loss":"gainz",
      activity: activityController.text,
      weight: weigthController.text,
    );
    await proteinCalculatorControlle.add(proteinCalculatorModel);

    setState(() {
      proteinIntake =
          proteinCalculatorControlle.apiResponse.value.item!.proteinIntake;
    });
    proteinLoader = true;
  } */

  @override
  void initState() {
    // TODO: implement initState
    heigthSystemController.addListener(_onHeightChanged);
    weigthController.addListener(_onHeightChanged);
    proteinCalculatorController = Get.put(ProteinCalculatorController());
    super.initState();
  }

  @override
  void dispose() {
    // Remove listener and dispose controller when widget is disposed
    heigthSystemController.removeListener(_onHeightChanged);
    heigthSystemController.dispose();
    proteinCalculatorController.protein.value.proteinIntake = null;
    super.dispose();
  }

  void _onHeightChanged() {
    // Trigger UI update when the controller's value changes
    setState(() {
      // This will rebuild the widget with the updated controller value.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.proteinIntakeCalculator}"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: CustomInput(
                      controller: ageController,
                      hint: "${intl.age}",
                      title: "${intl.age}",
                      inputType: InputType.text,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: CustomInput(
                      title: "${intl.sex}",
                      inputType: InputType.dropdown,
                      dropdownItems: [
                        "${intl.male}",
                        "${intl.female}",
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: CustomInput(
                      controller: heigthSystemController,
                      title: "${intl.height}",
                      inputType: InputType.dropdown,
                      dropdownItems: [
                        "${intl.feet}",
                        "${intl.meters}",
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: CustomInput(
                      controller: heightTensController,
                      hint: heigthSystemController.text == "${intl.meters}"
                          ? " "
                          : " ",
                      title: heigthSystemController.text == "${intl.meters}"
                          ? "${intl.meters}"
                          : "${intl.feet}",
                      inputType: InputType.text,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: CustomInput(
                      controller: heightUnitsController,
                      hint: heigthSystemController.text == "${intl.meters}"
                          ? " "
                          : " ",
                      title: heigthSystemController.text == "${intl.meters}"
                          ? "${intl.centimeters}"
                          : "${intl.inches}",
                      inputType: InputType.text,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: CustomInput(
                      controller: weightSystemController,
                      title: "${intl.weigth}",
                      inputType: InputType.dropdown,
                      dropdownItems: [
                        "${intl.pounds}",
                        "${intl.kilogram}",
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: CustomInput(
                      controller: weigthController,
                      hint: " ",
                      title: weigthController.text == "${intl.pounds}"
                          ? "${intl.pounds}"
                          : "${intl.kilogram}",
                      inputType: InputType.text,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: CustomInput(
                      controller: heigthSystemController,
                      hint: "${intl.gOAL}",
                      title: "${intl.gOAL}",
                      inputType: InputType.dropdown,
                      dropdownItems: [
                        "${intl.gOAL1}",
                        "${intl.gOAL2}",
                        "${intl.gOAL3}",
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: CustomInput(
                      controller: heigthSystemController,
                      hint: "${intl.cURRENTACTIVITYLEVEL}",
                      title: "${intl.cURRENTACTIVITYLEVEL}",
                      inputType: InputType.dropdown,
                      dropdownItems: [
                        "${intl.cURRENTACTIVITYLEVEL1}",
                        "${intl.cURRENTACTIVITYLEVEL2}",
                        "${intl.cURRENTACTIVITYLEVEL3}",
                        "${intl.cURRENTACTIVITYLEVEL4}",
                        "${intl.cURRENTACTIVITYLEVEL5}",
                      ],
                    ),
                  ),
                ],
              ),
              Obx(() {
                if (proteinCalculatorController.isLoading.value) {
                  print("loading");
                  return Center(child: CircularProgressIndicator());
                } else if (proteinCalculatorController
                        .protein.value.proteinIntake ==
                    null) {
                  return Container(
                    height: 0,
                  );
                } else {
                  return SizedBox(
                    height: 30,
                    child: Text(
                      "Protein Intake : ${proteinCalculatorController.protein.value.proteinIntake.toString()}g",
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }
              }),
              CustomButton(
                onPressed: () {
                  proteinCalculatorController.fetchProteins(
                    sexController.text == "${intl.male}" ? "M" : "F",
                    heigthSystemController.text == "${intl.feet}"
                        ? "feet"
                        : "meters",
                    heightTensController.text,
                    heightUnitsController.text,
                    ageController.text,
                    weightSystemController.text == "${intl.pounds}"
                        ? "pounds"
                        : "kilogram",
                    goalController.text == "${intl.gOAL1}"
                        ? "maintenance"
                        : goalController.text == "${intl.gOAL2}"
                            ? "fat-loss"
                            : "gainz",
                    activityController.text,
                    weigthController.text,
                  );
                },
                text: '${intl.calculate}',
                width: MediaQuery.of(context).size.width * 0.35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
