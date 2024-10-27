import 'package:flutter/material.dart';
import 'package:pedagogue/feature/beeper/topCrono.dart/actual_game_widget.dart';
import 'package:pedagogue/feature/beeper/topCrono.dart/chrono_wiget.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../../shared/style/dimensions.dart';

class TopCronoView extends StatefulWidget {
  const TopCronoView({super.key});

  @override
  State<TopCronoView> createState() => _TopCronoViewState();
}

class _TopCronoViewState extends State<TopCronoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.topCrono),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ActualGameTimeWidget(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ChronoWidget(
                      title: intl.topChronoTitle2,
                    ),
                    ChronoWidget(
                      title: intl.topChronoTitle3,
                    ),
                  ],
                ),
                Dimensions.verticalSpacingMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ChronoWidget(
                      title: intl.topChronoTitle4,
                    ),
                    ChronoWidget(
                      title: intl.topChronoTitle5,
                    ),
                  ],
                ),
                Dimensions.verticalSpacingMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ChronoWidget(
                      title: intl.topChronoTitle6,
                    ),
                    ChronoWidget(
                      title: intl.topChronoTitle7,
                    ),
                  ],
                ),
                Dimensions.verticalSpacingMedium,
                Dimensions.verticalSpacingMedium,
                Dimensions.verticalSpacingMedium,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
