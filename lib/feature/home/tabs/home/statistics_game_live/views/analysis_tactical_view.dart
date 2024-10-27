import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/feature/home/tabs/home/statistics_game_live/widgets/radio_element_widget.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';

import '../../../../../../controller/statstic_game_live_controller/analysis_game_live_controller.dart';
import '../../../../../../l10n/localization.dart';
import '../../../../../../model/statstic_game_live_model/analyse_game_live_model.dart';
import '../../../../../../shared/style/app_color.dart';
import '../../../../../../shared/style/dimensions.dart';

class AnalysisTacticalView extends StatefulWidget {
  final String teamName;
  final Color teamColor;

  AnalysisTacticalView({
    super.key,
    required this.teamName,
    required this.teamColor,
  });

  @override
  State<AnalysisTacticalView> createState() => _AnalysisTacticalViewState();
}

class _AnalysisTacticalViewState extends State<AnalysisTacticalView> {
  String? Match_Speed = "";
  String? Playing_Style = "";
  String? Game_Transformation_1 = "";
  String? Game_Transformation_2 = "";
  String? Attack_Building = "";
  String? Pressure = "";
  String? Offside = "";

  TextEditingController Long_shots_on_goal = TextEditingController();
  TextEditingController Chance_To_Shoot = TextEditingController();
  TextEditingController Left_Side = TextEditingController();
  TextEditingController Right_Side = TextEditingController();
  TextEditingController Head_Kick = TextEditingController();
  TextEditingController Comments = TextEditingController();
  final AnalysisController analysisController = Get.put(AnalysisController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              Text(widget.teamName == 'A' ? intl.analysisia : intl.analysisib)),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: Dimensions.paddingMedium,
              child: _buildContent(context),
            ),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        Card(
          clipBehavior: Clip.hardEdge,
          child: RadioElementWidget(
            onChanged: (value) {
              setState(() {
                Match_Speed = value;
              });
            },
            selectedValue: Match_Speed,
            orientation: Axis.vertical,
            title: "${intl.matchSpeed}",
            values: [
              "${intl.fast}",
              " ${intl.slow}",
              " ${intl.longPass}",
            ],
          ),
        ),
        Dimensions.verticalSpacingMedium,
        Card(
          clipBehavior: Clip.hardEdge,
          child: RadioElementWidget(
            onChanged: (value) {
              setState(() {
                Playing_Style = value;
              });
            },
            selectedValue: Playing_Style,
            orientation: Axis.vertical,
            title: " ${intl.playingStyle}",
            values: [
              " ${intl.combative}",
              " ${intl.compoundCollective}",
            ],
          ),
        ),
        Dimensions.verticalSpacingMedium,
        Card(
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                color: AppColors.primaryColor.withOpacity(0.9),
                padding: Dimensions.paddingMedium,
                child: Center(
                  child: Text(
                    " ${intl.gameTransformation}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: Dimensions.paddingMedium,
                child: Text(
                  " ${intl.attackertoDefense}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              RadioElementWidget(
                onChanged: (value) {
                  setState(() {
                    Game_Transformation_1 = value;
                  });
                },
                selectedValue: Game_Transformation_1,
                orientation: Axis.vertical,
                values: [
                  "${intl.fast}",
                  " ${intl.slow}",
                ],
              ),
              Padding(
                padding: Dimensions.paddingMedium,
                child: Text(
                  " ${intl.defendertoAttacker}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              RadioElementWidget(
                onChanged: (value) {
                  setState(() {
                    Game_Transformation_2 = value;
                  });
                },
                selectedValue: Game_Transformation_2,
                orientation: Axis.vertical,
                values: [
                  "${intl.fast}",
                  " ${intl.slow}",
                ],
              ),
            ],
          ),
        ),
        Dimensions.verticalSpacingMedium,
        Card(
          clipBehavior: Clip.hardEdge,
          child: RadioElementWidget(
            onChanged: (value) {
              setState(() {
                Attack_Building = value;
              });
            },
            selectedValue: Attack_Building,
            orientation: Axis.vertical,
            title: " ${intl.attackBuilding}",
            values: [
              " ${intl.counterAttack}",
              " ${intl.fromtheLeftMiddle}",
              " ${intl.fromtheSides}",
              " ${intl.left}",
              " ${intl.right}",
              " ${intl.fromtheDepth}",
              " ${intl.fromtheRightMiddle}",
              " ${intl.gameMaker}",
            ],
          ),
        ),
        Dimensions.verticalSpacingMedium,
        Card(
          clipBehavior: Clip.hardEdge,
          child: RadioElementWidget(
            onChanged: (value) {
              setState(() {
                Pressure = value;
              });
            },
            selectedValue: Pressure,
            orientation: Axis.vertical,
            title: " ${intl.defPressure}",
            values: [
              " ${intl.high}",
              " ${intl.low}",
              " ${intl.mixed}",
            ],
          ),
        ),
        Dimensions.verticalSpacingMedium,
        Card(
          clipBehavior: Clip.hardEdge,
          child: RadioElementWidget(
            onChanged: (value) {
              setState(() {
                Offside = value;
              });
            },
            selectedValue: Offside,
            orientation: Axis.vertical,
            title: " ${intl.offsideGame}",
            values: [
              " ${intl.defaultradio}",
              " ${intl.toFail}",
              " ${intl.chanceToShoot}",
            ],
          ),
        ),
        Dimensions.verticalSpacingMedium,
        Card(
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                color: AppColors.primaryColor.withOpacity(0.9),
                padding: Dimensions.paddingMedium,
                child: Center(
                  child: Text(
                    " ${intl.shoot}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: Dimensions.paddingMedium,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: Long_shots_on_goal,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: Dimensions.paddingMedium,
                        child: Text(" ${intl.longshotsongoal}"),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: Dimensions.paddingMedium,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: Chance_To_Shoot,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: Dimensions.paddingMedium,
                        child: Text(" ${intl.chanceToShoot}"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Dimensions.verticalSpacingMedium,
        Card(
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                color: AppColors.primaryColor.withOpacity(0.9),
                padding: Dimensions.paddingMedium,
                child: Center(
                  child: Text(
                    " ${intl.crossBalls}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: Dimensions.paddingMedium,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: Left_Side,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: Dimensions.paddingMedium,
                        child: Text(" ${intl.leftSide}"),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: Dimensions.paddingMedium,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: Right_Side,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: Dimensions.paddingMedium,
                        child: Text(" ${intl.rightSide}"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Dimensions.verticalSpacingMedium,
        Card(
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                color: AppColors.primaryColor.withOpacity(0.9),
                padding: Dimensions.paddingMedium,
                child: Center(
                  child: Text(
                    " ${intl.headKick}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: Dimensions.paddingMedium,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: Head_Kick,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: Dimensions.paddingMedium,
                        child: Text(" ${intl.onGoal}"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Dimensions.verticalSpacingMedium,
        Padding(
          padding: Dimensions.paddingSmall,
          child: CustomInput(
            controller: Comments,
            inputType: InputType.text,
            title: " ${intl.comments}",
            hint: "${intl.leavecomment}",
            minLines: 5,
            maxLines: 5,
          ),
        ),
        Dimensions.verticalSpacingMedium,
      ],
    );
  }

  Widget _buildBottomBar() {
    return Container(
      width: double.infinity,
      padding: Dimensions.paddingExtraLarge,
      decoration: BoxDecoration(
        color: AppColors.secondaryBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -3),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: () {
                analysisController.sendAnalysis(
                    AnalysisGameLiveModel(
                        Match_Speed: Match_Speed,
                        Playing_Style: Playing_Style,
                        Game_Transformation_1: Game_Transformation_1,
                        Game_Transformation_2: Game_Transformation_2,
                        Attack_Building: Attack_Building,
                        Pressure: Pressure,
                        Offside: Offside,
                        Long_shots_on_goal: Long_shots_on_goal.text,
                        Chance_To_Shoot: Chance_To_Shoot.text,
                        Left_Side: Left_Side.text,
                        Right_Side: Right_Side.text,
                        Head_Kick: Head_Kick.text,
                        Comments: Comments.text),
                    widget.teamName == "A" ? "analysis" : "analysis_b");
              },
              child: Text(intl.save),
            ),
          ),
          Dimensions.horizontalSpacingMedium,
          Expanded(
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: () {},
              child: Text(intl.print),
            ),
          ),
        ],
      ),
    );
  }
}
