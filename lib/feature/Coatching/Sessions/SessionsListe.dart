import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pedagogue/feature/Coatching/Sessions/sessions_wiget.dart';

import '../../../controller/sessions_controller.dart';
import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'createSession.dart';

class ListeSession extends StatefulWidget {
  const ListeSession({
    super.key,
  });

  @override
  State<ListeSession> createState() => _ListeSessionState();
}

class _ListeSessionState extends State<ListeSession> {
  final SessionsController sessionsController = SessionsController();

  Future<void> loadData() async {
    final result = await sessionsController.getAll();
    print(sessionsController.apiResponse.value.item); // Print the result

    final data = sessionsController.apiResponse.value.itemList;
    print('Data: ${data[0]}');

    setState(() {
      
    }); // Trigger a rebuild after data is fetched
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.coachingSessions)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
                  context,
                  apiResponse: sessionsController.apiResponse,
                  builder: (sessionList) => ListView.builder(
                    itemCount: sessionList.length,
                    itemBuilder: (context, index) => SessionsWidget(
                      sessions: sessionList[index],
                      loadDataFunction: loadData,
                    ),
                  ),
                )),
          ),
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CreatingSession()),
                  ),
              child: Text('${intl.createExercice}')),
          /*   TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreatingSession()),
            ),
            child: Text('Create Exercice'),
          ), */
        ],
      ),
    );
  }
}
