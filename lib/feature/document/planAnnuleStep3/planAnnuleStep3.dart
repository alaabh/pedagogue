import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pedagogue/feature/document/planAnnuleStep3/widgetStep3.dart';
import 'package:pedagogue/model/displineModel/step1_model.dart';
import 'package:pedagogue/model/displineModel/step3_model.dart';

import '../../../controller/displineController/step3_controller.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class planAnnulStep3 extends StatefulWidget {
  const planAnnulStep3({super.key, Step3Model? step3model,});

  @override
  State<planAnnulStep3> createState() => _planAnnulStep1State();
}

class _planAnnulStep1State extends State<planAnnulStep3> {

  final Step3Controller step3Controller =
  Step3Controller();
  Future<void> loadData() async {
    final result = await step3Controller.getAll();
    print(step3Controller.apiResponse.value.item); // Print the result

    final data = step3Controller.apiResponse.value.itemList;
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
              apiResponse: step3Controller.apiResponse,
              builder: (step2List) => ListView.builder(
                itemCount: step2List.length,
                itemBuilder: (context, index) => widgetStep3(
                  step3model: step2List[index],
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
