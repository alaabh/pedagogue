import 'package:flutter/material.dart';
import 'package:pedagogue/feature/bibliotheque/FormationVideo/polymetric/polymetric_screen.dart';
import 'package:pedagogue/feature/bibliotheque/FormationVideo/scorOffSide/scorOffSide_screen.dart';
import 'package:pedagogue/feature/bibliotheque/FormationVideo/technical1215/techniocal1215_screen.dart';
import 'package:pedagogue/l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import 'CollectiveInelligen/collectiveInteligente_screen.dart';
import 'FootBalTactical/footBolTactical_screen.dart';
import 'FootbalExercice_screen.dart';
import 'TacticalZone/tacticalZone_screen.dart';
import 'coatching18/coatching18_screen.dart';
import 'gamesTactic/gameTactics_screen.dart';
import 'muscleBuilding/muscleBuilding_screen.dart';

class FormationVideo {
  final String title;
  final Widget destinationPage;

  FormationVideo(this.title, this.destinationPage);
}

// Widget principal FormationVideoHome
class FormationVideoHome extends StatelessWidget {
  const FormationVideoHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Liste des vidéos avec leur destination
    final List<FormationVideo> videos = [
      FormationVideo(intl.formationVideosTitle1, FootballExercice_screen()),
      FormationVideo(intl.formationVideosTitle2, FootballTactical_screen()),
      FormationVideo(
          intl.formationVideosTitle3, collectiveIntelligente_screen()),
      FormationVideo(intl.formationVideosTitle4, ScoreOffSide_screen()),
      FormationVideo(intl.formationVideosTitle5, TacticalZone_screen()),
      FormationVideo(intl.formationVideosTitle6, TacticalGame_screen()),
      FormationVideo(intl.formationVideosTitle8, MuscleBuilding_screen()),
      FormationVideo(intl.formationVideosTitle9, technoical1215_screen()),
      FormationVideo(intl.formationVideosTitle10, coatching18_screen()),
      FormationVideo(intl.formationVideosTitle11, polymetric_screen()),
      FormationVideo(intl.formationVideosTitle12, FootballTactical_screen()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(intl.formationVideos),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Dimensions.paddingLarge,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: videos
                .map((video) => Card(
                      child: ListTile(
                        title: Text(video.title),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => video.destinationPage));
                        },
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

// Exemple de page de destination pour les exercices de football
class FootballExercisesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.formationVideosTitle1),
      ),
      body: const Center(
        child: Text('Content for Football Exercises'),
      ),
    );
  }
}
