import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/feature/Coatching/Training/createTrainig.dart';
import 'package:pedagogue/feature/Coatching/Training/training_widget.dart';

import '../../../controller/coaching1_controller.dart';
import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class TrainingList extends StatefulWidget {
  const TrainingList({super.key});

  @override
  State<TrainingList> createState() => _TrainingListState();
}

class _TrainingListState extends State<TrainingList> {
  final Coaching1Controller coachingController = Coaching1Controller();

  Future<void> loadData() async {
    final result = await coachingController.getAll();
    print(coachingController.apiResponse.value.item); // Print the result

    final data = coachingController.apiResponse.value.itemList;
    print('Data: ${data[0]}');

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
      appBar: AppBar(title: Text(intl.coachingTraining)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
                  context,
                  apiResponse: coachingController.apiResponse,
                  builder: (coachingList) => ListView.builder(
                    itemCount: coachingList.length,
                    itemBuilder: (context, index) => TrainingWidget(
                      coaching: coachingList[index],
                      loadDataFunction: loadData,
                    ),
                  ),
                )),
          ),
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CreateTraing()),
                  ),
              child: Text('${intl.createExercice}')),
          /*  TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreateTraing()),
            ),
            child: Text('Create Exercice'),
          ), */
        ],
      ),
    );
  }
}
