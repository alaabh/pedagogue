import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/feature/document/BilanFinCycle/WidgetFinCycle.dart';
import '../../../controller/bilan_fin_decycle_controller.dart';
import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class BilanFinCycle extends StatefulWidget {
  const BilanFinCycle({super.key});

  @override
  State<BilanFinCycle> createState() => _BilanFinCycleState();
}

class _BilanFinCycleState extends State<BilanFinCycle> {
  final BilanFinCycleController bilanFinCycleController =
      BilanFinCycleController();
  Future<void> loadData() async {
    final result = await bilanFinCycleController.getAll();
    print(bilanFinCycleController.apiResponse.value.item); // Print the result

    final data = bilanFinCycleController.apiResponse.value.itemList;
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
      appBar: AppBar(title: Text(intl.listedesbilansdufindecycle)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
                  context,
                  apiResponse: bilanFinCycleController.apiResponse,
                  builder: (bilanFinCycleList) => ListView.builder(
                    itemCount: bilanFinCycleList.length,
                    itemBuilder: (context, index) => WidgetFinCycle(
                      bilanFinCycle: bilanFinCycleList[index],
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
