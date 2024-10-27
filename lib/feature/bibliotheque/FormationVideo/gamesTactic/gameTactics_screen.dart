import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../controller/librey/gamesTactics_controller.dart';
import '../../../../l10n/localization.dart';
import '../../../../utils/resources/api/api_view_handler.dart';
import 'gameTacticsItems.dart';

class TacticalGame_screen extends StatefulWidget {


  const  TacticalGame_screen({super.key});

  @override
  State< TacticalGame_screen> createState() => _TacticalGame_screenState();
}

class _TacticalGame_screenState extends State< TacticalGame_screen> {
  GameTacticsController gameTacticsController = GameTacticsController ();



  Future<void> loadData() async {
    final result = await gameTacticsController.getAll();
    print(gameTacticsController.apiResponse.value.item); // Print the result

    final data = gameTacticsController.apiResponse.value.itemList;
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
        title: Text(intl.formationVideosTitle6),
      ),
      body: Obx(() => ApiViewHandler.modelListBuilder(
        context,
        apiResponse: gameTacticsController.apiResponse,
        builder: (tacticalgameList) => ListView.builder(
          itemCount: tacticalgameList.length,
          itemBuilder: (context, index) => TacticalGameCard(
            gameTactics: tacticalgameList[index],
            loadDataFunction: loadData,
          ),
        ),
      )),
    );
  }

}

