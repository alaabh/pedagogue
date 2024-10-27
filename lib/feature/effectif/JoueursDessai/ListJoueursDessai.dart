import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pedagogue/feature/effectif/JoueursDessai/CreateJoueurDessai.dart';

import '../../../controller/JoueurDessai_controller.dart';
import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import '../Joueur/createJoueurScreen.dart';
import 'joueurDessai_widget.dart';

class ListJoueursDessai extends StatefulWidget {
  const ListJoueursDessai({super.key});

  @override
  State<ListJoueursDessai> createState() => _ListJoueursDessaiState();
}

class _ListJoueursDessaiState extends State<ListJoueursDessai> {
  final JoueurDessaiController joueurDessaiController = JoueurDessaiController();

  Future<void> loadData() async {
    final result = await joueurDessaiController.getAll();
    print(joueurDessaiController.apiResponse.value.item); // Print the result

    final data = joueurDessaiController.apiResponse.value.itemList;
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
      appBar: AppBar(title: Text(intl.trialPlayers)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
                  context,
                  apiResponse: joueurDessaiController.apiResponse,
                  builder: (joueurDessaiList) => ListView.builder(
                    itemCount: joueurDessaiList.length,
                    itemBuilder: (context, index) => PlayerDessaiWidget(
                      joueurDessai: joueurDessaiList[index],
                      loadDataFunction: loadData,
                    ),
                  ),
                )),
          ),
           ElevatedButton(
         onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => createJoueurDessai()),
            ),
              child: Text('${intl.createPlayer}')),
          /* TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreateJoueur()),
            ),
            child: Text('Create Joueur'),
          ), */
        ],
      ),
    );
  }
}
