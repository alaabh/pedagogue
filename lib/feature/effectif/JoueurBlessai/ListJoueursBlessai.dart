import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../controller/joueurInjured_controller.dart';
import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'JoureurInjured-widget.dart';
import 'createJoueurBlessaiScreen.dart';

class ListJoueurBlessai extends StatefulWidget {
  @override
  State<ListJoueurBlessai> createState() => _ListJoueurBlessaiState();
}

class _ListJoueurBlessaiState extends State<ListJoueurBlessai> {
  final JoueurInjuredController joueurInjuredController =
      JoueurInjuredController();

  Future<void> loadData() async {
    final result = await joueurInjuredController.getAll();
    print(joueurInjuredController.apiResponse.value.item); // Print the result

    final data = joueurInjuredController.apiResponse.value.itemList;
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
      appBar: AppBar(title: Text(intl.injuredPlayers)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
                  context,
             apiResponse: joueurInjuredController.apiResponse,
                  builder: (joueurinjuredList) => ListView.builder(
                    itemCount: joueurinjuredList.length,
                    itemBuilder: (context, index) => PlayerInjuredWidget(
                      playerInjured: joueurinjuredList[index],
                      loadDataFunction: loadData,
                    ),
                  ),
                )),
          ),
            ElevatedButton(
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreateJoueurBlessai()),
            ),
              child: Text('${intl.createPlayer}')),
         /*  TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreateJoueurBlessai()),
            ),
            child: Text('Create Joueur'),
          ), */
        ],
      ),
    );
  }
}
