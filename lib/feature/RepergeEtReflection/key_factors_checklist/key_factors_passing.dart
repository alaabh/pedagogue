import 'package:flutter/material.dart';
import 'package:pedagogue/feature/RepergeEtReflection/key_factors_checklist/key_factors_shooting.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';

class KeyFactorsPassing extends StatefulWidget {
    final TextEditingController joueurController ;
 final TextEditingController dateController ;
 final TextEditingController team1Controller ;
 final TextEditingController ageController ;
 final TextEditingController coachController ;
 final TextEditingController footController ;
  final Map<String, String> titleListPositions;
  const KeyFactorsPassing({super.key, required this.titleListPositions, required this.joueurController, required this.dateController, required this.team1Controller, required this.ageController, required this.coachController, required this.footController});

  @override
  State<KeyFactorsPassing> createState() => _KeyFactorsPassingState();
}

class _KeyFactorsPassingState extends State<KeyFactorsPassing> {
  Map<String, dynamic> titleList = {};
  Map<String, String> shortList = {
    "title1": "${intl.keyfactorsPassing2}",
    "title2": "${intl.keyfactorsPassing3}",
    "title3": "${intl.keyfactorsPassing4}",
    "title4": "${intl.keyfactorsPassing5}",
    "title5": "${intl.keyfactorsPassing6}",
    "title6": "${intl.keyfactorsPassing7}",
  };
  Map<String, String> longList = {
    "title1": "${intl.keyfactorsPassing9}",
    "title2": "${intl.keyfactorsPassing10}",
    "title3": "${intl.keyfactorsPassing11}",
    "title4": "${intl.keyfactorsPassing12}",
    "title5": "${intl.keyfactorsPassing13}",
  };
  Map<String, String> swervList = {
    "title1": "${intl.keyfactorsPassing15}",
    "title2": "${intl.keyfactorsPassing16}",
    "title3": "${intl.keyfactorsPassing17}",
    "title4": "${intl.keyfactorsPassing18}",
  };
  Map<String, String> drivenList = {
    "title1": "${intl.keyfactorsPassing20}",
    "title2": "${intl.keyfactorsPassing21}",
  };
  Map<String, String> chipList = {
    "title1": "${intl.keyfactorsPassing23}",
    "title2": "${intl.keyfactorsPassing24}",
  };
  Map<String, dynamic> passingControllerList = {
    "${intl.keyfactorsPassing2}you": TextEditingController(),
    "${intl.keyfactorsPassing3}you": TextEditingController(),
    "${intl.keyfactorsPassing4}you": TextEditingController(),
    "${intl.keyfactorsPassing5}you": TextEditingController(),
    "${intl.keyfactorsPassing6}you": TextEditingController(),
    "${intl.keyfactorsPassing7}you": TextEditingController(),
    "${intl.keyfactorsPassing9}you": TextEditingController(),
    "${intl.keyfactorsPassing10}you": TextEditingController(),
    "${intl.keyfactorsPassing11}you": TextEditingController(),
    "${intl.keyfactorsPassing12}you": TextEditingController(),
    "${intl.keyfactorsPassing13}you": TextEditingController(),
    "${intl.keyfactorsPassing15}you": TextEditingController(),
    "${intl.keyfactorsPassing16}you": TextEditingController(),
    "${intl.keyfactorsPassing17}you": TextEditingController(),
    "${intl.keyfactorsPassing18}you": TextEditingController(),
    "${intl.keyfactorsPassing20}you": TextEditingController(),
    "${intl.keyfactorsPassing21}you": TextEditingController(),
    "${intl.keyfactorsPassing23}you": TextEditingController(),
    "${intl.keyfactorsPassing24}you": TextEditingController(),
    "${intl.keyfactorsPassing2}coach": TextEditingController(),
    "${intl.keyfactorsPassing3}coach": TextEditingController(),
    "${intl.keyfactorsPassing4}coach": TextEditingController(),
    "${intl.keyfactorsPassing5}coach": TextEditingController(),
    "${intl.keyfactorsPassing6}coach": TextEditingController(),
    "${intl.keyfactorsPassing7}coach": TextEditingController(),
    "${intl.keyfactorsPassing9}coach": TextEditingController(),
    "${intl.keyfactorsPassing10}coach": TextEditingController(),
    "${intl.keyfactorsPassing11}coach": TextEditingController(),
    "${intl.keyfactorsPassing12}coach": TextEditingController(),
    "${intl.keyfactorsPassing13}coach": TextEditingController(),
    "${intl.keyfactorsPassing15}coach": TextEditingController(),
    "${intl.keyfactorsPassing16}coach": TextEditingController(),
    "${intl.keyfactorsPassing17}coach": TextEditingController(),
    "${intl.keyfactorsPassing18}coach": TextEditingController(),
    "${intl.keyfactorsPassing20}coach": TextEditingController(),
    "${intl.keyfactorsPassing21}coach": TextEditingController(),
    "${intl.keyfactorsPassing23}coach": TextEditingController(),
    "${intl.keyfactorsPassing24}coach": TextEditingController(),
  };

  @override
  void initState() {
    super.initState();
    titleList = {
      "${intl.keyfactorsPassing1}": shortList,
      "${intl.keyfactorsPassing8}": longList,
      "${intl.keyfactorsPassing14}": swervList,
      "${intl.keyfactorsPassing19}": drivenList,
      "${intl.keyfactorsPassing22}": chipList,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.keyfactorsPassingList}")),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: titleList.entries.map((entry) {
                  Map<String, dynamic> list = entry.value;
                  return Column(
                    children: [
                      Dimensions.verticalSpacingExtraLarge,
                      Card(
                        color: AppColors.primaryColor,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(child: Center(child: Text(entry.key))),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: list.entries.map((entry) {
                          return Column(
                            children: [
                              Dimensions.verticalSpacingExtraLarge,
                              Text(
                                entry.value,
                                style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Dimensions.verticalSpacingExtraLarge,
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: CustomInput(
                                        controller: passingControllerList[
                                            "${entry.value}you"],
                                        hint: "${intl.keyfactorsPassing25}",
                                        title: "${intl.keyfactorsPassing25}",
                                        inputType: InputType.text,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: CustomInput(
                                        controller: passingControllerList[
                                            "${entry.value}coach"],
                                        hint: "${intl.keyfactorsPassing26}",
                                        title: "${intl.keyfactorsPassing26}",
                                        inputType: InputType.text,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  );
                }).toList(),
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomButton(
                  text: intl.next,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => KeyFactorsShooting(
                          titleListPassing: titleList,
                          passingControllerList: passingControllerList, joueurController: widget.joueurController, dateController: widget.dateController, team1Controller: widget.team1Controller, ageController: widget.ageController, coachController: widget.coachController, footController: widget.footController, titleListPositions: widget.titleListPositions,
                        ),
                      ),
                    );
                  }),
              Dimensions.verticalSpacingExtraLarge,
            ],
          ),
        ))));
  }
}
