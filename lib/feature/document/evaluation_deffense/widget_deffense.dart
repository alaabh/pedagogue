import 'package:flutter/material.dart';
import 'package:pedagogue/controller/evaluation_by_position_controller/deffense_controller.dart';
import 'package:pedagogue/feature/evaluationByPosition/deffense/deffense_view.dart';
import 'package:pedagogue/model/evaluation_by_program_model/defense_model.dart';

import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/api_response.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class WidgetDeffense extends StatefulWidget {
   final DeffenseModel deffenseModel;
  final Function() loadDataFunction;
  const WidgetDeffense({super.key, required this.deffenseModel, required this.loadDataFunction});

  @override
  State<WidgetDeffense> createState() => _WidgetDeffenseState();
}

class _WidgetDeffenseState extends State<WidgetDeffense> {
  @override
  Widget build(BuildContext context) {
   // API
   final DeffenseController deffenseController = DeffenseController();
    deffenseController.apiResponse.value = ApiResponse.completed();

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
                    '${widget.deffenseModel!.id} ',
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
                          builder: (context) =>DeffenseView(deffenseModel: widget.deffenseModel),
                        ),
                      )
                      .whenComplete(widget.loadDataFunction),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: AppColors.dangerColor),
                  onPressed: () => ApiViewHandler.withAlert(
                    context: context,
                    apiCall: deffenseController.delete(widget.deffenseModel.id),
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