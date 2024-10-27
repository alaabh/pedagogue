import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pedagogue/feature/document/planAnnuleStep2/widgtStep2.dart';

import '../../../controller/displineController/step2_controller.dart';
import '../../../model/displineModel/step2_model.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class planAnnulStep2 extends StatefulWidget {
  const planAnnulStep2({super.key, Step2Model? step2model,});

  @override
  State<planAnnulStep2> createState() => _planAnnulStep2State();
}

class _planAnnulStep2State extends State<planAnnulStep2> {
  final Step2Controller step2Controller =
  Step2Controller();
  Future<void> loadData() async {
    final result = await step2Controller.getAll();
    print(step2Controller.apiResponse.value.item); // Print the result

    final data = step2Controller.apiResponse.value.itemList;
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
              apiResponse: step2Controller.apiResponse,
              builder: (step2List) => ListView.builder(
                itemCount: step2List.length,
                itemBuilder: (context, index) => widgetStep2(
                  step2model: step2List[index],
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
