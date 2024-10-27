import 'package:flutter/material.dart';
import 'package:pedagogue/feature/game_model_e_book/positional_responsibilities/positional_responsibilities.dart';
import 'package:pedagogue/l10n/localization.dart';

import 'developement/development.dart';
import 'four_corner/four_corner.dart';
import 'game_model/game_model.dart';
import 'line_up/line_up.dart';
import 'pitch_zone/pitch_zone.dart';
import 'principles_of_plays/principles_of_plays.dart';
import 'strength_weaknesses/strength_weakness.dart';
import 'system_of_play/system_of_play.dart';
import 'tactical_adaptions/tactical_adaptions.dart';
import 'the_individual/the_individual.dart';

class GameModelEBook extends StatefulWidget {
  const GameModelEBook({super.key});

  @override
  State<GameModelEBook> createState() => _GameModelEBookState();
}

class _GameModelEBookState extends State<GameModelEBook> {
  List<Map<String, dynamic>> list = [
    {
      "title": intl.principlesofplayList,
      "root": PrinciplesOfPlays(),
    },
    {
      "title": intl.gameModelList,
      "root": GameModel(),
    },
    {
      "title": intl.pitchZoneList,
      "root": PitchZone(),
    },
    {
      "title": intl.fourcornerList,
      "root": FourCorner(),
    },
    {
      "title": intl.theIndividualList,
      "root": TheIndividual(),
    },
    {
      "title": intl.developmentList,
      "root": Development(),
    },
    {
      "title": intl.systemofPlayList,
      "root": SystemOfPlay(),
    },
    {
      "title": intl.lineUpList,
      "root": LineUp(),
    },
    {
      "title": intl.strengthWeaknessesList,
      "root": StrengthWeaknesses(),
    },
    {
      "title": intl.tacticalAdaptionsList,
      "root": TacticalAdaptions(),
    },
    {
      "title": intl.positionalResponsibilitiesList,
      "root": PositionalResponsibilities(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.gameModel),
      ),
      body: ListView.builder(
        itemCount: list.length, // Nombre total de modules.
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text('${list[index]['title']}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              leading: Icon(Icons.dashboard, color: Colors.blueGrey),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => list[index]['root'],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
