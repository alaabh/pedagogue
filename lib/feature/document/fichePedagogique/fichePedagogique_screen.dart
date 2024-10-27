import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/feature/document/fichePedagogique/widget_fiche_pedaguogue.dart';

import '../../../controller/fiche_pedagogue_controller.dart';
import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class fichePedagogique extends StatefulWidget {
  const fichePedagogique({super.key});

  @override
  State<fichePedagogique> createState() => _fichePedagogiqueState();
}

class _fichePedagogiqueState extends State<fichePedagogique> {
  final FichePedagogueController fichePedagogueController =
      FichePedagogueController();
  Future<void> loadData() async {
    final result = await fichePedagogueController.getAll();
    print(fichePedagogueController.apiResponse.value.item); // Print the result

    final data = fichePedagogueController.apiResponse.value.itemList;
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
      appBar: AppBar(title: Text(intl.fichePedagogique)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
                  context,
                  apiResponse: fichePedagogueController.apiResponse,
                  builder: (bilanDebutCycleList) => ListView.builder(
                    itemCount: bilanDebutCycleList.length,
                    itemBuilder: (context, index) => WidgetFichePedagogue(
                      fichePedagogue: bilanDebutCycleList[index],
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
