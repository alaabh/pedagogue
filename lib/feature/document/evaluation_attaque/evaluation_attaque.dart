import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/controller/evaluation_by_position_controller/attaque_controller.dart';

import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'widget_evaluation_attaque.dart';

class Attaque extends StatefulWidget {
  const Attaque({super.key});

  @override
  State<Attaque> createState() => _AttaqueState();
}

class _AttaqueState extends State<Attaque> {
  final AttaqueController attaqueController = AttaqueController();
  Future<void> loadData() async {
    final result = await attaqueController.getAll();
    print(attaqueController.apiResponse.value.item); // Print the result

    final data = attaqueController.apiResponse.value.itemList;
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
      appBar: AppBar(title: Text(intl.attacker)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
                  context,
                  apiResponse: attaqueController.apiResponse,
                  builder: (attaqueList) => ListView.builder(
                    itemCount: attaqueList.length,
                    itemBuilder: (context, index) => WidgetAttaque(
                      attaqueModel: attaqueList[index],
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
