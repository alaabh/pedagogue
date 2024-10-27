import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../controller/librey/muscleBuilding_controller.dart';
import '../../../../l10n/localization.dart';
import '../../../../utils/resources/api/api_view_handler.dart';
import 'muscleBuildingItem.dart';

class MuscleBuilding_screen extends StatefulWidget {


  const MuscleBuilding_screen({super.key});

  @override
  State<MuscleBuilding_screen> createState() => MuscleBuilding_screenState();
}

class MuscleBuilding_screenState extends State<MuscleBuilding_screen> {
  MuscleBuildingController muscleBuildingController = MuscleBuildingController ();



  Future<void> loadData() async {
    final result = await muscleBuildingController.getAll();
    print(muscleBuildingController.apiResponse.value.item); // Print the result

    final data = muscleBuildingController.apiResponse.value.itemList;
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
        title: Text(intl.formationVideosTitle8),
      ),
      body: Obx(() => ApiViewHandler.modelListBuilder(
        context,
        apiResponse: muscleBuildingController.apiResponse,
        builder: (footExerciceList) => ListView.builder(
          itemCount: footExerciceList.length,
          itemBuilder: (context, index) => MuscleBuildingCard(
            muscleBuilding: footExerciceList[index],
            loadDataFunction: loadData,
          ),
        ),
      )),
    );
  }

}

