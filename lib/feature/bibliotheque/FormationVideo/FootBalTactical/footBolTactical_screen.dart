import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../controller/librey/FootbalTactical_controller.dart';
import '../../../../l10n/localization.dart';
import '../../../../utils/resources/api/api_view_handler.dart';
import 'footballTacticalItem.dart';

class FootballTactical_screen extends StatefulWidget {
  const FootballTactical_screen({super.key});

  @override
  State<FootballTactical_screen> createState() =>
      _FootballTactical_screenState();
}

class _FootballTactical_screenState extends State<FootballTactical_screen> {
  FoottballTacticalController foottballTacticalController =
      FoottballTacticalController();

  Future<void> loadData() async {
    final result = await foottballTacticalController.getAll();
    print(
        foottballTacticalController.apiResponse.value.item); // Print the result

    final data = foottballTacticalController.apiResponse.value.itemList;
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
      appBar: AppBar(
        title: Text(intl.formationVideosTitle2),
      ),
      body: Obx(() => ApiViewHandler.modelListBuilder(
            context,
            apiResponse: foottballTacticalController.apiResponse,
            builder: (footTacticalList) => ListView.builder(
              itemCount: footTacticalList.length,
              itemBuilder: (context, index) => FootballTacticalCard(
                footballTactical: footTacticalList[index],
                loadDataFunction: loadData,
              ),
            ),
          )),
    );
  }
}
