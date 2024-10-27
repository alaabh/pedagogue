import 'package:flutter/material.dart';

import '../../../controller/joueurSuspended_controller.dart';
import '../../../model/JoueurSuspendu_model.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'createsusponduJoueur.dart';

class PlayerSusponduWidget extends StatelessWidget {
  final PlayerSuspended playerSuspended;
  final Function() loadDataFunction;

  const PlayerSusponduWidget({
    Key? key, // Corrected syntax for key
    required this.playerSuspended,
    required this.loadDataFunction,
  }) : super(key: key); // Corrected syntax for key

  @override
  Widget build(BuildContext context) {
    // API
    final JoueurSuspendedController joueurSuspendedController =
        JoueurSuspendedController();

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
                Text('${playerSuspended.player?.firstName}'),
                Text('suspension: ${playerSuspended.suspension_en}'),
                Text(
                    'startDateSuspension: ${playerSuspended.startDateSuspension}'),
                Text('endDateSuspension: ${playerSuspended.endDateSuspension}'),
                Text('comment: ${playerSuspended.comment}'),
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
                        builder: (context) => CreatesusponduJoueur(
                            playerSuspended: playerSuspended),
                      ),
                    )
                    .whenComplete(loadDataFunction),
              ),
              IconButton(
                icon: Icon(Icons.delete, color: AppColors.dangerColor),
                onPressed: () => ApiViewHandler.withAlert(
                  context: context,
                  apiCall:
                      joueurSuspendedController.delete(playerSuspended.id!),
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
