import 'package:flutter/material.dart';
import 'package:pedagogue/controller/planingLeasonService.dart';
import 'package:pedagogue/model/planingLeason_model.dart';

import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/api_response.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import '../../trainingBook/planingLeason/planingLeasonView.dart';

class WidgetPlaningLeason extends StatefulWidget {
   final PlaningLeasonModel planingLeasonModel;
  final Function() loadDataFunction;
  const WidgetPlaningLeason({super.key, required this.loadDataFunction, required this.planingLeasonModel});

  @override
  State<WidgetPlaningLeason> createState() => _WidgetPlaningLeasonState();
}

class _WidgetPlaningLeasonState extends State<WidgetPlaningLeason> {
  @override
  Widget build(BuildContext context) {
   // API
   final PlaningLeasonController planingLeasonController = PlaningLeasonController();
    planingLeasonController.apiResponse.value = ApiResponse.completed();

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
                    '${widget.planingLeasonModel!.id} ',
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
                          builder: (context) => PlaningLeasonView(planingLeasonModel: widget.planingLeasonModel),
                        ),
                      )
                      .whenComplete(widget.loadDataFunction),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: AppColors.dangerColor),
                  onPressed: () => ApiViewHandler.withAlert(
                    context: context,
                    apiCall: planingLeasonController.delete(widget.planingLeasonModel.id),
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