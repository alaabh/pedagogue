import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../controller/BibliothequeExercice_controller.dart';
import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'bibliothequeExercice_item.dart';

class ListExerciceLibrery extends StatefulWidget {

  const ListExerciceLibrery({
    Key? key,
  }) : super(key: key);

  @override
  State<ListExerciceLibrery> createState() => _ListExerciceLibreryState();
}

class _ListExerciceLibreryState extends State<ListExerciceLibrery> {
  final BibliothequeExerciceController bibliothequeExerciceController = BibliothequeExerciceController();

  @override
  void initState() {
    super.initState();
    print(bibliothequeExerciceController);
    loadData();
  }

  Future<void> loadData() async {
    final result = await bibliothequeExerciceController.getAll();
    print(bibliothequeExerciceController.apiResponse.value.itemList);

    final data = bibliothequeExerciceController.apiResponse.value.itemList;
    print('Data: $data'); // Print the data

    if (data != null && data.isNotEmpty) { // Check if the data is not null and not empty
      setState(() {}); // Trigger a rebuild with the fetched data
    } else {
      print('No data available');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.coachingExercicesLib)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
              context,
              apiResponse: bibliothequeExerciceController.apiResponse,
              builder: (exerciceLibreryList) =>
                  ListView.builder(
                    itemCount: exerciceLibreryList.length,
                    itemBuilder: (context, index) => bibliothequeExerciceWidgett(
                      bibliothequeExercicee: exerciceLibreryList[index],
                      loadDataFunction: loadData,
                    ),
                  ),
            )),
          ),
        ],
      ),
    );
  }
}
