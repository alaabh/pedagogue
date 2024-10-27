
import 'package:flutter/material.dart';
import 'package:pedagogue/model/bilan_fin_decycle_model.dart';

import '../../../controller/bilan_fin_decycle_controller.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/api_response.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import '../../espqceEPS/BilonFinCycle/BilanFinCycleScreen.dart';

class WidgetFinCycle extends StatefulWidget {
   final BilanFinCycle bilanFinCycle;
  final Function() loadDataFunction;
  const WidgetFinCycle({super.key, required this.bilanFinCycle, required this.loadDataFunction});

  @override
  State<WidgetFinCycle> createState() => _WidgetFinCycleState();
}

class _WidgetFinCycleState extends State<WidgetFinCycle> {
  @override
  Widget build(BuildContext context) {
   // API
   final BilanFinCycleController bilanFinCycleController = BilanFinCycleController();
    bilanFinCycleController.apiResponse.value = ApiResponse.completed();

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
                    '${widget.bilanFinCycle!.id} ',
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
                          builder: (context) => BilanFinCycleScreen(bilanFinCycle: widget.bilanFinCycle),
                        ),
                      )
                      .whenComplete(widget.loadDataFunction),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: AppColors.dangerColor),
                  onPressed: () => ApiViewHandler.withAlert(
                    context: context,
                    apiCall: bilanFinCycleController.delete(widget.bilanFinCycle.id),
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
