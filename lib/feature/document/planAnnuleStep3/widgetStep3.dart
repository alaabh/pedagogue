
import 'package:flutter/material.dart';
import 'package:pedagogue/feature/document/planAnnuleStep3/planAnnuleStep3.dart';
import 'package:pedagogue/feature/document/planAnnulsStep1/planAnnulestep1.dart';
import '../../../controller/displineController/step3_controller.dart';
import '../../../model/displineModel/step3_model.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/api_response.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class widgetStep3 extends StatefulWidget {
  final Step3Model? step3model;
  final Function() loadDataFunction;

  const widgetStep3({super.key,  this.step3model, required this.loadDataFunction});

  @override
  State<widgetStep3> createState() => _widgetStep3State();
}

class _widgetStep3State extends State<widgetStep3> {
  @override
  Widget build(BuildContext context) {
    final Step3Controller step3Controller = Step3Controller();
    step3Controller.apiResponse.value = ApiResponse.completed();

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
                    '${widget.step3model!.id} ',
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
                      builder: (context) => planAnnulStep3(step3model: widget.step3model),
                    ),
                  )
                      .whenComplete(widget.loadDataFunction),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: AppColors.dangerColor),
                  onPressed: () => ApiViewHandler.withAlert(
                    context: context,
                    apiCall: step3Controller.delete(widget.step3model?.id),
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
