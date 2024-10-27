import 'package:curved_carousel/curved_carousel.dart';
import 'package:flutter/material.dart';
import 'package:pedagogue/feature/beeper/beeper_main.dart';
import 'package:pedagogue/feature/calculator/calculator_main.dart';
import 'package:pedagogue/feature/home/tabs/home/carrouselSlider_widget.dart';
import 'package:pedagogue/feature/home/tabs/home/statistics_game_live/statistics_game_live_view.dart';
import 'package:pedagogue/feature/ppCalculator/ppCalculator_main.dart';
import 'package:pedagogue/feature/proteinCalculator/proteinCalculator_main.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/shared/style/dimensions.dart';

import '../../../../shared/style/app_color.dart';
import 'listCardHome.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  List<Color> yellowShades = [
    Color(0xFFF6B72D),
    Color(0xFFCD9F53),
    Color(0xFfB2823C),
    Colors.yellow[800]!,
    Color(0xFfB2823C),
    Colors.yellow[900]!,
  ];
  List<Widget> path = [
    BeeperMAin(),
    CalculatorMAin(),
    PpCalculatorMAin(),
    ProteinCalculatorMAin(),
    StatisticsGameLiveView(),
  ];

  List<String> title = [
    intl.beeper,
    intl.calculator,
    intl.ppCalculator,
    intl.proteinCalculator,
    intl.statisticsGameLive
  ];
  List<String> image = [
    "assets/beeper.png",
    "assets/calculator.png",
    "assets/ppcalculator.png",
    "assets/proteinCalculator.png",
    "assets/liveStat.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              CarousselSliderWidget(),
              Dimensions.verticalSpacingHuge,
              CurvedCarousel(
                itemBuilder: (_, i) {
                  return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => path[i]),
                        );
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              padding: Dimensions.paddingSmall,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primaryColor,
                                      width: 0.3),
                                  shape: BoxShape.circle),
                              child: Image.asset(
                                image[i],
                                width: MediaQuery.of(context).size.width * 0.11,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: Text(
                                title[i],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.018,
                                ),
                              ),
                            )
                          ],
                        ),
                      )

                      /* CircleAvatar(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.002),
                          child: Text(
                            title[i],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.018,
                            ),
                          ),
                        ),
                        radius: MediaQuery.of(context).size.width * 0.065,
                        backgroundColor: yellowShades[i],
                      ), */
                      );
                },
                middleItemScaleRatio: 2,
                curveScale: 8,
                itemCount: title.length,
                horizontal: true,
              ),
              /* CustomCardBibliotheque(
                imagePath: 'assets/bibliotheque.jpeg',
                text: 'Bibliothèque',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeBibliotheque()),
                  );
                },
              ), */
              /*Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Dimensions.horizontalSpacingLarge,
                  espaceEpsCardCard(),
                  Dimensions.horizontalSpacingMedium,
                  CoatchingCard(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EffectifCard(),
                  Dimensions.horizontalSpacingLarge,
                  VideoRecorder(),
                ],
              ),
              const TechnicalDrawingSelectionWidget(),
              const StatisticsGameLiveWidget(),
              const BodyBuildingTrainingWidget(),*/

              Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: GridListPage()),
            ],
          ),
        ),
      ),
    );
  }
}
