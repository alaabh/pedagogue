import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/controller/bilanDebutCycle_controller.dart';

import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'widgetFicheBilanDebut.dart';

class FicheBilanDebut extends StatefulWidget {

  @override
  State<FicheBilanDebut> createState() => _FicheBilanDebutState();
}

class _FicheBilanDebutState extends State<FicheBilanDebut> {
  final BilanDebutCycleController bilanDebutCycleController = BilanDebutCycleController();
  Future<void> loadData() async {
    final result = await bilanDebutCycleController.getAll();
    print(bilanDebutCycleController.apiResponse.value.item); // Print the result

    final data = bilanDebutCycleController.apiResponse.value.itemList;
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
      appBar: AppBar(title: Text(intl.listedesbilansdudebutdecycle)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
              context,
              apiResponse: bilanDebutCycleController.apiResponse,
              builder: (bilanDebutCycleList) => ListView.builder(
                itemCount: bilanDebutCycleList.length,
                itemBuilder: (context, index) => WidgetBilanDebut(
                  bilanDebutCycle: bilanDebutCycleList[index],
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
