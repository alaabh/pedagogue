import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/controller/evaluation_by_position_controller/middle_controller.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../../utils/resources/api/api_view_handler.dart';
import 'widget_evalution_middle.dart';

class Middle extends StatefulWidget {
  const Middle({super.key});

  @override
  State<Middle> createState() => _MiddleState();
}

class _MiddleState extends State<Middle> {
  final MiddleController middleController = MiddleController();
  Future<void> loadData() async {
    final result = await middleController.getAll();
    print(middleController.apiResponse.value.item); // Print the result

    final data = middleController.apiResponse.value.itemList;
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
      appBar: AppBar(title: Text(intl.middle)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
              context,
              apiResponse: middleController.apiResponse,
              builder: (middleList) => ListView.builder(
                itemCount: middleList.length,
                itemBuilder: (context, index) => WidgetMiddle(
                  middleModel: middleList[index],
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