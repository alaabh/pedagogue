import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pedagogue/controller/librey/technical1215_controller.dart';
import 'package:pedagogue/feature/bibliotheque/FormationVideo/technical1215/technical1215item.dart';
import '../../../../l10n/localization.dart';
import '../../../../utils/resources/api/api_view_handler.dart';

class technoical1215_screen extends StatefulWidget {


  const technoical1215_screen({super.key});

  @override
  State<technoical1215_screen> createState() => _ScoreOffSide_screenState();
}

class _ScoreOffSide_screenState extends State<technoical1215_screen> {
  Technical1215Controller technical1215Controller = Technical1215Controller ();



  Future<void> loadData() async {
    final result = await technical1215Controller.getAll();
    print(technical1215Controller.apiResponse.value.item); // Print the result

    final data = technical1215Controller.apiResponse.value.itemList;
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
        title: Text(intl.formationVideosTitle9),
      ),
      body: Obx(() => ApiViewHandler.modelListBuilder(
        context,
        apiResponse: technical1215Controller.apiResponse,
        builder: (technical12List) => ListView.builder(
          itemCount: technical12List.length,
          itemBuilder: (context, index) => Technical1215Card(
            technical1215: technical12List[index],
            loadDataFunction: loadData,
          ),
        ),
      )),
    );
  }

}

