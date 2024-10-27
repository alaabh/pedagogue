import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pedagogue/model/BilanSeance_model.dart';

import '../../../controller/bilanSeance_controlle.dart';
import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'bilanSeance_widgets.dart';

class bilanSeanceScreen extends StatefulWidget {
  const bilanSeanceScreen({super.key,
    BilanSeance? bilanSeance});

  @override
  State<bilanSeanceScreen> createState() => _bilanSeanceScreenState();
}

class _bilanSeanceScreenState extends State<bilanSeanceScreen> {

  final BilanSeanceController bilanSeanceController =
  BilanSeanceController();
  Future<void> loadData() async {
    final result = await bilanSeanceController.getAll();
    print(bilanSeanceController.apiResponse.value.item); // Print the result

    final data = bilanSeanceController.apiResponse.value.itemList;
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
      appBar: AppBar(title: Text(intl.ficheDeLaSeance)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
              context,
              apiResponse: bilanSeanceController.apiResponse,
              builder: (bilanSeanceList) => ListView.builder(
                itemCount: bilanSeanceList.length,
                itemBuilder: (context, index) => widgetBilanSeance(
                  bilanSeance: bilanSeanceList[index],
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
