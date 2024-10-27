import 'package:flutter/material.dart';
import 'package:pedagogue/controller/evaluation_by_position_controller/middle_controller.dart';
import 'package:pedagogue/feature/evaluationByPosition/middle/middle_view.dart';
import 'package:pedagogue/model/evaluation_by_program_model/middle_model.dart';

import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/api_response.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class WidgetMiddle extends StatefulWidget {
   final MiddleModel middleModel;
  final Function() loadDataFunction;
  const WidgetMiddle({super.key, required this.middleModel, required this.loadDataFunction});

  @override
  State<WidgetMiddle> createState() => _WidgetMiddleState();
}

class _WidgetMiddleState extends State<WidgetMiddle> {
  @override
  Widget build(BuildContext context) {
   // API
   final MiddleController middleController = MiddleController();
    middleController.apiResponse.value = ApiResponse.completed();

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
                    '${widget.middleModel!.id} ',
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
                          builder: (context) => MiddleView(middleModel: widget.middleModel),
                        ),
                      )
                      .whenComplete(widget.loadDataFunction),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: AppColors.dangerColor),
                  onPressed: () => ApiViewHandler.withAlert(
                    context: context,
                    apiCall: middleController.delete(widget.middleModel.id),
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