import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pedagogue/feature/bibliotheque/EpsVideo/warmingUp/warmingupItem.dart';
import '../../../../controller/librey/warningup_controller.dart';
import '../../../../l10n/localization.dart';
import '../../../../utils/resources/api/api_view_handler.dart';

class WarmingUpscreen extends StatefulWidget {


  const WarmingUpscreen({super.key});

  @override
  State<WarmingUpscreen> createState() => WarmingUpscreenState();
}

class WarmingUpscreenState extends State<WarmingUpscreen> {
  WarmingUpController warmingUpController = WarmingUpController ();



  Future<void> loadData() async {
    final result = await warmingUpController.getAll();
    print(warmingUpController.apiResponse.value.item); // Print the result

    final data = warmingUpController.apiResponse.value.itemList;
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
        title: Text(intl.epsVideosTitle1),
      ),
      body: Obx(() => ApiViewHandler.modelListBuilder(
        context,
        apiResponse: warmingUpController.apiResponse,
        builder: (technical12List) => ListView.builder(
          itemCount: technical12List.length,
          itemBuilder: (context, index) => WrmingUpCard(
            warmingUp: technical12List[index],
            loadDataFunction: loadData,
          ),
        ),
      )),
    );
  }

}

