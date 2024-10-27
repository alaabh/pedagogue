import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/evaluation_by_position_controller/goalKeeper_controller.dart';
import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'widget_evaluation_goalkeeper.dart';
class GoalKeeper extends StatefulWidget {
  const GoalKeeper({super.key});

  @override
  State<GoalKeeper> createState() => _GoalKeeperState();
}

class _GoalKeeperState extends State<GoalKeeper> {
  final GoalKeeperController goalKeeperController = GoalKeeperController();
  Future<void> loadData() async {
    final result = await goalKeeperController.getAll();
    print(goalKeeperController.apiResponse.value.item); // Print the result

    final data = goalKeeperController.apiResponse.value.itemList;
    print('Data: $data'); // Print the data

    setState(() {}); // Trigger a rebuild after data is fetched
  }
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.goalkeeper)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
              context,
              apiResponse: goalKeeperController.apiResponse,
              builder: (goalKeeperList) => ListView.builder(
                itemCount: goalKeeperList.length,
                itemBuilder: (context, index) => WidgetGoalKeeper(
                  goalKeeperModel: goalKeeperList[index],
                  loadDataFunction: loadData,
                ),
              ),
            )),
          ),

        ],
      ),
    );
  }
}
