import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pedagogue/feature/document/planAnnulsStep1/widgetStep1.dart';
import 'package:pedagogue/model/displineModel/step1_model.dart';

import '../../../controller/displineController/step1_controller.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class planAnnulStep1 extends StatefulWidget {
  const planAnnulStep1({super.key, Step1Model? step1model, });

  @override
  State<planAnnulStep1> createState() => _planAnnulStep1State();
}

class _planAnnulStep1State extends State<planAnnulStep1> {
  final Step1Controller step1Controller =
  Step1Controller();
  Future<void> loadData() async {
    final result = await step1Controller.getAll();
    print(step1Controller.apiResponse.value.item); // Print the result

    final data = step1Controller.apiResponse.value.itemList;
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
      appBar: AppBar(title: Text('')),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
              context,
              apiResponse: step1Controller.apiResponse,
              builder: (step1List) => ListView.builder(
                itemCount: step1List.length,
                itemBuilder: (context, index) => widgetStep1(
                  step1model: step1List[index],
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
