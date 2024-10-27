import 'package:flutter/material.dart';

import '../../../controller/joueurPresence_controller.dart';
import '../../../l10n/localization.dart';
import '../../../model/JoueurPresence_model.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'createPresencePlyer.dart';

class PlayerPresenceWidget extends StatelessWidget {
  final JoueurPresence joueurPresence;
  final Function() loadDataFunction;

  const PlayerPresenceWidget({
    Key? key, // Corrected syntax for key
    required this.joueurPresence,
    required this.loadDataFunction,
  }) : super(key: key); // Corrected syntax for key

  @override
  Widget build(BuildContext context) {
    // API
    final JoueurPresenceController joueurPresenceController =
        JoueurPresenceController();

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
                Text('${intl.name}: ${joueurPresence.player?.firstName}'),
                Text('${intl.type}: ${joueurPresence.type_ar}'),
                Text('${intl.dateDebut}: ${joueurPresence.startDatePresence}'),
                Text('${intl.dateFin}: ${joueurPresence.endDatePresence}'),
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
                        builder: (context) => createPresencePlyer(),
                      ),
                    )
                    .whenComplete(loadDataFunction),
              ),
              IconButton(
                icon: Icon(Icons.delete, color: AppColors.dangerColor),
                onPressed: () => ApiViewHandler.withAlert(
                  context: context,
                  apiCall: joueurPresenceController.delete(joueurPresence.id!),
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
