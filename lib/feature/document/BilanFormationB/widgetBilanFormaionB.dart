import 'package:flutter/material.dart';
import '../../../controller/reportSemestre2_model.dart';
import '../../../model/rapport_semestre1_model.dart';
import '../../../model/rapport_semestre2_model.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/api_response.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import '../bilanDeFormation/bilanDeFormation_screen.dart';
import 'bilanFormationB_scrren.dart';

class widgetBilanFormationB extends StatefulWidget {
  final RapportSemestre2Model? rapportSemestre2Model ;
  final Function() loadDataFunction;

  const widgetBilanFormationB({super.key, required this.loadDataFunction, this.rapportSemestre2Model, });

  @override
  State<widgetBilanFormationB> createState() => _widgetBilanFormationBState();
}

class _widgetBilanFormationBState extends State<widgetBilanFormationB> {
  @override
  Widget build(BuildContext context) {
    RapportSmestre2Controller rapportSmestre2Controller =
    RapportSmestre2Controller();
    rapportSmestre2Controller.apiResponse.value = ApiResponse.completed();

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
                    '${widget.rapportSemestre2Model!.id} ',
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
                      builder: (context) => bilanFormationBScreen(rapportSemestre2Model: widget.rapportSemestre2Model),
                    ),
                  )
                      .whenComplete(widget.loadDataFunction),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: AppColors.dangerColor),
                  onPressed: () => ApiViewHandler.withAlert(
                    context: context,
                    apiCall: rapportSmestre2Controller.delete(widget.rapportSemestre2Model?.id),
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
