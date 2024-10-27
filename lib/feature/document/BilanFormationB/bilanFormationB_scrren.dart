import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pedagogue/feature/document/BilanFormationB/widgetBilanFormaionB.dart';
import 'package:pedagogue/model/rapport_semestre2_model.dart';

import '../../../controller/reportSemestre2_model.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class bilanFormationBScreen extends StatefulWidget {
  const bilanFormationBScreen({super.key, RapportSemestre2Model? rapportSemestre2Model});

  @override
  State<bilanFormationBScreen> createState() => _bilanFormationBScreenState();
}

class _bilanFormationBScreenState extends State<bilanFormationBScreen> {
  RapportSmestre2Controller rapportSmestre2Controller =
  RapportSmestre2Controller();
  Future<void> loadData() async {
    final result = await rapportSmestre2Controller.getAll();
    print(rapportSmestre2Controller.apiResponse.value.item); // Print the result

    final data = rapportSmestre2Controller.apiResponse.value.itemList;
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
              apiResponse: rapportSmestre2Controller.apiResponse,
              builder: (bilanSeanceList) => ListView.builder(
                itemCount: bilanSeanceList.length,
                itemBuilder: (context, index) => widgetBilanFormationB(
                  rapportSemestre2Model: bilanSeanceList[index],
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
