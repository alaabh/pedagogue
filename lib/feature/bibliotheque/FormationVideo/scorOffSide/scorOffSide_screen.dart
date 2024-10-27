import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pedagogue/feature/bibliotheque/FormationVideo/scorOffSide/scoreOfSideIteme.dart';
import '../../../../controller/librey/scorOfSide_controller.dart';
import '../../../../l10n/localization.dart';
import '../../../../utils/resources/api/api_view_handler.dart';

class ScoreOffSide_screen extends StatefulWidget {


  const ScoreOffSide_screen({super.key});

  @override
  State<ScoreOffSide_screen> createState() => _ScoreOffSide_screenState();
}

class _ScoreOffSide_screenState extends State<ScoreOffSide_screen> {
  ScoreOffSifdeController scoreOffSifdeController = ScoreOffSifdeController ();



  Future<void> loadData() async {
    final result = await scoreOffSifdeController.getAll();
    print(scoreOffSifdeController.apiResponse.value.item); // Print the result

    final data = scoreOffSifdeController.apiResponse.value.itemList;
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
        title: Text(intl.formationVideosTitle4),
      ),
      body: Obx(() => ApiViewHandler.modelListBuilder(
        context,
        apiResponse: scoreOffSifdeController.apiResponse,
        builder: (footExerciceList) => ListView.builder(
          itemCount: footExerciceList.length,
          itemBuilder: (context, index) => ScoreOfSideCard(
            soccerOffside: footExerciceList[index],
            loadDataFunction: loadData,
          ),
        ),
      )),
    );
  }

}

