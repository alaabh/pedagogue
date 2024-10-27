import 'package:flutter/material.dart';
import 'package:pedagogue/feature/espqceEPS/EspaceEpsCard.dart';

import '../../l10n/localization.dart';
import '../../model/EspaceEpsModel.dart';
import 'espaceEpsList.dart';

class EspaceEpsListInterface extends StatelessWidget {
  const EspaceEpsListInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.espaceEps),
      ),
      body: ListView.builder(
        itemCount: espaceEpsList.length,
        itemBuilder: (context, index) {
          EspaceEps espaceEps = espaceEpsList[index];

          return EspaceEpsCard(espaceEps: espaceEps);
        },
      ),
    );
  }
}
