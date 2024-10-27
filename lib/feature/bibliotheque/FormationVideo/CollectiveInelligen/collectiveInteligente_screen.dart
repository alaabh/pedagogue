import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../controller/librey/collectiveintelligence_controller.dart';
import '../../../../l10n/localization.dart';
import '../../../../utils/resources/api/api_view_handler.dart';
import 'collectiveInteligenteItem.dart';

class collectiveIntelligente_screen extends StatefulWidget {


  const collectiveIntelligente_screen({super.key});

  @override
  State<collectiveIntelligente_screen> createState() => _collectiveIntelligente_screenState();
}

class _collectiveIntelligente_screenState extends State<collectiveIntelligente_screen> {
  CollectiveIntelligenceController collectiveIntelligenceController = CollectiveIntelligenceController ();



  Future<void> loadData() async {
    final result = await collectiveIntelligenceController.getAll();
    print(collectiveIntelligenceController.apiResponse.value.item); // Print the result

    final data = collectiveIntelligenceController.apiResponse.value.itemList;
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
        title: Text(intl.formationVideosTitle3),
      ),
      body: Obx(() => ApiViewHandler.modelListBuilder(
        context,
        apiResponse: collectiveIntelligenceController.apiResponse,
        builder: (footExerciceList) => ListView.builder(
          itemCount: footExerciceList.length,
          itemBuilder: (context, index) => collectiveIntelligenceCard(
            collectiveIntelligence: footExerciceList[index],
            loadDataFunction: loadData,
          ),
        ),
      )),
    );
  }

}

