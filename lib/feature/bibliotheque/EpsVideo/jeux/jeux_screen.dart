import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../controller/librey/jeuxEps_controller.dart';
import '../../../../l10n/localization.dart';
import '../../../../utils/resources/api/api_view_handler.dart';
import 'jeux_item.dart';

class JeuxEps_screen extends StatefulWidget {


  const JeuxEps_screen({super.key});

  @override
  State<JeuxEps_screen> createState() => JeuxEps_screenState();
}

class JeuxEps_screenState extends State<JeuxEps_screen> {
  JeuxController jeuxController = JeuxController ();



  Future<void> loadData() async {
    final result = await jeuxController.getAll();
    print(jeuxController.apiResponse.value.item); // Print the result

    final data = jeuxController.apiResponse.value.itemList;
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
        title: Text(intl.epsVideosTitle3),
      ),
      body: Obx(() => ApiViewHandler.modelListBuilder(
        context,
        apiResponse: jeuxController.apiResponse,
        builder: (technical12List) => ListView.builder(
          itemCount: technical12List.length,
          itemBuilder: (context, index) => JeuxCard(
            jeux: technical12List[index],
            loadDataFunction: loadData,
          ),
        ),
      )),
    );
  }

}

