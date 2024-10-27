import 'package:flutter/material.dart';
import 'package:pedagogue/shared/style/dimensions.dart';
import '../../../trainingBook/trainingBookMain.dart';



class TrainingBookWidgetWidget extends StatelessWidget {
  const TrainingBookWidgetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimensions.paddingMedium,
      child: SizedBox(
        height: 55,
        width: double.maxFinite,
        child: FilledButton.icon(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const TrainingBookMain(),
            ),
          ),
          label: Text("trainning Book"),
          icon: const Icon(Icons.live_tv),
        ),
      ),
    );
  }
}
