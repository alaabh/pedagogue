
import 'package:flutter/material.dart';
import 'package:pedagogue/feature/evaluationByPosition/goalKeeper/goalKeeper_view.dart';
import 'package:pedagogue/model/evaluation_by_program_model/GoalKeeper_model.dart';

import '../../../controller/evaluation_by_position_controller/goalKeeper_controller.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/api_response.dart';
import '../../../utils/resources/api/api_view_handler.dart';
class WidgetGoalKeeper extends StatefulWidget {
   final GoalKeeperModel goalKeeperModel;
  final Function() loadDataFunction;
  const WidgetGoalKeeper({super.key, required this.goalKeeperModel, required this.loadDataFunction});

  @override
  State<WidgetGoalKeeper> createState() => _WidgetGoalKeeperState();
}

class _WidgetGoalKeeperState extends State<WidgetGoalKeeper> {
  @override
  Widget build(BuildContext context) {
   // API
   final GoalKeeperController goalKeeperController = GoalKeeperController();
    goalKeeperController.apiResponse.value = ApiResponse.completed();

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
                    '${widget.goalKeeperModel!.id} ',
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
                          builder: (context) => GoalKeeperView(goalKeeperModel: widget.goalKeeperModel),
                        ),
                      )
                      .whenComplete(widget.loadDataFunction),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: AppColors.dangerColor),
                  onPressed: () => ApiViewHandler.withAlert(
                    context: context,
                    apiCall: goalKeeperController.delete(widget.goalKeeperModel.id),
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
