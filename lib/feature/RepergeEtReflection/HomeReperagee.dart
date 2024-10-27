import 'package:flutter/material.dart';
import 'package:pedagogue/feature/RepergeEtReflection/PlanDactionDeDEvelloppmentPourEntrtain/plan_action_main.dart';
import 'package:pedagogue/feature/RepergeEtReflection/considerationDeLaCauserieDequipe/considerationScreen.dart';
import 'package:pedagogue/feature/RepergeEtReflection/game_reflections/game_reflections.dart';
import 'package:pedagogue/feature/RepergeEtReflection/questionnaire_players/questionnaire_players.dart';
import 'package:pedagogue/feature/RepergeEtReflection/reflective_practice_template/reflective_practice_part1.dart';
import 'package:pedagogue/feature/RepergeEtReflection/retroction/retroaction_main.dart';
import 'package:pedagogue/feature/RepergeEtReflection/role_models/role_models.dart';
import 'package:pedagogue/feature/RepergeEtReflection/role_of_coach/role_of_coach.dart';
import 'package:pedagogue/feature/RepergeEtReflection/session_design_board/session_design_board.dart';
import 'package:pedagogue/feature/RepergeEtReflection/session_plan1/session_plan1.dart';
import 'package:pedagogue/feature/RepergeEtReflection/session_plan2/session_plan2.dart';
import 'package:pedagogue/feature/RepergeEtReflection/session_plan3/session_plan.dart';
import 'package:pedagogue/feature/RepergeEtReflection/session_plan4/session_plan4.dart';
import 'package:pedagogue/feature/RepergeEtReflection/session_plan5/session_plan5.dart';
import 'package:pedagogue/feature/RepergeEtReflection/session_plan6/session_plan6.dart';
import 'package:pedagogue/feature/RepergeEtReflection/session_plan7/sesion_plan7.dart';
import 'package:pedagogue/feature/RepergeEtReflection/training_matchday/training_match_day.dart';
import 'package:pedagogue/feature/RepergeEtReflection/wellness%20_questionnaire/wellness_questionnaire.dart';
import 'package:pedagogue/l10n/localization.dart';

import 'key_factors_checklist/key_factors_checklist_main.dart';
import 'modeleViergePlanActionDeDeveloppent/planDevellopment.dart';

class HomeReperage extends StatelessWidget {
  HomeReperage({super.key});
  List<Map<String, dynamic>> list = [
    {
      "title": "${intl.developmentalActionPlanCoachesList}",
      "root": PlanActionMain(),
    },
    {
      "title": "${intl.feedbackList}",
      "root": RetroactionMain(),
    },
    {
      "title": "${intl.iNDIVIDUALDEVELOPMENTPLANList}",
      "root": planDevelloppment(),
    },
    {
      "title": "${intl.teamTalksList}",
      "root": consederationScreen(),
    },
    ///////////
    {
      "title": "${intl.keyfactorsMainList}",
      "root": KeyFactorsChecklistMain(),
    },
    {
      "title": "${intl.questionnairePlayersList}",
      "root": QuestionnairePlayers(),
    },
    {
      "title": "${intl.reflectivePracticePart1List}",
      "root": ReflectivePracticePart1(),
    },
    {
      "title": "${intl.roleModelsList}",
      "root": RoleModels(),
    },
    {
      "title": "${intl.roleofaCoachList}",
      "root": RoleOfCoach(),
    },
    {
      "title": "${intl.sessionDesignBoardList}",
      "root": SessionDesignBoard(),
    },
    {
      "title": "${intl.sessionPlan1List}",
      "root": SessionPlan1(),
    },
    {
      "title": "${intl.sessionPlan2List}",
      "root": SessionPlan2(),
    },
    {
      "title": "${intl.sessionPlan3List}",
      "root": SessionPlan3(),
    },
    {
      "title": "${intl.sessionPlan4List}",
      "root": SessionPlan4(),
    },
    {
      "title": "${intl.sessionPlan5List}",
      "root": SessionPlan5(),
    },
    {
      "title": "${intl.sessionPlan6List}",
      "root": SessionPlan6(),
    },
    {
      "title": "${intl.sessionPlan7List}",
      "root": SessionPlan7(),
    },
    {
      "title": "${intl.gameReflectionsList}",
      "root": GameReflections(),
    },
    {
      "title": "${intl.trainingMatchDayList}",
      "root": TrainingMatchDay(),
    },
    {
      "title": "${intl.wellnessQuestionnaireList}",
      "root": WellnessQuestionnaire(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${intl.scoutingReflection}'),
      ),
      body: ListView.builder(
        itemCount: list.length, // Nombre total de modules.
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text('${list[index]['title']}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              leading: Icon(Icons.dashboard, color: Colors.blueGrey),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => list[index]['root'],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
