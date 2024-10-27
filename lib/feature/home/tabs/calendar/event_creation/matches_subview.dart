import 'package:flutter/material.dart';
import 'package:pedagogue/controller/competition_controller.dart';
import 'package:pedagogue/controller/match_controller.dart';
import 'package:pedagogue/model/match.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';

import '../../../../../l10n/localization.dart';
import '../../../../../shared/Widget/custom_dialog.dart';
import '../../../../../shared/style/dimensions.dart';
import '../../../../../utils/resources/api/api_view_handler.dart';

class MatchesSubview extends StatefulWidget {
  final Function loadDataFunction;

  const MatchesSubview({super.key, required this.loadDataFunction});

  @override
  State<MatchesSubview> createState() => MatchesSubviewState();
}

class MatchesSubviewState extends State<MatchesSubview> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController opponentController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController refereeController = TextEditingController();
  TextEditingController assistant1Controller = TextEditingController();
  TextEditingController assistant2Controller = TextEditingController();

  TextEditingController resOutController = TextEditingController();
  TextEditingController goReturnController = TextEditingController();

  Future<void> submit(DateTime dateTime) async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!(formKey.currentState?.validate() ?? false)) {
      return AlertMaker.showSimpleAlertDialog(
        context: context,
        title: intl.warning,
        description: intl.pleaseCheckTheRequiredFields,
        alertType: AlertType.warning,
      );
    }

    MatchController matchController = MatchController();

    Match match = Match(
      opponent: opponentController.text,
      place: placeController.text,
      arbitrator: refereeController.text,
      assistant1: assistant1Controller.text,
      assistant2: assistant2Controller.text,
      competitionId: int.tryParse(_ListeCompetitionsController.text),
      resOut: resOutController.text,
      goRet: goReturnController.text,
      dateTime: dateTime,
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: matchController.add(match),
      successFunction: () {
        widget.loadDataFunction();
        Navigator.of(context).pop();
      },
    );
  }

  TextEditingController _ListeCompetitionsController = TextEditingController();
  final CompetitionController competitionsController = CompetitionController();
  List<String>? competitionList = [];
  List<String>? competitionIdList = [];
  bool playerLoader = false;
  Future<void> loadData() async {
    await competitionsController.getAll();

    setState(() {
      for (var element in competitionsController.apiResponse.value.itemList) {
        print(element.name);
        competitionList!.add(element.name.toString());
        competitionIdList!.add(element.id.toString());
      }

      print(competitionList);
      print(competitionIdList);
      _ListeCompetitionsController = TextEditingController(
          /*  text: widget.sessions == null
              ? null
              : exerciceList![exerciceIdList!
                  .indexOf(widget.sessions!.exercice_id.toString())] */
          );
      playerLoader = true;
    });
  }

  @override
  void initState() {
    loadData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        margin: Dimensions.paddingMedium,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: Dimensions.mediumBorderRadius,
        ),
        child: SingleChildScrollView(
          padding: Dimensions.paddingMedium,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInput(
                inputType: InputType.text,
                controller: opponentController,
                title: intl.opponent,
                isRequired: true,
              ),
              Dimensions.verticalSpacingHuge,
              CustomInput(
                inputType: InputType.text,
                controller: placeController,
                title: intl.place,
              ),
              Dimensions.verticalSpacingHuge,
              CustomInput(
                inputType: InputType.text,
                controller: refereeController,
                title: intl.referee,
              ),
              Dimensions.verticalSpacingHuge,
              CustomInput(
                inputType: InputType.text,
                controller: assistant1Controller,
                title: intl.assistant1,
              ),
              Dimensions.verticalSpacingHuge,
              CustomInput(
                inputType: InputType.text,
                controller: assistant2Controller,
                title: intl.assistant2,
              ),
              Dimensions.verticalSpacingHuge,
              CustomInput(
                inputType: InputType.dropdown,
                dropdownItems: competitionList,
                controller: _ListeCompetitionsController,
                title: intl.competition,
              ),
              Dimensions.verticalSpacingHuge,
              CustomInput(
                inputType: InputType.dropdown,
                dropdownItems: [
                  intl.inside,
                  intl.outside,
                ],
                controller: resOutController,
                title: '${intl.inside}/${intl.outside}',
                hint: intl.select('${intl.inside}/${intl.outside}'),
              ),
              Dimensions.verticalSpacingHuge,
              CustomInput(
                inputType: InputType.dropdown,
                dropdownItems: [
                  intl.matchAller,
                  intl.matchRetour,
                ],
                controller: goReturnController,
                title: "${intl.matchAller}/${intl.matchRetour}",
                hint: intl.select('${intl.matchAller}/${intl.matchRetour}'),
              ),
              Dimensions.verticalSpacingHuge,
            ],
          ),
        ),
      ),
    );
  }
}
