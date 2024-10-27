import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/controller/evaluation_by_position_controller/deffense_controller.dart';
import 'package:pedagogue/feature/document/evaluation_deffense/widget_deffense.dart';

import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class Deffense extends StatefulWidget {
  const Deffense({super.key});

  @override
  State<Deffense> createState() => _DeffenseState();
}

class _DeffenseState extends State<Deffense> {
  final DeffenseController deffenseController = DeffenseController();
  Future<void> loadData() async {
    final result = await deffenseController.getAll();
    print(deffenseController.apiResponse.value.item); // Print the result

    final data = deffenseController.apiResponse.value.itemList;
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
      appBar: AppBar(title: Text(intl.defender)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
              context,
              apiResponse: deffenseController.apiResponse,
              builder: (deffenseList) => ListView.builder(
                itemCount: deffenseList.length,
                itemBuilder: (context, index) => WidgetDeffense(
                  deffenseModel: deffenseList[index],
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