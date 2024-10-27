import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/shared/widget/custom_button.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';

import '../../../controller/biological_age_controller.dart';
import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';

class BiologicalAgeView extends StatefulWidget {
  const BiologicalAgeView({super.key});

  @override
  State<BiologicalAgeView> createState() => _BiologicalAgeViewState();
}

class _BiologicalAgeViewState extends State<BiologicalAgeView> {
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();
  TextEditingController value3 = TextEditingController();
  TextEditingController value4 = TextEditingController();
  TextEditingController value5 = TextEditingController();
  TextEditingController value6 = TextEditingController();
  TextEditingController value7 = TextEditingController();
  TextEditingController value8 = TextEditingController();
  TextEditingController value9 = TextEditingController();
  TextEditingController value10 = TextEditingController();
  TextEditingController value11 = TextEditingController();
  TextEditingController value12 = TextEditingController();
  TextEditingController value13 = TextEditingController();
  TextEditingController value14 = TextEditingController();
  TextEditingController value15 = TextEditingController();
  TextEditingController value16 = TextEditingController();
  TextEditingController value17 = TextEditingController();
  TextEditingController value18 = TextEditingController();
  TextEditingController value19 = TextEditingController();
  TextEditingController value20 = TextEditingController();
  TextEditingController value21 = TextEditingController();
  TextEditingController value22 = TextEditingController();
  TextEditingController value23 = TextEditingController();
  TextEditingController value24 = TextEditingController();
  TextEditingController value25 = TextEditingController();
  TextEditingController value26 = TextEditingController();
  TextEditingController value27 = TextEditingController();
  TextEditingController value28 = TextEditingController();
  TextEditingController value29 = TextEditingController();
  TextEditingController value30 = TextEditingController();
  TextEditingController value31 = TextEditingController();
  TextEditingController value32 = TextEditingController();
  TextEditingController value33 = TextEditingController();
  TextEditingController value34 = TextEditingController();
  TextEditingController value35 = TextEditingController();
  TextEditingController value36 = TextEditingController();
  TextEditingController value37 = TextEditingController();
  TextEditingController ageController = TextEditingController();

  final BiologicalAgeController biologicalAgeControllerController =
      Get.put(BiologicalAgeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.biologicalage),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomInput(
                  controller: value1,
                  title: "${intl.sex}",
                  inputType: InputType.dropdown,
                  dropdownItems: ["${intl.sexValue2}", "${intl.sexValue3}"],
                ),
                CustomInput(
                  controller: value2,
                  title: "${intl.race}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.raceValue2}",
                    "${intl.raceValue3}",
                    "${intl.raceValue4}",
                    "${intl.raceValue5}",
                    "${intl.raceValue6}",
                    "${intl.raceValue7}",
                  ],
                ),
                CustomInput(
                  controller: value3,
                  title: "${intl.longevity}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.longevityValue2}",
                    "${intl.longevityValue3}",
                    "${intl.longevityValue4}",
                    "${intl.longevityValue5}",
                    "${intl.longevityValue6}",
                  ],
                ),
                CustomInput(
                  controller: value4,
                  title: "${intl.education}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.educationValue2}",
                    "${intl.educationValue3}",
                    "${intl.educationValue4}",
                    "${intl.educationValue5}",
                  ],
                ),
                CustomInput(
                  controller: value5,
                  title: "${intl.sleep}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.sleepValue2}",
                    "${intl.sleepValue3}",
                    "${intl.sleepValue4}",
                    "${intl.sleepValue5}",
                    "${intl.sleepValue6}",
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.biologicalageTitle1}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),

/////////////////////////////////////////////////////////////////

                CustomInput(
                  controller: value6,
                  title: "${intl.hdl}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.hdlValue2}",
                    "${intl.hdlValue3}",
                    "${intl.hdlValue4}",
                    "${intl.hdlValue5}",
                    "${intl.hdlValue6}",
                  ],
                ),
                CustomInput(
                  controller: value7,
                  title: "${intl.blood}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.bloodValue2}",
                    "${intl.bloodValue3}",
                    "${intl.bloodValue4}",
                    "${intl.bloodValue5}",
                    "${intl.bloodValue6}",
                  ],
                ),
                CustomInput(
                  controller: value8,
                  title: "${intl.band}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.bandValue2}",
                    "${intl.bandValue3}",
                    "${intl.bandValue4}",
                    "${intl.bandValue5}",
                    "${intl.bandValue6}",
                  ],
                ),
                CustomInput(
                  controller: value9,
                  title: "${intl.heredity}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.heredityValue2}",
                    "${intl.heredityValue3}",
                    "${intl.heredityValue4}",
                    "${intl.heredityValue5}",
                    "${intl.heredityValue6}",
                  ],
                ),
                CustomInput(
                  controller: value10,
                  title: "${intl.index}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.indexValue2}",
                    "${intl.indexValue3}",
                    "${intl.indexValue4}",
                    "${intl.indexValue5}",
                  ],
                ),
                CustomInput(
                  controller: value11,
                  title: "${intl.stress}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.stressValue2}",
                    "${intl.stressValue3}",
                    "${intl.stressValue4}",
                    "${intl.stressValue5}",
                    "${intl.stressValue6}",
                  ],
                ),
                CustomInput(
                  controller: value12,
                  title: "${intl.phy}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.phyValue2}",
                    "${intl.phyValue3}",
                    "${intl.phyValue4}",
                    "${intl.phyValue5}",
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.biologicalageTitle2}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                CustomInput(
                  controller: value13,
                  title: "${intl.tests}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.testsValue2}",
                    "${intl.testsValue3}",
                    "${intl.testsValue4}",
                    "${intl.testsValue5}",
                  ],
                ),
                CustomInput(
                  controller: value14,
                  title: "${intl.heart}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.heartValue2}",
                    "${intl.heartValue3}",
                    "${intl.heartValue4}",
                    "${intl.heartValue5}",
                    "${intl.heartValue6}",
                  ],
                ),

                CustomInput(
                  controller: value16,
                  title: "${intl.lungs}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.lungsValue2}",
                    "${intl.lungsValue3}",
                    "${intl.lungsValue4}",
                    "${intl.lungsValue5}",
                    "${intl.lungsValue6}",
                  ],
                ),
                CustomInput(
                  controller: value17,
                  title: "${intl.digSys}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.digSysValue2}",
                    "${intl.digSysValue3}",
                    "${intl.digSysValue4}",
                    "${intl.digSysValue5}",
                    "${intl.digSysValue6}",
                  ],
                ),
                CustomInput(
                  controller: value18,
                  title: "${intl.diabetes}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.diabetesValue2}",
                    "${intl.daibetesValue3}",
                    "${intl.daibetesValue4})",
                    "${intl.daibetesValue5}",
                    "${intl.daibetesValue6}",
                    "${intl.daibetesValue7}",
                  ],
                ),
                CustomInput(
                  controller: value19,
                  title: "${intl.drug}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.drugValue2}",
                    "${intl.drugValue3}",
                    "${intl.drugValue4}",
                    "${intl.drugValue5}",
                    "${intl.drugValue6}",
                  ],
                ),
                /////////////////////////////////////////////////////////////////////////
                CustomInput(
                  controller: value20,
                  title: "${intl.women}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.womenValue2}",
                    "${intl.womenValue3}",
                    "${intl.womenValue4}",
                    "${intl.womenValue5}",
                    "${intl.womenValue6}",
                  ],
                ),
                CustomInput(
                  controller: value21,
                  title: "${intl.pill}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.pillValue2}",
                    "${intl.pillValue3}",
                    "${intl.pillValue4}",
                    "${intl.pillValue5}",
                    "${intl.pillValue6}",
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.biologicalageTitle3}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                /////////////////////////////////////////////////////////////
                ///

                CustomInput(
                  controller: value22,
                  title: "${intl.breakfast}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.breakValue2}",
                    "${intl.breakValue3}",
                    "${intl.breakValue4}",
                    "${intl.breakValue5}",
                    "${intl.breakValue6}",
                  ],
                ),
                CustomInput(
                  controller: value23,
                  title: "${intl.daily}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.dailyValue2}",
                    "${intl.dailyValue3}",
                    "${intl.dailyValue4}",
                    "${intl.dailyValue5}",
                  ],
                ),
                CustomInput(
                  controller: value24,
                  title: "${intl.fruit}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.fruitValue2}",
                    "${intl.fruitValue3}",
                    "${intl.fruitValue4}",
                    "${intl.fruitValue5}",
                  ],
                ),
                CustomInput(
                  controller: value25,
                  title: "${intl.greases}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.greasesValue2}",
                    "${intl.greasesValue3}",
                    "${intl.greasesValue4}",
                    "${intl.greasesValue5}",
                    "${intl.greasesValue6}",
                    "${intl.greasesValue7}",
                  ],
                ),
                CustomInput(
                  controller: value26,
                  title: "${intl.refood}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.refoodValue2}",
                    "${intl.refoodValue3}",
                    "${intl.refoodValue4}",
                    "${intl.refoodValue5}",
                  ],
                ),
                CustomInput(
                  controller: value27,
                  title: "${intl.alcohol}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.alcoholValue2}",
                    "${intl.alcoholValue3}",
                    "${intl.alcoholValue4}",
                    "${intl.alcoholValue5}",
                    "${intl.alcoholValue6}",
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.biologicalageTitle4}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                //////////////////////////////////////////
                ///
                ///
                //
                CustomInput(
                  controller: value28,
                  title: "${intl.happy}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.happyValue2}",
                    "${intl.happyValue3}",
                    "${intl.happyValue4}",
                    "${intl.happyValue5}",
                    "${intl.happyValue6}",
                  ],
                ),
                CustomInput(
                  controller: value29,
                  title: "${intl.dep}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.depValue2}",
                    "${intl.depValue3}",
                    "${intl.depValue4}",
                    "${intl.depValue5}",
                    "${intl.depValue6}",
                  ],
                ),
                CustomInput(
                  controller: value30,
                  title: "${intl.anx}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.anxValue2}",
                    "${intl.anxValue3}",
                    "${intl.anxValue4}",
                    "${intl.anxValue5}",
                    "${intl.anxValue6}",
                  ],
                ),
                CustomInput(
                  controller: value31,
                  title: "${intl.rel}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.relValue2}",
                    "${intl.relValue3}",
                    "${intl.relValue4}",
                    "${intl.relValue5}",
                    "${intl.relValue6}",
                  ],
                ),
                CustomInput(
                  controller: value32,
                  title: "${intl.love}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.loveValue2}",
                    "${intl.loveValue3}",
                    "${intl.loveValue4}",
                    "${intl.loveValue5}",
                    "${intl.loveValue6}",
                  ],
                ),
                CustomInput(
                  controller: value33,
                  title: "${intl.job}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.jobValue2}",
                    "${intl.jobValue3}",
                    "${intl.jobValue4}",
                    "${intl.jobValue5}",
                  ],
                ),
                CustomInput(
                  controller: value34,
                  title: "${intl.social}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.socialValue2}",
                    "${intl.socialValue3}",
                    "${intl.socialValue4}",
                    "${intl.socialValue5}",
                    "${intl.socialValue6}",
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.biologicalageTitle5}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                //////////////////////////////////////////////////////////////////
                ///
                //

                CustomInput(
                  controller: value35,
                  title: "${intl.driv}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.drivValue2}",
                    "${intl.drivValue3}",
                    "${intl.drivValue4}",
                    "${intl.drivValue5}",
                  ],
                ),
                CustomInput(
                  controller: value36,
                  title: "${intl.seat}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.seatValue1}",
                    "${intl.seatValue2}",
                    "${intl.seatValue3}",
                    "${intl.seatValue4}",
                    "${intl.seatValue5}",
                  ],
                ),
                CustomInput(
                  controller: value37,
                  title: "${intl.risk}",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.riskValue2}",
                    "${intl.riskValue3}",
                    "${intl.riskValue4}",
                    "${intl.riskValue5}",
                    "${intl.riskValue6}",
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.biologicalageTitle6}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: CustomInput(
                        controller: ageController,
                        title: "${intl.currentAge}",
                        inputType: InputType.text,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.035,
                      ),
                      child: CustomButton(
                          width: MediaQuery.of(context).size.width * 0.35,
                          text: "${intl.calculate}",
                          onPressed: () {
                            biologicalAgeControllerController
                                .fetchBiologicalAge(
                              value1.text,
                              ageController.text,
                              value2.text,
                              value3.text,
                              value4.text,
                              value5.text,
                              value6.text,
                              value7.text,
                              value8.text,
                              value9.text,
                              value10.text,
                              value11.text,
                              value12.text,
                              value13.text,
                              value14.text,
                              value15.text,
                              value16.text,
                              value17.text,
                              value18.text,
                              value19.text,
                              value20.text,
                              value21.text,
                              value22.text,
                              value23.text,
                              value24.text,
                              value25.text,
                              value26.text,
                              value27.text,
                              value28.text,
                              value29.text,
                              value30.text,
                              value31.text,
                              value32.text,
                              value33.text,
                              value34.text,
                              value35.text,
                            );
                          }),
                    )
                  ],
                ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Obx(() {
                    if (biologicalAgeControllerController.isLoading.value) {
                      print("loading");
                      return Center(child: CircularProgressIndicator());
                    } else if (biologicalAgeControllerController
                            .biologicalAge.value.personalT ==
                        null) {
                      print("ba5");
                      return Container();
                    } else {
                      return SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                        "personalT:${biologicalAgeControllerController.biologicalAge.value.personalT}"),
                                    Text(
                                        "cadT:${biologicalAgeControllerController.biologicalAge.value.cadT}"),
                                    Text(
                                        "medicalT:${biologicalAgeControllerController.biologicalAge.value.medicalT}"),
                                    Text(
                                        "dietT:${biologicalAgeControllerController.biologicalAge.value.dietT}"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                        "psychT:${biologicalAgeControllerController.biologicalAge.value.psychT}"),
                                    Text(
                                        "safetyT:${biologicalAgeControllerController.biologicalAge.value.safetyT}"),
                                    Text(
                                        "total:${biologicalAgeControllerController.biologicalAge.value.total}"),
                                    Text(
                                        "expectancy:${biologicalAgeControllerController.biologicalAge.value.expectancy}"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                        "healthage:${biologicalAgeControllerController.biologicalAge.value.healthage}"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                        "diferencia:${biologicalAgeControllerController.biologicalAge.value.diferencia}"),
                                  ],
                                ),
                              ],
                            ),
                          ));
                    }
                  }),
                ),
                Dimensions.verticalSpacingSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
