import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../controller/joueurPresence_controller.dart';
import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'createPresencePlyer.dart';
import 'joueurPresence_widgeet.dart';

class ListePresenceJoueurs extends StatefulWidget {
  const ListePresenceJoueurs({super.key});

  @override
  State<ListePresenceJoueurs> createState() => _ListePresenceJoueursState();
}

class _ListePresenceJoueursState extends State<ListePresenceJoueurs> {
  final JoueurPresenceController joueurPresenceController =
      JoueurPresenceController();

  Future<void> loadData() async {
    final result = await joueurPresenceController.getAll();
    print(joueurPresenceController.apiResponse.value.item); // Print the result

    final data = joueurPresenceController.apiResponse.value.itemList;
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
      appBar: AppBar(title: Text(intl.playersAttendance)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(() => ApiViewHandler.modelListBuilder(
                    context,
                    apiResponse: joueurPresenceController.apiResponse,
                    builder: (joueurPresentList) => ListView.builder(
                      itemCount: joueurPresentList.length,
                      itemBuilder: (context, index) => PlayerPresenceWidget(
                        joueurPresence: joueurPresentList[index],
                        loadDataFunction: loadData,
                      ),
                    ),
                  )),
            ),
            ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => createPresencePlyer()),
                    ),
                child: Text('${intl.createPlayer}')),
            /* TextButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => createPresencePlyer()),
              ),
              child: Text('Create Joueur'),
            ), */
          ],
        ),
      ),
    );
  }
}
