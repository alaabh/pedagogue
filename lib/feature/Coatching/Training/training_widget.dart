import 'package:flutter/material.dart';
import 'package:pedagogue/controller/coaching_controller.dart';
import 'package:pedagogue/feature/Coatching/Training/createTrainig.dart';
import 'package:pedagogue/model/coachng1_model.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class TrainingWidget extends StatelessWidget {
  final Coaching1? coaching;
  final Function() loadDataFunction;
  const TrainingWidget(
      {super.key, this.coaching, required this.loadDataFunction});

  @override
  Widget build(BuildContext context) {
    final CoachingController coachingController = CoachingController();

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
                  Row(
                    children: [
                      Text("${intl.name} :"),
                      Dimensions.horizontalSpacingMedium,
                      Text(
                        '${coaching?.name ?? ''}',
                        style: Theme.of(context).textTheme.titleLarge!,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("${intl.rating} :"),
                      Dimensions.horizontalSpacingMedium,
                      Text('${coaching?.rating ?? ''}'),
                    ],
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
                          builder: (context) => CreateTraing(
                            coaching: coaching,
                          ),
                        ),
                      )
                      .whenComplete(loadDataFunction),
                ),
                if (coaching != null) // Check if coaching is not null
                  IconButton(
                    icon: Icon(Icons.delete, color: AppColors.dangerColor),
                    onPressed: () => ApiViewHandler.withAlert(
                      context: context,
                      apiCall: coachingController.delete(coaching!.id!),
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
