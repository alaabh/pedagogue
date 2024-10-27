import 'package:flutter/material.dart';
import 'package:pedagogue/controller/emploi_controller.dart';
import 'package:pedagogue/model/emploi.dart';
import 'package:pedagogue/shared/style/dimensions.dart';
import '../../../shared/style/app_color.dart';
import '../../../utils/resources/api/api_response.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import '../../espqceEPS/Horaire/horaire_screen.dart';

class emploiWidget extends StatelessWidget {
  final Emploi emploi;
  final Function() loadDataFunction;

  const emploiWidget({
    Key? key, // Corrected syntax for key
    required this.loadDataFunction,
     required this.emploi,
  }) : super(key: key); // Corrected syntax for key

  @override
  Widget build(BuildContext context) {
    // API
    final EmploiController emploiController = EmploiController();
    emploiController.apiResponse.value = ApiResponse.completed();

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
                    '${emploi!.id} ',
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
                          builder: (context) => HoraireScreen(emploi: emploi),
                        ),
                      )
                      .whenComplete(loadDataFunction),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: AppColors.dangerColor),
                  onPressed: () => ApiViewHandler.withAlert(
                    context: context,
                    apiCall: emploiController.delete(emploi!.id!),
                    successFunction: loadDataFunction,
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
