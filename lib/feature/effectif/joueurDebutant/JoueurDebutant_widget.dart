import 'package:flutter/material.dart';
import 'package:pedagogue/shared/style/dimensions.dart';

import '../../../controller/joueurStarting_controller.dart';
import '../../../l10n/localization.dart';
import '../../../model/PlayerStarting_model.dart';
import '../../../shared/style/app_color.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'createStartingPlayer.dart';

class PlayerDebutantWidget extends StatelessWidget {
  final PlayerStarting? playerStarting;
  final Function() loadDataFunction;

  const PlayerDebutantWidget({
    Key? key, // Corrected syntax for key
    this.playerStarting,
    required this.loadDataFunction,
  }) : super(key: key); // Corrected syntax for key

  @override
  Widget build(BuildContext context) {
    // API
    final JoueurStartingController joueurStartingController =
        JoueurStartingController();

    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: Dimensions.mediumValue,
        horizontal: Dimensions.largeValue,
      ),
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
                Text('${playerStarting?.team}'),
                Text('${intl.birthdate}: ${playerStarting?.season}'),
                Text('${intl.birthPlace}: ${playerStarting?.player}'),
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
                        builder: (context) => CreatingStartingPlayer(
                            playerStarting: playerStarting),
                      ),
                    )
                    .whenComplete(loadDataFunction),
              ),
              IconButton(
                icon: Icon(Icons.delete, color: AppColors.dangerColor),
                onPressed: () => ApiViewHandler.withAlert(
                  context: context,
                  apiCall: joueurStartingController.delete(playerStarting?.id ??
                      0), // Access id with null check and default value
                  successFunction: loadDataFunction,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
