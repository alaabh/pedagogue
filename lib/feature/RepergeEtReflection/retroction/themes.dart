
import 'package:flutter/material.dart';
import 'package:pedagogue/shared/widget/TextFieldGrand.dart';

import '../../../shared/widget/checkboxList.dart';

class themeRetroaction extends StatefulWidget {
  const themeRetroaction({super.key});

  @override
  State<themeRetroaction> createState() => _themeRetroactionState();
}

class _themeRetroactionState extends State<themeRetroaction> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text("competences d'entrainment"),
              CheckboxList(),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text("APPLICATION DE LA PHILOSOPHIE DU CLUB"),
              CheckboxList(),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text("CONFIANCE EN L'ENTRAÎNEMENT"),
              CheckboxList(),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text("NIVEAU DE SOUTIEN REÇU"),
              CheckboxList(),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text("BIEN-ÊTRE GLOBAL"),
              CheckboxList(),
            ],
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              Text("PLAISIR"),
              CheckboxList(),
            ],
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              Text("PROGRÈS"),
              CheckboxList(),
            ],
          ),
          const SizedBox(height: 20),

          Text('QUE FAITES-VOUS ACTUELLEMENT POUR ATTEINDRE VOS OBJECTIFS ? (QUALIFICATIONS)'),
          TextFieldGrand(),
          const SizedBox(height: 20),
          Text("COMMENT ONT ÉTÉ VOS EXPÉRIENCES JUSQU'ICI AVEC LE CLUB ? (EXPÉRIENCE)"),
          TextFieldGrand(),
          const SizedBox(height: 20),
          Text("QUELS ASPECTS DU MODÈLE À QUATRE CORNERS NÉCESSITENT UNE ÉTUDE SUPPLÉMENTAIRE ?"),
          TextFieldGrand(),
          const SizedBox(height: 20),
          Text("COMMENT ÉVALUERIEZ-VOUS VOS RELATIONS AVEC CHAQUE MEMBRE DU TRIANGLE SPORTIF ?"),
          TextFieldGrand(),
          const SizedBox(height: 20),
          Text("QUEL DOMAINE DÉVELOPPEZ-VOUS POUR AMÉLIORER VOTRE GAMME DE COMPÉTENCES ET VOTRE PRESTATION ?"),
          TextFieldGrand(),
          const SizedBox(height: 20),
         Text("OÙ AVEZ-VOUS BESOIN D'AIDE SUPPLÉMENTAIRE DANS VOTRE RÔLE GLOBAL ?"),
          TextFieldGrand(),
          const SizedBox(height: 20),
          Text("QUEL SOUTIEN AI-JE BESOIN ? QUI DOIT ÊTRE IMPLIQUÉ ?"),
          TextFieldGrand(),
          const SizedBox(height: 20),


        ],
      ),

    );
  }
}
