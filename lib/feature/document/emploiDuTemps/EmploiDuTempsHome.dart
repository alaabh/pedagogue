import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../controller/emploi_controller.dart';
import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'emploiWidget.dart';

class FmploiDuTempsHome extends StatefulWidget {
  const FmploiDuTempsHome({super.key});

  @override
  State<FmploiDuTempsHome> createState() => _FmploiDuTempsHomeState();
}

class _FmploiDuTempsHomeState extends State<FmploiDuTempsHome> {
  final EmploiController emploiController = EmploiController();
  Future<void> loadData() async {
    final result = await emploiController.getAll();
    print(emploiController.apiResponse.value.item); // Print the result

    final data = emploiController.apiResponse.value.itemList;
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
      appBar: AppBar(title: Text(intl.emploiduTemps)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
              context,
              apiResponse: emploiController.apiResponse,
              builder: (emploiList) => ListView.builder(
                itemCount: emploiList.length,
                itemBuilder: (context, index) => emploiWidget(
                  emploi: emploiList[index],
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

