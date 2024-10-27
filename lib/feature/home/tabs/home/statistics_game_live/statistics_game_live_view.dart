import 'package:flutter/material.dart';
import 'package:pedagogue/feature/home/tabs/home/statistics_game_live/views/analysis_tactical_view.dart';
import 'package:pedagogue/feature/home/tabs/home/statistics_game_live/views/dynamic_performance_def_off_view.dart';
import 'package:pedagogue/feature/home/tabs/home/statistics_game_live/views/formation_view.dart';
import 'package:pedagogue/feature/home/tabs/home/statistics_game_live/views/goals_view.dart';
import 'package:pedagogue/feature/home/tabs/home/statistics_game_live/views/match_form_view.dart';
import 'package:pedagogue/feature/home/tabs/home/statistics_game_live/views/offensive_defensive_plan_view.dart';
import 'package:pedagogue/feature/home/tabs/home/statistics_game_live/views/strategies_playing_view.dart';
import 'package:pedagogue/feature/home/tabs/home/statistics_game_live/views/team_management_view.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/shared/style/app_color.dart';

import '../../../../../shared/style/dimensions.dart';

class StatisticsGameLiveView extends StatelessWidget {
  const StatisticsGameLiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.statisticsGameLive)),
      body: SingleChildScrollView(
        padding: Dimensions.paddingMedium,
        child: Column(
          children: [
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => StrategiesPlayingView(
                      teamName: 'A',
                      teamColor: AppColors.teamAColor,
                    ),
                  ),
                ),
                child: Text(intl.strategya),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => StrategiesPlayingView(
                      teamName: 'B',
                      teamColor: AppColors.teamBColor,
                    ),
                  ),
                ),
                child: Text(intl.strategyb),
              ),
            ),
            Dimensions.verticalSpacingHuge,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AnalysisTacticalView(
                      teamName: 'A',
                      teamColor: AppColors.teamAColor,
                    ),
                  ),
                ),
                child: Text(intl.analysisia),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AnalysisTacticalView(
                      teamName: 'B',
                      teamColor: AppColors.teamBColor,
                    ),
                  ),
                ),
                child: Text(intl.analysisib),
              ),
            ),
            Dimensions.verticalSpacingHuge,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TeamManagementView(
                      teamName: 'A',
                      teamColor: AppColors.teamAColor,
                    ),
                  ),
                ),
                child: Text(intl.teamManagementa),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TeamManagementView(
                      teamName: 'B',
                      teamColor: AppColors.teamBColor,
                    ),
                  ),
                ),
                child: Text(intl.teamManagementb),
              ),
            ),
            Dimensions.verticalSpacingHuge,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OffensiveDefensivePlanView(
                      teamName: 'A',
                      teamColor: AppColors.teamAColor,
                    ),
                  ),
                ),
                child: Text(intl.offensiveDefensivea),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OffensiveDefensivePlanView(
                      teamName: 'B',
                      teamColor: AppColors.teamBColor,
                    ),
                  ),
                ),
                child: Text(intl.offensiveDefensiveb),
              ),
            ),
            Dimensions.verticalSpacingHuge,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GoalsView(
                      teamName: 'A',
                      teamColor: AppColors.teamAColor,
                    ),
                  ),
                ),
                child: Text(intl.goalsa),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GoalsView(
                      teamName: 'B',
                      teamColor: AppColors.teamBColor,
                    ),
                  ),
                ),
                child: Text(intl.goalsb),
              ),
            ),
            Dimensions.verticalSpacingHuge,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FormationView(),
                  ),
                ),
                child: Text(intl.foramtionAB),
              ),
            ),
            Dimensions.verticalSpacingHuge,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MatchFormView(
                      teamName: 'A',
                      teamColor: AppColors.teamAColor,
                    ),
                  ),
                ),
                child: Text(intl.matchfroma),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MatchFormView(
                      teamName: 'B',
                      teamColor: AppColors.teamBColor,
                    ),
                  ),
                ),
                child: Text(intl.matchfromb),
              ),
            ),
            Dimensions.verticalSpacingHuge,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DynamicPerformanceDefOffView(
                      teamName: 'A',
                      teamColor: AppColors.teamAColor,
                    ),
                  ),
                ),
                child: Text(intl.dynamicPerformancea),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DynamicPerformanceDefOffView(
                      teamName: 'B',
                      teamColor: AppColors.teamBColor,
                    ),
                  ),
                ),
                child: Text(intl.dynamicPerformanceb),
              ),
            ),
            Dimensions.verticalSpacingHuge,
          ],
        ),
      ),
    );
  }
}
