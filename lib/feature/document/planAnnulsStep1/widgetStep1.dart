
import 'package:flutter/material.dart';
import 'package:pedagogue/feature/document/planAnnulsStep1/planAnnulestep1.dart';
import '../../../controller/displineController/step1_controller.dart';
import '../../../model/displineModel/step1_model.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/api_response.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import '../planAnnuleStep3/planAnnuleStep3.dart';

class widgetStep1 extends StatefulWidget {
  final Step1Model? step1model;
  final Function() loadDataFunction;

  const widgetStep1({super.key,  this.step1model, required this.loadDataFunction});

  @override
  State<widgetStep1> createState() => _widgetStep1State();
}

class _widgetStep1State extends State<widgetStep1> {
  @override
  Widget build(BuildContext context) {
    final Step1Controller step1Controller = Step1Controller();
    step1Controller.apiResponse.value = ApiResponse.completed();

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
                    '${widget.step1model!.id} ',
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
                      builder: (context) => planAnnulStep1(step1model: widget.step1model),
                    ),
                  )
                      .whenComplete(widget.loadDataFunction),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: AppColors.dangerColor),
                  onPressed: () => ApiViewHandler.withAlert(
                    context: context,
                    apiCall: step1Controller.delete(widget.step1model?.id),
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
