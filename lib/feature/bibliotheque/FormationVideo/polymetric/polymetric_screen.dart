import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pedagogue/feature/bibliotheque/FormationVideo/polymetric/polymetricItem.dart';
import '../../../../controller/librey/pollymetric_controller.dart';
import '../../../../l10n/localization.dart';
import '../../../../utils/resources/api/api_view_handler.dart';

class polymetric_screen extends StatefulWidget {


  const polymetric_screen({super.key});

  @override
  State<polymetric_screen> createState() => _polymetric_screenState();
}

class _polymetric_screenState extends State<polymetric_screen> {
  polymetricController PolymetricController = polymetricController ();



  Future<void> loadData() async {
    final result = await PolymetricController.getAll();
    print(PolymetricController.apiResponse.value.item); // Print the result

    final data = PolymetricController.apiResponse.value.itemList;
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
        title: Text(intl.formationVideosTitle11),
      ),
      body: Obx(() => ApiViewHandler.modelListBuilder(
        context,
        apiResponse: PolymetricController.apiResponse,
        builder: (polymetricList) => ListView.builder(
          itemCount: polymetricList.length,
          itemBuilder: (context, index) => PolyticCard(
            plyometric: polymetricList[index],
            loadDataFunction: loadData,
          ),
        ),
      )),
    );
  }

}

