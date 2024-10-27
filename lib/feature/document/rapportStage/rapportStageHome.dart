import 'package:flutter/material.dart';

import '../../../l10n/localization.dart';

class RapportStageHome extends StatefulWidget {
  const RapportStageHome({super.key});

  @override
  State<RapportStageHome> createState() => _RapportStageHomeState();
}

class _RapportStageHomeState extends State<RapportStageHome> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:Text(intl.rapportdustage)),
      body: Column(
        children: [],
      ),
    );
  }
}
