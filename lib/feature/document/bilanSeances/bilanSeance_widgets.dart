import 'package:flutter/material.dart';
import '../../../controller/bilanSeance_controlle.dart';
import '../../../model/BilanSeance_model.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/api_response.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'bilanSeance_screen.dart';

class widgetBilanSeance extends StatefulWidget {
  final BilanSeance? bilanSeance;
  final Function() loadDataFunction;

  const widgetBilanSeance({super.key,  this.bilanSeance, required this.loadDataFunction});

  @override
  State<widgetBilanSeance> createState() => _widgetState();
}

class _widgetState extends State<widgetBilanSeance> {
  @override
  Widget build(BuildContext context) {
    final BilanSeanceController bilanSeanceController = BilanSeanceController();
    bilanSeanceController.apiResponse.value = ApiResponse.completed();

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
                    '${widget.bilanSeance!.id} ',
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
                      builder: (context) => bilanSeanceScreen(bilanSeance: widget.bilanSeance),
                    ),
                  )
                      .whenComplete(widget.loadDataFunction),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: AppColors.dangerColor),
                  onPressed: () => ApiViewHandler.withAlert(
                    context: context,
                    apiCall: bilanSeanceController.delete(widget.bilanSeance!.id),
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
