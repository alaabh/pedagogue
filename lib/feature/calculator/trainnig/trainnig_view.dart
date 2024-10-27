import 'package:flutter/material.dart';
import 'package:pedagogue/feature/calculator/trainnig/training_informations.dart';

import '../../../l10n/localization.dart';

class TrainingView extends StatefulWidget {
  const TrainingView({super.key});

  @override
  State<TrainingView> createState() => _TrainingViewState();
}

class _TrainingViewState extends State<TrainingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.trainingCalculation}"),
      ),
      body: TrainingInformations(),
    );
  }
}
