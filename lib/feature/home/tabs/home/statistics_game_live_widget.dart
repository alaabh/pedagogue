import 'package:flutter/material.dart';
import 'package:pedagogue/feature/home/tabs/home/statistics_game_live/statistics_game_live_view.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/shared/style/dimensions.dart';

class StatisticsGameLiveWidget extends StatelessWidget {
  const StatisticsGameLiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimensions.paddingMedium,
      child: SizedBox(
        height: 55,
        width: double.maxFinite,
        child: FilledButton.icon(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const StatisticsGameLiveView(),
            ),
          ),
          label: Text(intl.statisticsGameLive),
          icon: const Icon(Icons.live_tv),
        ),
      ),
    );
  }
}
