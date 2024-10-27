import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../controller/librey/coatching18_controller.dart';
import '../../../../l10n/localization.dart';
import '../../../../utils/resources/api/api_view_handler.dart';
import 'coatching18Item.dart';

class coatching18_screen extends StatefulWidget {


  const coatching18_screen({super.key});

  @override
  State<coatching18_screen> createState() => coatching18_screenState();
}

class coatching18_screenState extends State<coatching18_screen> {
  coatching18Controller Coatching18Controller = coatching18Controller ();



  Future<void> loadData() async {
    final result = await Coatching18Controller.getAll();
    print(Coatching18Controller.apiResponse.value.item); // Print the result

    final data = Coatching18Controller.apiResponse.value.itemList;
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
        title: Text(intl.formationVideosTitle10),
      ),
      body: Obx(() => ApiViewHandler.modelListBuilder(
        context,
        apiResponse: Coatching18Controller.apiResponse,
        builder: (technical12List) => ListView.builder(
          itemCount: technical12List.length,
          itemBuilder: (context, index) => Coatching18Card(
            coaching18: technical12List[index],
            loadDataFunction: loadData,
          ),
        ),
      )),
    );
  }

}

