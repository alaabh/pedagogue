import 'package:flutter/material.dart';

import '../../l10n/localization.dart';
import 'Joueur/ListJoueurScreen.dart';
import 'JoueurBlessai/ListJoueursBlessai.dart';
import 'JoueurSuspondu/ListeJoueursSuspondu.dart';
import 'JoueursDessai/ListJoueursDessai.dart';
import 'joueurDebutant/ListeJoueurDebutant.dart';
import 'presenceJoueurs/ListePresenceJoueurs.dart';

class CardListScreen extends StatelessWidget {
  final List<CardItem> cardItems = [
    CardItem(
        title: intl.players,
        icon: "assets/team.png",
        destination: JoueurListView()),
    CardItem(
        title: intl.trialPlayers,
        icon: "assets/approval.png",
        destination: ListJoueursDessai()),
    CardItem(
        title: intl.injuredPlayers,
        icon: "assets/injured.jpg",
        destination: ListJoueurBlessai()),
    CardItem(
        title: intl.suspendedPlayers,
        icon: "assets/suspended.png",
        destination: ListeJoueurSuspondu()),
    CardItem(
        title: intl.startingPlayers,
        icon: "assets/starting.png",
        destination: ListeJoueursDebutant()),
    CardItem(
        title: intl.playersAttendance,
        icon: "assets/fast.png",
        destination: ListePresenceJoueurs()),

    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.effectif),
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
