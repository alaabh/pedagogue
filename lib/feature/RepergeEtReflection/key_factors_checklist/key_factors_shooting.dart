import 'package:flutter/material.dart';
import 'package:pedagogue/feature/RepergeEtReflection/key_factors_checklist/key_factors_creating_space.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';

class KeyFactorsShooting extends StatefulWidget {
  final TextEditingController joueurController;
  final TextEditingController dateController;
  final TextEditingController team1Controller;
  final TextEditingController ageController;
  final TextEditingController coachController;
  final TextEditingController footController;
  final Map<String, String> titleListPositions;
  final Map<String, dynamic> titleListPassing;
  final Map<String, dynamic> passingControllerList;

  const KeyFactorsShooting(
      {super.key,
      required this.titleListPassing,
      required this.passingControllerList,
      required this.joueurController,
      required this.dateController,
      required this.team1Controller,
      required this.ageController,
      required this.coachController,
      required this.footController,
      required this.titleListPositions});

  @override
  State<KeyFactorsShooting> createState() => _KeyFactorsShootingState();
}

class _KeyFactorsShootingState extends State<KeyFactorsShooting> {
  Map<String, dynamic> titleList = {};
  Map<String, String> shootingList = {
    "title1": "${intl.keyfactorsShooting1}",
    "title2": "${intl.keyfactorsShooting2}",
    "title3": "${intl.keyfactorsShooting3}",
    "title4": "${intl.keyfactorsShooting4}",
  };
  Map<String, String> headingList = {
    "title1": "${intl.keyfactorsShooting7}",
    "title2": "${intl.keyfactorsShooting8}",
    "title3": "${intl.keyfactorsShooting9}",
  };
  Map<String, dynamic> shootingControllerList = {
    "${intl.keyfactorsShooting1}you": TextEditingController(),
    "${intl.keyfactorsShooting2}you": TextEditingController(),
    "${intl.keyfactorsShooting3}you": TextEditingController(),
    "${intl.keyfactorsShooting4}you": TextEditingController(),
    "${intl.keyfactorsShooting6}you": TextEditingController(),
    "${intl.keyfactorsShooting7}you": TextEditingController(),
    "${intl.keyfactorsShooting8}you": TextEditingController(),
    "${intl.keyfactorsShooting9}you": TextEditingController(),
    "${intl.keyfactorsShooting1}coach": TextEditingController(),
    "${intl.keyfactorsShooting2}coach": TextEditingController(),
    "${intl.keyfactorsShooting3}coach": TextEditingController(),
    "${intl.keyfactorsShooting4}coach": TextEditingController(),
    "${intl.keyfactorsShooting6}coach": TextEditingController(),
    "${intl.keyfactorsShooting7}coach": TextEditingController(),
    "${intl.keyfactorsShooting8}coach": TextEditingController(),
    "${intl.keyfactorsShooting9}coach": TextEditingController(),
  };

  @override
  void initState() {
    super.initState();
    print(widget.passingControllerList);
    titleList = {
      "${intl.keyfactorsShootingList}": shootingList,
      "${intl.keyfactorsShooting5}": headingList,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.keyfactorsShootingList}")),
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
                                        controller: shootingControllerList[
                                            "${entry.value}you"],
                                        hint: "${intl.yOURRATING}",
                                        title: "${intl.yOURRATING}",
                                        inputType: InputType.text,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: CustomInput(
                                        controller: shootingControllerList[
                                            "${entry.value}coach"],
                                        hint: "${intl.cOACHRATING}",
                                        title: "${intl.cOACHRATING}",
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
                        builder: (context) => KeyFactorsCreateSpacing(
                          titleShootingList: titleList,
                          shootingControllerList: shootingControllerList,
                          joueurController: widget.joueurController,
                          dateController: widget.dateController,
                          team1Controller: widget.team1Controller,
                          ageController: widget.ageController,
                          coachController: widget.coachController,
                          footController: widget.footController,
                          titleListPositions: widget.titleListPositions,
                          titleListPassing: widget.titleListPassing,
                          passingControllerList: widget.passingControllerList,
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
