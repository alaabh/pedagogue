import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../controller/librey/notation_controller.dart';
import '../../../../l10n/localization.dart';
import '../../../../utils/resources/api/api_view_handler.dart';
import 'natationItem.dart';

class Natationscreen extends StatefulWidget {
  const Natationscreen({super.key});

  @override
  State<Natationscreen> createState() => NatationscreenState();
}

class NatationscreenState extends State<Natationscreen> {
  NotationController notationController = NotationController();

  Future<void> loadData() async {
    final result = await notationController.getAll();
    print(notationController.apiResponse.value.item); // Print the result

    final data = notationController.apiResponse.value.itemList;
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
        title: Text(intl.epsVideosTitle5),
      ),
      body: Obx(() => ApiViewHandler.modelListBuilder(
            context,
            apiResponse: notationController.apiResponse,
            builder: (technical12List) => ListView.builder(
              itemCount: technical12List.length,
              itemBuilder: (context, index) => NatationCard(
                natation: technical12List[index],
                loadDataFunction: loadData,
              ),
            ),
          )),
    );
  }
}
