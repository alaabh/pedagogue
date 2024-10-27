import 'package:flutter/material.dart';
import 'package:pedagogue/feature/Coatching/Training/trainigListe.dart';

import '../../l10n/localization.dart';
import 'ExerciceLibrary/ListeExerciceLibrery.dart';
import 'Exercices/ListeExercice.dart';
import 'Sessions/SessionsListe.dart';

class CoatchingListe extends StatelessWidget {
  CoatchingListe({super.key});

  final List<CardItem> cardItems = [
    CardItem(
        title: intl.coachingExercices,
        icon: "assets/gym.png",
        destination: ListeExercice()),
    CardItem(
        title: intl.coachingExercicesLib,
        icon: "assets/exercise.png",
        destination: ListExerciceLibrery()),
    CardItem(
        title: intl.coachingSessions,
        icon: "assets/session.png",
        destination: ListeSession()),
    CardItem(
        title: intl.coachingTraining,
        icon: "assets/courses.png",
        destination: TrainingList()),

    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.coatching),
      ),
      body: ListView.builder(
        itemCount: cardItems.length,
        itemBuilder: (context, index) {
          return CardItemWidget(cardItem: cardItems[index]);
        },
      ),
    );
  }
}

class CardItem {
  final String title;
  final String icon;
  final Widget destination;

  CardItem(
      {required this.title, required this.icon, required this.destination});
}

class CardItemWidget extends StatelessWidget {
  final CardItem cardItem;

  CardItemWidget({required this.cardItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Image.asset(
          cardItem.icon,
          width: MediaQuery.of(context).size.width * 0.08,
        ),
        title: Text(cardItem.title),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => cardItem.destination),
          );
        },
      ),
    );
  }
}
