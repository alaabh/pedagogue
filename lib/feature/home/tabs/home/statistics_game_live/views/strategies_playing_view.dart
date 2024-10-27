import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/controller/statstic_game_live_controller/statstic_game_live_controller.dart';
import 'package:pedagogue/feature/home/tabs/home/statistics_game_live/widgets/radio_element_widget.dart';
import 'package:pedagogue/shared/style/dimensions.dart';

import '../../../../../../l10n/localization.dart';
import '../../../../../../model/statstic_game_live_model/statstic_game_live_model.dart';
import '../../../../../../shared/style/app_color.dart';

class StrategiesPlayingView extends StatefulWidget {
  String teamName;
  final Color teamColor;
  StrategiesPlayingView({
    super.key,
    required this.teamName,
    required this.teamColor,
  });

  @override
  State<StrategiesPlayingView> createState() => _StrategiesPlayingViewState();
}

class _StrategiesPlayingViewState extends State<StrategiesPlayingView> {
  String? compressive_support = "";
  String? block_counter_attack = "";
  String? retaining_superiority = "";
  String? dependence_skills = "";
  String? playing_means = "";
  String? team_success_experience = "";
  String? the_capabilities_of_the_coach = "";
  String? mental_toughness = "";
  String? team_trust = "";
  String? team_persistence = "";
  String? team_fighting_spirit = "";
  String? the_team_win = "";
  String? there_is_player = "";
  String? team_competitiveness = "";
  String? team_social = "";
  String? play_direct = "";
  String? good = "";
  String? depend = "";
  String? depends_offside = "";
  String? technical = "";
  String? goodKick = "";
  String? offencive = "";
  String? leader = "";
  String? attack = "";
  String? goodGK = "";

  String? teamnom = "";

  @override
  void initState() {
    // TODO: implement initState
    widget.teamName == 'A' ? teamnom = intl.a : teamnom = intl.b;
    super.initState();
  }

  final StatisticController statisticController =
      Get.put(StatisticController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              Text(widget.teamName == 'A' ? intl.strategya : intl.strategyb)),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          clipBehavior: Clip.hardEdge,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                Container(
                  padding: Dimensions.paddingMedium,
                  child: Text(
                    "${intl.strategies} $teamnom",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      compressive_support = value;
                    });
                  },
                  selectedValue: compressive_support,
                  title: "${intl.strategiesSection1Title1}",
                  values: ["${intl.weak}", "${intl.average}", "${intl.strong}"],
                ),
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      block_counter_attack = value;
                    });
                  },
                  selectedValue: block_counter_attack,
                  title: "${intl.strategiesSection1Title2}",
                  values: ["${intl.weak}", "${intl.average}", "${intl.strong}"],
                ),
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      retaining_superiority = value;
                    });
                  },
                  selectedValue: retaining_superiority,
                  title: "${intl.strategiesSection1Title3}",
                  values: ["${intl.weak}", "${intl.average}", "${intl.strong}"],
                ),
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      dependence_skills = value;
                    });
                  },
                  selectedValue: dependence_skills,
                  title: "${intl.strategiesSection1Title4}",
                  values: ["${intl.weak}", "${intl.average}", "${intl.strong}"],
                ),
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      playing_means = value;
                    });
                  },
                  selectedValue: playing_means,
                  title: "${intl.strategiesSection1Title5}",
                  values: ["${intl.weak}", "${intl.average}", "${intl.strong}"],
                ),
              ],
            ),
          ),
        ),
        Dimensions.verticalSpacingHuge,
        Card(
          clipBehavior: Clip.hardEdge,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                Container(
                  padding: Dimensions.paddingMedium,
                  child: Text(
                    "${intl.strategiesTitle1} $teamnom",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      team_success_experience = value;
                    });
                  },
                  selectedValue: team_success_experience,
                  title: "${intl.strategiesSection2Title1}",
                  values: ["${intl.weak}", "${intl.average}", "${intl.strong}"],
                ),
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      the_capabilities_of_the_coach = value;
                    });
                  },
                  selectedValue: the_capabilities_of_the_coach,
                  title: "${intl.strategiesSection2Title2}",
                  values: ["${intl.weak}", "${intl.average}", "${intl.strong}"],
                ),
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      mental_toughness = value;
                    });
                  },
                  selectedValue: mental_toughness,
                  title: "${intl.strategiesSection2Title3}",
                  values: ["${intl.weak}", "${intl.average}", "${intl.strong}"],
                ),
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      team_trust = value;
                    });
                  },
                  selectedValue: team_trust,
                  title: "${intl.strategiesSection2Title4}",
                  values: ["${intl.weak}", "${intl.average}", "${intl.strong}"],
                ),
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      team_persistence = value;
                    });
                  },
                  selectedValue: team_persistence,
                  title: "${intl.strategiesSection2Title5}",
                  values: ["${intl.weak}", "${intl.average}", "${intl.strong}"],
                ),
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      team_fighting_spirit = value;
                    });
                  },
                  selectedValue: team_fighting_spirit,
                  title: "${intl.strategiesSection2Title6}",
                  values: ["${intl.weak}", "${intl.average}", "${intl.strong}"],
                ),
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      the_team_win = value;
                    });
                  },
                  selectedValue: the_team_win,
                  title: "${intl.strategiesSection2Title7}",
                  values: ["${intl.weak}", "${intl.average}", "${intl.strong}"],
                ),
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      there_is_player = value;
                    });
                  },
                  selectedValue: there_is_player,
                  title: "${intl.strategiesSection2Title8}",
                  values: ["${intl.weak}", "${intl.average}", "${intl.strong}"],
                ),
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      team_competitiveness = value;
                    });
                  },
                  selectedValue: team_competitiveness,
                  title: "${intl.strategiesSection2Title9}",
                  values: ["${intl.weak}", "${intl.average}", "${intl.strong}"],
                ),
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      team_social = value;
                    });
                  },
                  selectedValue: team_social,
                  title: "${intl.strategiesSection2Title10}",
                  values: ["${intl.weak}", "${intl.average}", "${intl.strong}"],
                ),
              ],
            ),
          ),
        ),
        Dimensions.verticalSpacingHuge,
        Card(
          clipBehavior: Clip.hardEdge,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                Container(
                  padding: Dimensions.paddingMedium,
                  child: Text(
                    "${intl.strategiesTitle2} $teamnom",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Dimensions.verticalSpacingMedium,
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      good = value;
                    });
                  },
                  selectedValue: good,
                  values: [
                    "${intl.strategiesSection3Title11}",
                    "${intl.strategiesSection3Title1}"
                  ],
                ),
                Dimensions.verticalSpacingMedium,
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      depend = value;
                    });
                  },
                  selectedValue: depend,
                  values: [
                    "${intl.strategiesSection3Title2}",
                    "${intl.strategiesSection3Title12}"
                  ],
                ),
                Dimensions.verticalSpacingMedium,
                /*   RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      depends_offside = value;
                    });
                  },
                  selectedValue: depends_offside,
                  values: [
                    "${intl.strategiesSection3Title3}",
                    "${intl.strategiesSection3Title13}"
                  ],
                ),
                Dimensions.verticalSpacingMedium, */
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      technical = value;
                    });
                  },
                  selectedValue: technical,
                  values: [
                    "${intl.strategiesSection3Title4}",
                    "${intl.strategiesSection3Title14}",
                  ],
                ),
                Dimensions.verticalSpacingMedium,
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      goodKick = value;
                    });
                  },
                  selectedValue: goodKick,
                  values: [
                    "${intl.strategiesSection3Title5}",
                    "${intl.strategiesSection3Title15}"
                  ],
                ),
                Dimensions.verticalSpacingMedium,
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      offencive = value;
                    });
                  },
                  selectedValue: offencive,
                  values: [
                    "${intl.strategiesSection3Title6}",
                    "${intl.strategiesSection3Title16}"
                  ],
                ),
                Dimensions.verticalSpacingMedium,
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      leader = value;
                    });
                  },
                  selectedValue: leader,
                  values: [
                    "${intl.strategiesSection3Title7}",
                    "${intl.strategiesSection3Title17}"
                  ],
                ),
                Dimensions.verticalSpacingMedium,
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      attack = value;
                    });
                  },
                  selectedValue: attack,
                  values: [
                    "${intl.strategiesSection3Title8}",
                    "${intl.strategiesSection3Title18}"
                  ],
                ),
                Dimensions.verticalSpacingMedium,
                RadioElementWidget(
                  onChanged: (value) {
                    setState(() {
                      goodGK = value;
                    });
                  },
                  selectedValue: goodGK,
                  values: [
                    "${intl.strategiesSection3Title10}",
                    "${intl.strategiesSection3Title20}"
                  ],
                ),
              ],
            ),
          ),
        ),
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
                statisticController.sendStatistic(
                    StatisticGameLiveModel(
                        compressive_support: compressive_support,
                        block_counter_attack: block_counter_attack,
                        retaining_superiority: retaining_superiority,
                        dependence_skills: dependence_skills,
                        playing_means: playing_means,
                        team_success_experience: team_success_experience,
                        the_capabilities_of_the_coach:
                            the_capabilities_of_the_coach,
                        mental_toughness: mental_toughness,
                        team_trust: team_trust,
                        team_persistence: team_persistence,
                        team_fighting_spirit: team_fighting_spirit,
                        the_team_win: the_team_win,
                        there_is_player: there_is_player,
                        team_competitiveness: team_competitiveness,
                        team_social: team_social,
                        play_direct: play_direct,
                        good: good,
                        depend: depend,
                        depends_offside: depends_offside,
                        technical: technical,
                        goodKick: goodKick,
                        offencive: offencive,
                        leader: leader,
                        attack: attack,
                        goodGK: goodGK),
                    widget.teamName == "A" ? "strategy_a" : "strategy_b");
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
