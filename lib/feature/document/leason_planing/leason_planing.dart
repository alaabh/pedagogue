import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/controller/planingLeasonService.dart';
import 'package:pedagogue/feature/document/leason_planing/widget_leason_planing.dart';

import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class LeasonPlaning extends StatefulWidget {
  const LeasonPlaning({super.key});

  @override
  State<LeasonPlaning> createState() => _LeasonPlaningState();
}

class _LeasonPlaningState extends State<LeasonPlaning> {
  final PlaningLeasonController planingLeasonController = PlaningLeasonController();
  Future<void> loadData() async {
    final result = await planingLeasonController.getAll();
    print(planingLeasonController.apiResponse.value.item); // Print the result

    final data = planingLeasonController.apiResponse.value.itemList;
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
      appBar: AppBar(title: Text(intl.planingALeason)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
              context,
              apiResponse: planingLeasonController.apiResponse,
              builder: (planingLeasonList) => ListView.builder(
                itemCount: planingLeasonList.length,
                itemBuilder: (context, index) => WidgetPlaningLeason(
                  planingLeasonModel: planingLeasonList[index],
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