import 'package:flutter/material.dart';
import 'package:pedagogue/controller/season_controller.dart';
import 'package:pedagogue/controller/team_controller.dart';
import 'package:pedagogue/model/evaluation_by_program_model/GoalKeeper_model.dart';
import 'package:pedagogue/shared/widget/loading_widget.dart';

import '../../../controller/joueur_controller.dart';
import '../../../l10n/localization.dart';
import '../../../shared/widget/custom_input.dart';
import 'evaluation_goalKeeper.dart';

class GoalKeeperView extends StatefulWidget {
  final GoalKeeperModel? goalKeeperModel;
  const GoalKeeperView({super.key, this.goalKeeperModel});

  @override
  State<GoalKeeperView> createState() => _GoalKeeperViewState();
}

class _GoalKeeperViewState extends State<GoalKeeperView> {
  bool playerLoader = false;
  List<String>? teamList = [];
  List<String>? playerList = [];
  List<String>? seasonList = [];
  List<String>? monthList = [
    intl.january,
    intl.february,
    intl.march,
    intl.april,
    intl.may,
    intl.june,
    intl.july,
    intl.august,
    intl.september,
    intl.october,
    intl.november,
    intl.december
  ];

  TeamController teamController = TeamController();
  JoueurController joueurController = JoueurController();
  SeasonController seasonController = SeasonController();

  Future<void> loadData() async {
    await teamController.getAll();
    await joueurController.getAll();
    await seasonController.getAll();
    setState(() {
      for (var element in joueurController.apiResponse.value.itemList) {
        // print(element.name);
        playerList!.add(element.firstName.toString());
      }
      for (var element in teamController.apiResponse.value.itemList) {
        // print(element.name);
        teamList!.add(element.name.toString());
      }
      for (var element in seasonController.apiResponse.value.itemList) {
        // print(element.name);
        seasonList!.add(element.name.toString());
      }
    });
    if (widget.goalKeeperModel != null) {
      _Player.text = widget.goalKeeperModel!.player ?? '';
      _Team.text = widget.goalKeeperModel!.team ?? '';
      _Season.text = widget.goalKeeperModel!.season ?? '';
      _Month.text = widget.goalKeeperModel!.month ?? '';
    }
    playerLoader = true;
  }

  final TextEditingController _Player = TextEditingController();
  final TextEditingController _Team = TextEditingController();
  final TextEditingController _Season = TextEditingController();
  final TextEditingController _Month = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.goalkeeper),
      ),
      body: Center(
        child: playerLoader == true
            ? SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.8,
                height: MediaQuery.sizeOf(context).height * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomInput(
                      controller: _Player,
                      hint: "${intl.select(intl.player)}",
                      title: intl.player,
                      inputType: InputType.dropdown,
                      dropdownItems: playerList,
                    ),
                    CustomInput(
                      controller: _Team,
                      hint: "${intl.select(intl.team)}",
                      title: intl.team,
                      inputType: InputType.dropdown,
                      dropdownItems: teamList,
                    ),
                    CustomInput(
                      controller: _Season,
                      hint: "${intl.select(intl.season)}",
                      title: intl.season,
                      inputType: InputType.dropdown,
                      dropdownItems: seasonList,
                    ),
                    CustomInput(
                      controller: _Month,
                      hint: "${intl.select(intl.month)}",
                      title: intl.month,
                      inputType: InputType.dropdown,
                      dropdownItems: monthList,
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
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EvaluationGoalKeeper(
                                          goalKeeperModel:
                                              widget.goalKeeperModel,
                                          player: _Player.text,
                                          team: _Team.text,
                                          season: _Season.text,
                                          month: _Month.text,
                                        )));
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
              )
            : LoadingWidget(),
      ),
    );
  }
}
