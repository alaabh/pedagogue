import 'package:flutter/material.dart';
import 'package:pedagogue/model/fiche_pedagogue_model.dart';
import 'package:pedagogue/utils/resources/api/api_view_handler.dart';

import '../../../controller/fiche_pedagogue_controller.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/api_response.dart';
import '../../espqceEPS/fichePedagogurScreen.dart';

class WidgetFichePedagogue extends StatefulWidget {
  final FichePedagogue fichePedagogue;
  final Function() loadDataFunction;
  const WidgetFichePedagogue(
      {super.key,
      required this.fichePedagogue,
      required this.loadDataFunction});

  @override
  State<WidgetFichePedagogue> createState() => _WidgetFichePedagogueState();
}

class _WidgetFichePedagogueState extends State<WidgetFichePedagogue> {
  @override
  Widget build(BuildContext context) {
    final FichePedagogueController fichePedagogueController =
        FichePedagogueController();
    fichePedagogueController.apiResponse.value = ApiResponse.completed();

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
                  Text(
                    '${widget.fichePedagogue.value1} ',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
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
                          builder: (context) => FichePedagogique(
                              fichePedagogue: widget.fichePedagogue),
                        ),
                      )
                      .whenComplete(widget.loadDataFunction),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: AppColors.dangerColor),
                  onPressed: () => ApiViewHandler.withAlert(
                    context: context,
                    apiCall: fichePedagogueController
                        .delete(widget.fichePedagogue?.id),
                    successFunction: widget.loadDataFunction,
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
