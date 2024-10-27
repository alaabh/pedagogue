import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../controller/librey/FootballExercice_controller.dart';
import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'footballExerciceItem.dart';

class FootballExercice_screen extends StatefulWidget {


  const FootballExercice_screen({super.key});

  @override
  State<FootballExercice_screen> createState() => _FootballExercice_screenState();
}

class _FootballExercice_screenState extends State<FootballExercice_screen> {
  FottballExerciceController fottballExerciceController = FottballExerciceController ();



  Future<void> loadData() async {
    final result = await fottballExerciceController.getAll();
    print(fottballExerciceController.apiResponse.value.item); // Print the result

    final data = fottballExerciceController.apiResponse.value.itemList;
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
        title: Text(intl.formationVideosTitle1),
      ),
      body: Obx(() => ApiViewHandler.modelListBuilder(
        context,
        apiResponse: fottballExerciceController.apiResponse,
        builder: (footExerciceList) => ListView.builder(
          itemCount: footExerciceList.length,
          itemBuilder: (context, index) => FootballExerciseCard(
            footballExercise: footExerciceList[index],
            loadDataFunction: loadData,
          ),
        ),
      )),
    );
  }

}

