import 'package:flutter/material.dart';

import '../../../controller/observation_controller.dart';
import '../../../model/observation_model.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/api_response.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'grillObservationScreen.dart';

class widgetGrillDobservation extends StatefulWidget {
  final Observation? observation;
  final Function() loadDataFunction;


  const widgetGrillDobservation({super.key, this.observation, required this.loadDataFunction});

  @override
  State<widgetGrillDobservation> createState() => _widgetGrillDobservationState();
}

class _widgetGrillDobservationState extends State<widgetGrillDobservation> {
  @override
  Widget build(BuildContext context) {
    ObservationController observationController = ObservationController();
    observationController.apiResponse.value = ApiResponse.completed();

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
                    '${widget.observation!.id} ',
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
                      builder: (context) => grillObservation_screen(observation: widget.observation),
                    ),
                  )
                      .whenComplete(widget.loadDataFunction),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: AppColors.dangerColor),
                  onPressed: () => ApiViewHandler.withAlert(
                    context: context,
                    apiCall: observationController.delete(widget.observation?.id),
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
