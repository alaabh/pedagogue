import 'package:flutter/material.dart';
import 'package:pedagogue/feature/effectif/Joueur/one_joueur_page.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/shared/style/dimensions.dart';

import '../../../controller/joueur_controller.dart';
import '../../../model/Joueur_model.dart';
import '../../../shared/style/app_color.dart';
import '../../../utils/resources/api/api_response.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'createJoueurScreen.dart';

class PlayerWidget extends StatelessWidget {
  final Player player;
  final Function() loadDataFunction;

  const PlayerWidget({
    Key? key, // Corrected syntax for key
    required this.player,
    required this.loadDataFunction,
  }) : super(key: key); // Corrected syntax for key

  @override
  Widget build(BuildContext context) {
    // API
    final JoueurController joueurController = JoueurController();
    joueurController.apiResponse.value = ApiResponse.completed();

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OneJoueurPage(player: player,),
          ),
        );
      },
      child: Card(
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
                    Text(
                      '${player.firstName} ${player.lastName}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text('${player.post_en}'),
                    Text('${intl.birthdate}: ${player.birthdate}'),
                    Text('${intl.birthPlace}: ${player.birthplace}'),
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
                            builder: (context) => CreateJoueur(player: player),
                          ),
                        )
                        .whenComplete(loadDataFunction),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: AppColors.dangerColor),
                    onPressed: () => ApiViewHandler.withAlert(
                      context: context,
                      apiCall: joueurController.delete(player.id!),
                      successFunction: loadDataFunction,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
