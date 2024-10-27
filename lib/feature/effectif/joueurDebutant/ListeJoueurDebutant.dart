import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../controller/joueurStarting_controller.dart';
import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'JoueurDebutant_widget.dart';
import 'createStartingPlayer.dart';

class ListeJoueursDebutant extends StatefulWidget {
  const ListeJoueursDebutant({super.key});

  @override
  State<ListeJoueursDebutant> createState() => _ListeJoueursDebutantState();
}

class _ListeJoueursDebutantState extends State<ListeJoueursDebutant> {
  final JoueurStartingController joueurStartingController =
      JoueurStartingController();

  Future<void> loadData() async {
    final result = await joueurStartingController.getAll();
    print(joueurStartingController.apiResponse.value.item); // Print the result

    final data = joueurStartingController.apiResponse.value.itemList;
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
      appBar: AppBar(title: Text(intl.startingPlayers)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
                  context,
                  apiResponse: joueurStartingController.apiResponse,
                  builder: (joueurStartingList) => ListView.builder(
                    itemCount: joueurStartingList.length,
                    itemBuilder: (context, index) => PlayerDebutantWidget(
                      playerStarting: joueurStartingList[index],
                      loadDataFunction: loadData,
                    ),
                  ),
                )),
          ),
            ElevatedButton(
         onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreatingStartingPlayer()),
            ),
              child: Text('${intl.createPlayer}')),
         /*  TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreatingStartingPlayer()),
            ),
            child: Text('Create Joueur'),
          ), */
        ],
      ),
    );
  }
}
