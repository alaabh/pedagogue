import 'package:flutter/material.dart';

import '../../../controller/bilanDebutCycle_controller.dart';
import '../../../model/bilanDebutCycleModel.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/api_response.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import '../../espqceEPS/BilonDuDebutDeCycle/BilonDuDebutDeCycle.dart';

class WidgetBilanDebut extends StatefulWidget {
   final BilanDebutCycle bilanDebutCycle;
  final Function() loadDataFunction;
  const WidgetBilanDebut({super.key, required this.bilanDebutCycle, required this.loadDataFunction});

  @override
  State<WidgetBilanDebut> createState() => _WidgetBilanDebutState();
}

class _WidgetBilanDebutState extends State<WidgetBilanDebut> {
  @override
  Widget build(BuildContext context) {
   // API
   final BilanDebutCycleController bilanDebutCycleController = BilanDebutCycleController();
    bilanDebutCycleController.apiResponse.value = ApiResponse.completed();

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
                    '${widget.bilanDebutCycle!.id} ',
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
                          builder: (context) => BilanDebutDeCycleScreen(bilanDebutCycle: widget.bilanDebutCycle),
                        ),
                      )
                      .whenComplete(widget.loadDataFunction),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: AppColors.dangerColor),
                  onPressed: () => ApiViewHandler.withAlert(
                    context: context,
                    apiCall: bilanDebutCycleController.delete(widget.bilanDebutCycle.id),
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
