import 'package:pedagogue/feature/espqceEPS/Horaire/horaire_screen.dart';
import 'package:pedagogue/feature/espqceEPS/fichePedagogurScreen.dart';

import '../../l10n/localization.dart';
import '../../model/EspaceEpsModel.dart';
import 'BilanDeSeance/BilanDeSeanceScreen.dart';
import 'BilonDuDebutDeCycle/BilonDuDebutDeCycle.dart';
import 'BilonFinCycle/BilanFinCycleScreen.dart';
import 'FicheDeNote/ficheDeNoteScreen.dart';
import 'GrilleObservation/grillObservationScreen.dart';
import 'GroupDeNiveau/GroupDeNiveauScreen.dart';
import 'RapportStage/RapportStageScreen.dart';
import 'charteDeAthlete/chartAtletView.dart';
import 'dixCommandementdDOR/DixCommandementDorScreen.dart';
import 'ficheDePresence/ficheDePresenceScreen.dart';
import 'interventionPedagogique/interventionPedagogiqueScreen.dart';

List<EspaceEps> espaceEpsList = [
  EspaceEps(
    title: intl.chartedeathete,
    imageUrl: 'assets/AthleteCharter.png',
    destination: chartAtletView(),
  ),
  EspaceEps(
      title: intl.dixcommandements,
      imageUrl: 'assets/TenGoldenCommandments.png',
      destination: DixCommendementDor()),
  EspaceEps(
    title: intl.instructionaldesign,
    imageUrl: 'assets/presentation.png',
    destination: interventionpedagogiqueScreen(),
  ),
  EspaceEps(
    title: intl.emploiduTemps,
    imageUrl: 'assets/Timetable.png',
    destination: HoraireScreen(),
  ),
  EspaceEps(
    title: intl.ficheDePresence,
    imageUrl: 'assets/schedule.png',
    destination: FicheDePresenceScreen(),
  ),
  EspaceEps(
    title: intl.ficheDeNote,
    imageUrl: 'assets/Gradesheet.png',
    destination: FicheDeNoteScreen(),
  ),
  EspaceEps(
    title: intl.listedesbilansdudebutdecycle,
    imageUrl: 'assets/Bilanofcyclereport.png',
    destination: BilanDebutDeCycleScreen(),
  ),
  EspaceEps(
    title: intl.ficheDeLaSeance,
    imageUrl: 'assets/Summaryofthesession.png',
    destination: BilanSeancescreen(),
  ),
  EspaceEps(
    title: intl.groupedeniveaux,
    imageUrl: 'assets/Levelgroup.png',
    destination: GroupNiveauScreen(),
  ),
  EspaceEps(
    title: intl.listedesbilansdufindecycle,
    imageUrl: 'assets/Endofcyclereport.png',
    destination: BilanFinCycleScreen(),
  ),
  EspaceEps(
    title: intl.griDobservation,
    imageUrl: 'assets/Observationgrid.png',
    destination: GrillObservationScreen(),
  ),
  EspaceEps(
    title: intl.fichePedagogique,
    imageUrl: 'assets/img.png',
    destination: FichePedagogique(),
  ),
  EspaceEps(
    title: intl.rapportdustage,
    imageUrl: 'assets/Filepedagogue.png',
    destination: RapportStageScreen(),
  ),
  // Add more espaceEps as needed
];

/*
void navigateToCharteAthlete(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => espaceEpsList[0].destination, // Use the correct index
    ),
  );
}

void navigateToNav2(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => espaceEpsList[1].destination, // Use the correct index
    ),
  );
}
*/
