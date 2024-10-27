import 'package:flutter/material.dart';
import 'package:pedagogue/model/rapport_semestre2_model.dart';
import '../../../controller/rapportSemestre1_controller.dart';
import '../../../model/rapport_semestre1_model.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/api_response.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'bilanDeFormation_screen.dart';

class widgetBilanFormation extends StatefulWidget {
   final RapportSemestre1Model? rapportSemestreModel ;
  final Function() loadDataFunction;

  const widgetBilanFormation({super.key, required this.loadDataFunction,
    this.rapportSemestreModel});

  @override
  State<widgetBilanFormation> createState() => _widgetBilanFormationState();
}

class _widgetBilanFormationState extends State<widgetBilanFormation> {
  @override
  Widget build(BuildContext context) {
    RapportSmestre1Controller rapportSmestre1Controller =
    RapportSmestre1Controller();
    rapportSmestre1Controller.apiResponse.value = ApiResponse.completed();

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
                    '${widget.rapportSemestreModel!.id} ',
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
                      builder: (context) => bilanDeFormationScreen(rapportSemestreModel: widget.rapportSemestreModel),
                    ),
                  )
                      .whenComplete(widget.loadDataFunction),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: AppColors.dangerColor),
                  onPressed: () => ApiViewHandler.withAlert(
                    context: context,
                    apiCall: rapportSmestre1Controller.delete(widget.rapportSemestreModel?.id),
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
