import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../controller/Exercice_controller.dart';
import '../../../l10n/localization.dart';
import '../../../model/exercice_model.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'createExerciceScreen.dart';
import 'widget_exercice.dart';

class ListeExercice extends StatefulWidget {
  final Exercise? exercise;
  // final Function() loadDataFunction;

  const ListeExercice({
    super.key,
    this.exercise,
  });

  @override
  State<ListeExercice> createState() => _ListeExerciceState();
}

class _ListeExerciceState extends State<ListeExercice> {
  final exerciceController ExerciceController = exerciceController();

  Future<void> loadData() async {
    final result = await ExerciceController.getAll();
    print(ExerciceController.apiResponse.value.item); // Print the result

    final data = ExerciceController.apiResponse.value.itemList;
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
      appBar: AppBar(title: Text(intl.coachingExercices)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
                  context,
                  apiResponse: ExerciceController.apiResponse,
                  builder: (exerciceList) => ListView.builder(
                    itemCount: exerciceList.length,
                    itemBuilder: (context, index) => ExerciceWidget(
                      exercise: exerciceList[index],
                      loadDataFunction: loadData,
                    ),
                  ),
                )),
          ),
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => CreateExerciceScreen()),
                  ),
              child: Text('${intl.createExercice}')),

          /*   TextButton(
         
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreateExerciceScreen()),
            ),
            child: Text('Create Exercice'),
          ), */
        ],
      ),
    );
  }
}
