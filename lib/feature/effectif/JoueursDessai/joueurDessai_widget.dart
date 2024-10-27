import 'package:flutter/material.dart';
import 'package:pedagogue/shared/style/dimensions.dart';

import '../../../controller/JoueurDessai_controller.dart';
import '../../../l10n/localization.dart';
import '../../../model/joueurDessai.dart';
import '../../../shared/style/app_color.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'CreateJoueurDessai.dart';

class PlayerDessaiWidget extends StatelessWidget {
  final JoueurDessai joueurDessai;
  final Function() loadDataFunction;

  const PlayerDessaiWidget({
    Key? key, // Corrected syntax for key
    required this.joueurDessai,
    required this.loadDataFunction,
  }) : super(key: key); // Corrected syntax for key

  @override
  Widget build(BuildContext context) {
    // API
    final JoueurDessaiController joueurDessaiController =
        JoueurDessaiController();

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
                Text('${joueurDessai.post}'),
                Text('${intl.birthdate}: ${joueurDessai.birthdate}'),
                Text('${intl.birthPlace}: ${joueurDessai.birthplace}'),
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
                            createJoueurDessai(joueurDessai: joueurDessai),
                      ),
                    )
                    .whenComplete(loadDataFunction),
              ),
              IconButton(
                icon: Icon(Icons.delete, color: AppColors.dangerColor),
                onPressed: () => ApiViewHandler.withAlert(
                  context: context,
                  apiCall: joueurDessaiController.delete(joueurDessai.id!),
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
