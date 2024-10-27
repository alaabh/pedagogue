import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../controller/joueurSuspended_controller.dart';
import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'createsusponduJoueur.dart';
import 'joueurSuspondu_widget.dart';

class ListeJoueurSuspondu extends StatefulWidget {
  const ListeJoueurSuspondu({super.key});

  @override
  State<ListeJoueurSuspondu> createState() => _ListeJoueurSusponduState();
}

class _ListeJoueurSusponduState extends State<ListeJoueurSuspondu> {
  final JoueurSuspendedController joueurSuspendedController =
      JoueurSuspendedController();

  Future<void> loadData() async {
    final result = await joueurSuspendedController.getAll();
    print(joueurSuspendedController.apiResponse.value.item); // Print the result

    final data = joueurSuspendedController.apiResponse.value.itemList;
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
      appBar: AppBar(title: Text(intl.suspendedPlayers)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
                  context,
                  apiResponse: joueurSuspendedController.apiResponse,
                  builder: (joueurSusponduList) => ListView.builder(
                    itemCount: joueurSusponduList.length,
                    itemBuilder: (context, index) => PlayerSusponduWidget(
                      playerSuspended: joueurSusponduList[index],
                      loadDataFunction: loadData,
                    ),
                  ),
                )),
          ),
             ElevatedButton(
         onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreatesusponduJoueur()),
            ),
              child: Text('${intl.createPlayer}')),
         /*  TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreatesusponduJoueur()),
            ),
            child: Text('Create Joueur'),
          ), */
        ],
      ),
    );
  }
}
