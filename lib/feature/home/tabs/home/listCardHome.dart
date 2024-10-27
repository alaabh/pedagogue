import 'package:flutter/material.dart';
import 'package:pedagogue/feature/game_model_e_book/game_model_e_book.dart';
import 'package:pedagogue/feature/home/tabs/home/technical_drawing/soccer_technical_drawing_view.dart';
import 'package:pedagogue/feature/tennis_ai/tennis_ai_screen.dart';

import '../../../../l10n/localization.dart';
import '../../../../shared/widget/custom_card_widget.dart';
import '../../../Coatching/ListOfCoatching.dart';
import '../../../RepergeEtReflection/HomeReperagee.dart';
import '../../../VideoRecorder/HomeVideoRecorder.dart';
import '../../../analyse_biomecanique_gestuelle/analyse_main.dart';
import '../../../baseBall_Ai/baseBall_ai_main.dart';
import '../../../charts/charts.dart';
import '../../../effectif/ListEffectif.dart';
import '../../../espqceEPS/espaceEpsListeScreen.dart';
import '../../../workout/workout_main.dart';
import '../../../workout_app/home_view.dart';
import 'bodybuilding_training/bodybuilding_training_view.dart';

// Example CardItem model (make sure you have this in your project)
class CardItem {
  final String title;
  final String? path;
  final IconData icon;
  final Widget destination;

  CardItem(
      {this.path,
      required this.title,
      required this.icon,
      required this.destination});
}

class GridListPage extends StatelessWidget {
  GridListPage({Key? key}) : super(key: key);

  // Your list of items
  final List<CardItem> items = [
    CardItem(
      path: "assets/Dumbell.png",
      title: intl.coatching,
      icon: Icons.home,
      destination: CoatchingListe(),
    ),
    CardItem(
        path: "assets/online-learning.png",
        title: intl.gameModel,
        icon: Icons.settings,
        destination: GameModelEBook()),
    CardItem(
        path: "assets/videoRecord.png",
        title: intl.videoRecord,
        icon: Icons.account_circle,
        destination: HomeVideoRecorder()),
    CardItem(
        path: "assets/technicalDrawing.png",
        title: intl.technicalDrawing,
        icon: Icons.account_circle,
        destination: TechnicalDrawingView()),
    CardItem(
        path: "assets/effectif.png",
        title: intl.effectif,
        icon: Icons.account_circle,
        destination: CardListScreen()),
    CardItem(
        path: "assets/bodyBuilding.png",
        title: intl.bodyBuildingTraining,
        icon: Icons.account_circle,
        destination: BodyBuildingTrainingView()),
    CardItem(
        path: "assets/espaceEps.png",
        title: intl.espaceEps,
        icon: Icons.account_circle,
        destination: EspaceEpsListInterface()),
    CardItem(
        path: "assets/joystick.png",
        title: "${intl.scoutingReflection}",
        icon: Icons.account_circle,
        destination: HomeReperage()),
    CardItem(
        path: "assets/pie-chart.png",
        title: intl.chart,
        icon: Icons.account_circle,
        destination: Charts()),
    CardItem(
        path: "assets/tennis.png",
        title: "${intl.tennis} Ai",
        icon: Icons.account_circle,
        destination: TennisAi()),
    CardItem(
        path: "assets/biomechanical.png",
        title: "${intl.gestureanalysis}",
        icon: Icons.account_circle,
        destination: AnalyseMain()),
    CardItem(
        path: "assets/baseball.png",
        title: "${intl.baseBall} Ai",
        icon: Icons.account_circle,
        destination: BaseBallAiMain()),

    CardItem(
        path: "assets/trainer.png",
        title: intl.workoutApp,
        icon: Icons.account_circle,
        destination: HomeViewWorkout()),

    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // Add th
      padding: const EdgeInsets.all(8.0),
      itemCount: items.length, // Number of items in your list
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 30.0, // Horizontal space between items
          mainAxisSpacing: 10.0, // Vertical space between items
          childAspectRatio: 1),
      itemBuilder: (context, index) {
        // Get current item
        final item = items[index];

        // Return a widget for the current item
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => item.destination),
            );
          },
          child: CustomCardWidget(
            title: item.title,
            path: item.path,
          ),
        );
      },
    );
  }
}
