import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/joueur_controller.dart';
import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';
import '../../home/tabs/home/statistics_game_live/widgets/image_picker_element_widget.dart';

class TrainingMatchDay extends StatefulWidget {
  const TrainingMatchDay({super.key});

  @override
  State<TrainingMatchDay> createState() => _TrainingMatchDayState();
}

class _TrainingMatchDayState extends State<TrainingMatchDay> {
  List<String> inputList = [
    "${intl.trainingMatchDay1}",
    "${intl.trainingMatchDay2}",
    "${intl.trainingMatchDay3}",
    "${intl.trainingMatchDay4}",
    "${intl.trainingMatchDay5}",
    "${intl.trainingMatchDay6}",
    "${intl.trainingMatchDay7}",
    "${intl.trainingMatchDay8}",
    "${intl.trainingMatchDay9}",
  ];
  List<String> tRAININGATTENDANCEInput = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
  ];
  JoueurController joueurController = JoueurController();

  bool playerLoader = false;

  List<String>? playerList = [];
  Future<void> loadData() async {
    await joueurController.getAll();

    setState(() {
      for (var element in joueurController.apiResponse.value.itemList) {
        // print(element.name);
        playerList!.add(element.firstName.toString());
      }
    });

    playerLoader = true;
  }

  XFile? selectedImage1Path;
  XFile? selectedImage2Path;
  late Map<String, TextEditingController> controllers;
  final TextEditingController _Player = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllers = {
      for (var label in inputList) label: TextEditingController(),
    };
    loadData();
  }

  @override
  void dispose() {
    controllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  final TextEditingController dateController = TextEditingController();
  final TextEditingController input1Controller = TextEditingController();
  final TextEditingController input2Controller = TextEditingController();
  final TextEditingController input3Controller = TextEditingController();
  final TextEditingController input4Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.trainingMatchDayList}")),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              Column(
                children: inputList
                    .map((item) => Column(
                          children: [
                            Dimensions.verticalSpacingExtraLarge,
                            Text(
                              item,
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Dimensions.verticalSpacingExtraLarge,
                            TextField(
                              keyboardType: TextInputType.multiline,
                              controller: controllers[item],
                              decoration: const InputDecoration(),
                              autofocus: false,
                              maxLines: null,
                            ),
                          ],
                        ))
                    .toList(),
              ),
              Dimensions.verticalSpacingExtraLarge,
              playerLoader == true
                  ? CustomInput(
                      controller: _Player,
                      hint: "${intl.select(intl.player)}",
                      title: intl.player,
                      inputType: InputType.dropdown,
                      dropdownItems: playerList,
                    )
                  : LoadingWidget(),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                //controller: dateController,
                hint: "${intl.select(intl.age)}",
                title: intl.age,
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                //controller: dateController,
                hint: "${intl.select(intl.date)}",
                title: intl.date,
                inputType: InputType.date,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                //controller: dateController,
                hint: "${intl.select(intl.time)}",
                title: intl.time,
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
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: Center(child: Text("NO"))),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Center(
                              child: Text(
                            "${intl.trainingMatchDay10}",
                            textAlign: TextAlign.center,
                          ))),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: Center(
                              child: Text(
                            "${intl.rating}",
                            textAlign: TextAlign.center,
                          ))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: tRAININGATTENDANCEInput
                    .map(
                      (item) => Card(
                        color: AppColors.primaryColor,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: Center(
                                      child: Text(
                                          "${tRAININGATTENDANCEInput.indexOf(item) + 1}"))),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Center(
                                    child: TextField(
                                      keyboardType: TextInputType.multiline,
                                      //controller: input4Controller,
                                      decoration: const InputDecoration(),
                                      autofocus: false,
                                      maxLines: null,
                                    ),
                                  )),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  child: Center(
                                    child: TextField(
                                      keyboardType: TextInputType.multiline,
                                      //controller: input4Controller,
                                      decoration: const InputDecoration(),
                                      autofocus: false,
                                      maxLines: null,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: [
                  Dimensions.verticalSpacingExtraLarge,
                  Text(
                    "${intl.rating}",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    keyboardType: TextInputType.multiline,
                    //controller: input4Controller,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                  ),
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: [
                  Dimensions.verticalSpacingExtraLarge,
                  Text(
                    "${intl.trainingMatchDay11}",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  Text(
                    "${intl.trainingMatchDay12}",
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    keyboardType: TextInputType.multiline,
                    //controller: input4Controller,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                  ),
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                //controller: dateController,
                hint: "${intl.select(intl.date)}",
                title: intl.date,
                inputType: InputType.date,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                //controller: dateController,
                hint: "${intl.trainingMatchDay13}",
                title: "${intl.trainingMatchDay13}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                //controller: dateController,
                hint: "${intl.age}",
                title: "${intl.age}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                //controller: dateController,
                hint: "${intl.time}",
                title: "${intl.time}",
                inputType: InputType.time,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                //controller: dateController,
                hint: "${intl.select(intl.date)}",
                title: intl.date,
                inputType: InputType.date,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                //controller: dateController,
                hint: "${intl.trainingMatchDay13}",
                title: "${intl.trainingMatchDay13}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                //controller: dateController,
                hint: "${intl.age}",
                title: "${intl.age}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                //controller: dateController,
                hint: "${intl.time}",
                title: "${intl.time}",
                inputType: InputType.time,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: [
                  Dimensions.verticalSpacingExtraLarge,
                  Text(
                    "${intl.trainingMatchDay14}",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    keyboardType: TextInputType.multiline,
                    //controller: input4Controller,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                  ),
                ],
              ),
              Column(
                children: [
                  Dimensions.verticalSpacingExtraLarge,
                  Text(
                    "${intl.trainingMatchDay15}",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    keyboardType: TextInputType.multiline,
                    //controller: input4Controller,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                  ),
                ],
              ),
              Column(
                children: [
                  Dimensions.verticalSpacingExtraLarge,
                  Text(
                    "${intl.trainingMatchDay16}",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    keyboardType: TextInputType.multiline,
                    //controller: input4Controller,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                  ),
                ],
              ),
              Column(
                children: [
                  Dimensions.verticalSpacingExtraLarge,
                  Text(
                    "${intl.trainingMatchDay17}",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    keyboardType: TextInputType.multiline,
                    //controller: input4Controller,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                  ),
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              ImagePickerElementWidget(
                commentVisibility: 0,
                title: "${intl.trainingMatchDay18}",
                titleBackgroundColor: AppColors.primaryLightColor,
                onImagePicked: (imagePath) => selectedImage1Path = imagePath,
              ),
              Dimensions.verticalSpacingExtraLarge,
              ImagePickerElementWidget(
                commentVisibility: 0,
                title: "${intl.trainingMatchDay19}",
                titleBackgroundColor: AppColors.primaryLightColor,
                onImagePicked: (imagePath) => selectedImage2Path = imagePath,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomButton(
                  text: intl.print,
                  onPressed: () {
                    print(controllers["ATTENDANCES"]!.text);
                  }),
              Dimensions.verticalSpacingExtraLarge,
            ],
          ),
        ))));
  }
}
