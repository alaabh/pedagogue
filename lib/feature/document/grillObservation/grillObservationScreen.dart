import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pedagogue/model/observation_model.dart';

import '../../../controller/observation_controller.dart';
import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'grillObservation_widget.dart';

class grillObservation_screen extends StatefulWidget {
  const grillObservation_screen({super.key, Observation? observation});

  @override
  State<grillObservation_screen> createState() => _grillObservation_screenState();
}



class _grillObservation_screenState extends State<grillObservation_screen> {

  ObservationController observationController = ObservationController();

  Future<void> loadData() async {
    final result = await observationController.getAll();
    print(observationController.apiResponse.value.item); // Print the result

    final data = observationController.apiResponse.value.itemList;
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
      appBar: AppBar(title: Text(intl.griDobservation)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
              context,
              apiResponse: observationController.apiResponse,
              builder: (bilanFinCycleList) => ListView.builder(
                itemCount: bilanFinCycleList.length,
                itemBuilder: (context, index) => widgetGrillDobservation(
                  observation: bilanFinCycleList[index],
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
