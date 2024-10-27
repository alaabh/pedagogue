import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../controller/librey/gymEps_controller.dart';
import '../../../../l10n/localization.dart';
import '../../../../utils/resources/api/api_view_handler.dart';
import 'GymItem.dart';

class gymEps_screen extends StatefulWidget {


  const gymEps_screen({super.key});

  @override
  State<gymEps_screen> createState() => coatching18_screenState();
}

class coatching18_screenState extends State<gymEps_screen> {
  GymEpsController gymEpsController = GymEpsController ();



  Future<void> loadData() async {
    final result = await gymEpsController.getAll();
    print(gymEpsController.apiResponse.value.item); // Print the result

    final data = gymEpsController.apiResponse.value.itemList;
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
        title: Text(intl.epsVideosTitle2),
      ),
      body: Obx(() => ApiViewHandler.modelListBuilder(
        context,
        apiResponse: gymEpsController.apiResponse,
        builder: (technical12List) => ListView.builder(
          itemCount: technical12List.length,
          itemBuilder: (context, index) => GymEpsCard(
            gymEps: technical12List[index],
            loadDataFunction: loadData,
          ),
        ),
      )),
    );
  }

}

