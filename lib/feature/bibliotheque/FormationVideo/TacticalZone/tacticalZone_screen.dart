import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pedagogue/feature/bibliotheque/FormationVideo/TacticalZone/tacticalZoneItem.dart';
import '../../../../controller/librey/tacticalZone_controller.dart';
import '../../../../l10n/localization.dart';
import '../../../../utils/resources/api/api_view_handler.dart';

class TacticalZone_screen extends StatefulWidget {


  const  TacticalZone_screen({super.key});

  @override
  State< TacticalZone_screen> createState() => _ScoreOffSide_screenState();
}

class _ScoreOffSide_screenState extends State< TacticalZone_screen> {
  TacticalZoneController tacticalZoneController = TacticalZoneController ();



  Future<void> loadData() async {
    await tacticalZoneController.getAll();
    print(tacticalZoneController.apiResponse.value.item); // Print the result

    final data = tacticalZoneController.apiResponse.value.itemList;
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
        title: Text(intl.formationVideosTitle5),
      ),
      body: Obx(() => ApiViewHandler.modelListBuilder(
        context,
        apiResponse: tacticalZoneController.apiResponse,
        builder: (tacticalZoneList) => ListView.builder(
          itemCount: tacticalZoneList.length,
          itemBuilder: (context, index) => TacticalZoneCard(
            tacticalZone: tacticalZoneList[index],
            loadDataFunction: loadData,
          ),
        ),
      )),
    );
  }

}

