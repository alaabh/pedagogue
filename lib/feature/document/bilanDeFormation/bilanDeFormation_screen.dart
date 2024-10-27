import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pedagogue/feature/document/bilanDeFormation/widgeBilanFormation.dart';
import 'package:pedagogue/model/rapport_semestre1_model.dart';
import '../../../controller/rapportSemestre1_controller.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class bilanDeFormationScreen extends StatefulWidget {
  const bilanDeFormationScreen({super.key,  RapportSemestre1Model? rapportSemestreModel});

  @override
  State<bilanDeFormationScreen> createState() => _bilanDeFormationScreenState();
}

class _bilanDeFormationScreenState extends State<bilanDeFormationScreen> {
  RapportSmestre1Controller rapportSmestre1Controller =
  RapportSmestre1Controller();
  Future<void> loadData() async {
    final result = await rapportSmestre1Controller.getAll();
    print(rapportSmestre1Controller.apiResponse.value.item); // Print the result

    final data = rapportSmestre1Controller.apiResponse.value.itemList;
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
              apiResponse: rapportSmestre1Controller.apiResponse,
              builder: (bilanSeanceList) => ListView.builder(
                itemCount: bilanSeanceList.length,
                itemBuilder: (context, index) => widgetBilanFormation(
                  rapportSemestreModel: bilanSeanceList[index],
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
