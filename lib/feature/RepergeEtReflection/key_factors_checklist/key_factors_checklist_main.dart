import 'package:flutter/material.dart';
import 'package:pedagogue/feature/RepergeEtReflection/key_factors_checklist/key_factors_positions.dart';

import '../../../controller/joueur_controller.dart';
import '../../../controller/team_controller.dart';
import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';

class KeyFactorsChecklistMain extends StatefulWidget {
  const KeyFactorsChecklistMain({super.key});

  @override
  State<KeyFactorsChecklistMain> createState() =>
      _KeyFactorsChecklistMainState();
}

class _KeyFactorsChecklistMainState extends State<KeyFactorsChecklistMain> {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  final TextEditingController _Joueur = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController team1Controller = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController coachController = TextEditingController();
  final TextEditingController footController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.keyfactorsMainList}")),
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
                controller: team1Controller,
                hint: "${intl.team}",
                title: "${intl.team}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: ageController,
                hint: "${intl.age}",
                title: "${intl.age}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: coachController,
                hint: "${intl.coach}",
                title: "${intl.coach}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: footController,
                hint: "${intl.keyfactorsMain1}",
                title: "${intl.keyfactorsMain1}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Dimensions.verticalSpacingExtraLarge,
              Dimensions.verticalSpacingExtraLarge,
              CustomButton(
                  text: intl.next,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => KeyFactorsChecklistPositions(
                          joueurController: _Joueur,
                          dateController: dateController,
                          team1Controller: team1Controller,
                          ageController: ageController,
                          coachController: coachController,
                          footController: footController,
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
