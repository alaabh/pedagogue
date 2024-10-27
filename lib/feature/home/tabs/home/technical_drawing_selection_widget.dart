import 'package:flutter/material.dart';
import 'package:pedagogue/feature/home/tabs/home/technical_drawing/soccer_technical_drawing_view.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/shared/style/dimensions.dart';

class TechnicalDrawingSelectionWidget extends StatelessWidget {
  const TechnicalDrawingSelectionWidget({super.key});

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
              builder: (context) => const TechnicalDrawingView(),
            ),
          ),
          label: Text(intl.technicalDrawing),
          icon: const Icon(Icons.draw),
        ),
      ),
    );
  }
}
