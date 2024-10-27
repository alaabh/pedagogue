
import 'package:flutter/material.dart';
import 'package:pedagogue/feature/document/planAnnuleStep2/planAnnuleStep2.dart';
import 'package:pedagogue/feature/document/planAnnulsStep1/planAnnulestep1.dart';
import '../../../controller/displineController/step2_controller.dart';
import '../../../model/displineModel/step2_model.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/api_response.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class widgetStep2 extends StatefulWidget {
  final Step2Model? step2model;
  final Function() loadDataFunction;

  const widgetStep2({super.key,  this.step2model, required this.loadDataFunction});

  @override
  State<widgetStep2> createState() => _widgetStep2State();
}

class _widgetStep2State extends State<widgetStep2> {
  @override
  Widget build(BuildContext context) {
    final Step2Controller step2Controller = Step2Controller();
    step2Controller.apiResponse.value = ApiResponse.completed();

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
                    '${widget.step2model!.id} ',
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
                      builder: (context) => planAnnulStep2(step2model: widget.step2model),
                    ),
                  )
                      .whenComplete(widget.loadDataFunction),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: AppColors.dangerColor),
                  onPressed: () => ApiViewHandler.withAlert(
                    context: context,
                    apiCall: step2Controller.delete(widget.step2model?.id),
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
