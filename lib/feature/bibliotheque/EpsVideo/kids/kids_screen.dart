import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../controller/librey/Kids_controller.dart';
import '../../../../l10n/localization.dart';
import '../../../../utils/resources/api/api_view_handler.dart';
import 'kidsItem.dart';

class Kids_screen extends StatefulWidget {


  const Kids_screen({super.key});

  @override
  State<Kids_screen> createState() => Kids_screennState();
}

class Kids_screennState extends State<Kids_screen> {
  KidsController kidsController = KidsController ();



  Future<void> loadData() async {
    final result = await kidsController.getAll();
    print(kidsController.apiResponse.value.item); // Print the result

    final data = kidsController.apiResponse.value.itemList;
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
        title: Text(intl.epsVideosTitle4),
      ),
      body: Obx(() => ApiViewHandler.modelListBuilder(
        context,
        apiResponse: kidsController.apiResponse,
        builder: (technical12List) => ListView.builder(
          itemCount: technical12List.length,
          itemBuilder: (context, index) => kidsCard(
            kidsEps: technical12List[index],
            loadDataFunction: loadData,
          ),
        ),
      )),
    );
  }

}

