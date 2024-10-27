import 'package:flutter/material.dart';
import 'package:pedagogue/feature/RepergeEtReflection/reflective_practice_template/reflective_practice_part2.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';

import '../../../controller/joueur_controller.dart';
import '../../../controller/team_controller.dart';
import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/loading_widget.dart';
import '../../../shared/widget/shimmer/radio_widget_list.dart';

class ReflectivePracticePart1 extends StatefulWidget {
  const ReflectivePracticePart1({super.key});

  @override
  State<ReflectivePracticePart1> createState() =>
      _ReflectivePracticePart1State();
}

class _ReflectivePracticePart1State extends State<ReflectivePracticePart1> {
  TeamController teamController = TeamController();
  JoueurController joueurController = JoueurController();
  String? eXITTICKETValue = "";

  bool teamLoader = false;

  List<String>? joueurList = [];    
  List<String>? teamList = [];
  Future<void> loadData() async {
    await teamController.getAll();
    await joueurController.getAll();

    setState(() {
      for (var element in teamController.apiResponse.value.itemList) {
        // print(element.name);
        teamList!.add(element.name.toString());
      }
      for (var element in joueurController.apiResponse.value.itemList) {
        // print(element.name);
        joueurList!.add("${element.firstName} ${element.lastName}");
      }
    });

    teamLoader = true;
  }

  final TextEditingController _Team = TextEditingController();
  final TextEditingController _Joueur = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController sessionController1 = TextEditingController();
  final TextEditingController sessionController2 = TextEditingController();
  final TextEditingController sessionController3 = TextEditingController();
  final TextEditingController needsController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Map<String, dynamic> titleList = {
    "${intl.reflectivePracticePart13}": "${intl.reflectivePracticePart19}",
    "${intl.reflectivePracticePart14}": "${intl.reflectivePracticePart110}",
    "${intl.reflectivePracticePart15}": "${intl.reflectivePracticePart111}",
    "${intl.reflectivePracticePart16}": "${intl.reflectivePracticePart112}",
    "${intl.reflectivePracticePart17}": "${intl.reflectivePracticePart113}",
  };

  Map<String, dynamic> controllers1 = {
     "${intl.reflectivePracticePart19}":TextEditingController(),
     "${intl.reflectivePracticePart110}":TextEditingController(),
     "${intl.reflectivePracticePart111}":TextEditingController(),
     "${intl.reflectivePracticePart112}":TextEditingController(),
     "${intl.reflectivePracticePart113}":TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.reflectivePracticePart1List}")),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              Dimensions.verticalSpacingExtraLarge,
              teamLoader == true
                  ? CustomInput(
                      controller: _Joueur,
                      hint: "${intl.select(intl.player)}",
                      title: intl.player,
                      inputType: InputType.dropdown,
                      dropdownItems: joueurList,
                    )
                  : LoadingWidget(),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: dateController,
                hint: "${intl.date}",
                title: "${intl.date}",
                inputType: InputType.date,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: timeController,
                hint: "${intl.time}",
                title: "${intl.time}",
                inputType: InputType.time,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Card(
                color: AppColors.primaryColor,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          child: Center(
                              child: Text("${intl.reflectivePracticePart11}"))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: sessionController1,
                hint: "1",
                title: "1",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: sessionController2,
                hint: "2",
                title: "2",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: sessionController3,
                hint: "3",
                title: "3",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Card(
                color: AppColors.primaryColor,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          child: Center(
                              child: Text("${intl.reflectivePracticePart12}"))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              TextField(
                keyboardType: TextInputType.multiline,
                controller: needsController,
                decoration: const InputDecoration(),
                autofocus: false,
                maxLines: null,
                minLines: 3,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: titleList.entries.map((entry) {
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
                      Dimensions.verticalSpacingExtraLarge,
                      Column(
                        children: [
                          Text(
                            entry.value,
                            style: TextStyle(
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          TextField(
                            keyboardType: TextInputType.multiline,
                            controller: controllers1[entry.value],
                            decoration: const InputDecoration(),
                            autofocus: false,
                            maxLines: null,
                            minLines: 3,
                          ),
                        ],
                      ),
                      Dimensions.verticalSpacingMedium,
                    ],
                  );
                }).toList(),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
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
                          SizedBox(
                              child: Center(
                                  child: Text(
                                      "${intl.reflectivePracticePart18}"))),
                        ],
                      ),
                    ),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  Column(
                    children: [
                      Text(
                        "${intl.reflectivePracticePart114}",
                        style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      RadioWidgetList(
                        onChanged: (value) {
                          setState(() {
                            eXITTICKETValue = value;
                          });
                        },
                        selectedValue: eXITTICKETValue,
                        orientation: Axis.horizontal,
                        values: [
                          "${intl.eXCELLENT}",
                          "${intl.gOOD}",
                          "Bad",
                        ],
                      ),
                    ],
                  ),
                  Dimensions.verticalSpacingMedium,
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomButton(
                  text: intl.next,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ReflectivePracticePart2(joueur:_Joueur , date1Controller:dateController , time1Controller: timeController, sessionController1: sessionController1, sessionController2: sessionController2, sessionController3:sessionController3 , needsController:needsController , titleList: titleList, controllers1: controllers1, eXITTICKETValue: eXITTICKETValue,),
                      ),
                    );
                  }),
              Dimensions.verticalSpacingExtraLarge,
            ],
          ),
        ))));
  }
}
