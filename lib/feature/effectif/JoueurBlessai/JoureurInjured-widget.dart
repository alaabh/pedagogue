import 'package:flutter/material.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/shared/style/dimensions.dart';

import '../../../controller/joueurInjured_controller.dart';
import '../../../model/injuredPlayer_model.dart';
import '../../../shared/style/app_color.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'createJoueurBlessaiScreen.dart';

class PlayerInjuredWidget extends StatelessWidget {
  final PlayerInjured playerInjured;
  final Function() loadDataFunction;

  const PlayerInjuredWidget({
    Key? key, // Corrected syntax for key
    required this.playerInjured,
    required this.loadDataFunction,
  }) : super(key: key); // Corrected syntax for key

  @override
  Widget build(BuildContext context) {
    // API
    final JoueurInjuredController joueurInjuredController =
        JoueurInjuredController();

    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: Dimensions.mediumValue,
        horizontal: Dimensions.largeValue,
      ),
      child: Padding(
        padding: Dimensions.paddingLarge,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  Text('${playerInjured.firstName} ${playerInjured.lastName}',
                  //   style: Theme.of(context).textTheme.titleLarge,
                  //  ),
                  Text('${playerInjured.injury_en}'),
                  Text('${intl.birthdate}: ${playerInjured.startDateInjury}'),
                  Text('${intl.birthPlace}: ${playerInjured.endDateInjury}'),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: AppColors.warningColor),
                  onPressed: () => Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) =>
                              CreateJoueurBlessai(playerInjured: playerInjured),
                        ),
                      )
                      .whenComplete(loadDataFunction),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: AppColors.dangerColor),
                  onPressed: () => ApiViewHandler.withAlert(
                    context: context,
                    apiCall: joueurInjuredController.delete(playerInjured.id!),
                    successFunction: loadDataFunction,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
