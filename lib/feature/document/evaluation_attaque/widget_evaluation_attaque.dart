import 'package:flutter/material.dart';
import 'package:pedagogue/controller/evaluation_by_position_controller/attaque_controller.dart';
import 'package:pedagogue/feature/evaluationByPosition/attaque/attaque_view.dart';
import 'package:pedagogue/model/evaluation_by_program_model/attaque_model.dart';

import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/api_response.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class WidgetAttaque extends StatefulWidget {
   final AttaqueModel attaqueModel;
  final Function() loadDataFunction;
  const WidgetAttaque({super.key, required this.attaqueModel, required this.loadDataFunction});

  @override
  State<WidgetAttaque> createState() => _WidgetAttaqueState();
}

class _WidgetAttaqueState extends State<WidgetAttaque> {
  @override
  Widget build(BuildContext context) {
   // API
   final AttaqueController attaqueController = AttaqueController();
    attaqueController.apiResponse.value = ApiResponse.completed();

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
                    '${widget.attaqueModel!.id} ',
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
                          builder: (context) => AttaqueView(attaqueModel: widget.attaqueModel),
                        ),
                      )
                      .whenComplete(widget.loadDataFunction),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: AppColors.dangerColor),
                  onPressed: () => ApiViewHandler.withAlert(
                    context: context,
                    apiCall: attaqueController.delete(widget.attaqueModel.id),
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