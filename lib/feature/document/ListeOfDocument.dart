import 'package:flutter/material.dart';
import 'package:pedagogue/feature/document/BilanFinCycle/BilanFinCycle.dart';
import 'package:pedagogue/feature/document/evaluation_attaque/evaluation_attaque.dart';
import 'package:pedagogue/feature/document/evaluation_deffense/evaluation_defense.dart';
import 'package:pedagogue/feature/document/evaluation_goal_keeper/evaluation_goal_keeper.dart';
import 'package:pedagogue/feature/document/evaluation_middle/evaluation_middle.dart';
import 'package:pedagogue/feature/document/leason_planing/leason_planing.dart';
import 'package:pedagogue/feature/document/planAnnuleStep2/planAnnuleStep2.dart';
import 'package:pedagogue/feature/document/planAnnuleStep3/planAnnuleStep3.dart';
import 'package:pedagogue/feature/document/planAnnulsStep1/planAnnulestep1.dart';
import 'package:pedagogue/feature/document/rapportStage/rapportStageHome.dart';
import 'package:pedagogue/model/document/destination.dart';

import '../../l10n/localization.dart';
import 'FichDiBilanDEDebut/FicheDuBilanDebut.dart';
import 'bilanSeances/bilanSeance_screen.dart';
import 'emploiDuTemps/EmploiDuTempsHome.dart';
import 'fichePedagogique/fichePedagogique_screen.dart';
import 'grillObservation/grillObservationScreen.dart';

class ListofHistory extends StatelessWidget {
  ListofHistory({super.key});

  final List<Destination> destinations = [
    Destination(intl.emploiduTemps, FmploiDuTempsHome()),
    Destination(intl.rapportdustage, RapportStageHome()),
    Destination(intl.listedesbilansdudebutdecycle, FicheBilanDebut()),
    Destination(intl.listedesbilansdufindecycle, BilanFinCycle()),
    Destination(intl.goalkeeper, GoalKeeper()),
    Destination(intl.attacker, Attaque()),
    Destination(intl.defender, Deffense()),
    Destination(intl.middle, Middle()),
    Destination(intl.planingALeason, LeasonPlaning()),
    Destination(intl.ficheDeLaSeance, bilanSeanceScreen()),
    Destination(intl.griDobservation, grillObservation_screen()),
    Destination(intl.fichePedagogique, fichePedagogique()),
    Destination(intl.step1, planAnnulStep1()),
    Destination(intl.step2, planAnnulStep2()),
    Destination(intl.step3, planAnnulStep3()),

    // Add more destinations as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(destinations[index].title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => destinations[index].page),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
