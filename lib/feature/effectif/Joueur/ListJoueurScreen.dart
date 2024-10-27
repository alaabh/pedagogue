import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/utils/resources/api/api_view_handler.dart';

import '../../../controller/joueur_controller.dart';
import '../../../l10n/localization.dart';
import 'Joueur_widget.dart';
import 'createJoueurScreen.dart'; // Import the CreateJoueur interface

class JoueurListView extends StatefulWidget {
  const JoueurListView({Key? key}) : super(key: key);

  @override
  State<JoueurListView> createState() => _JoueurListViewState();
}

class _JoueurListViewState extends State<JoueurListView> {
  final JoueurController joueurController = JoueurController();

  Future<void> loadData() async {
    final result = await joueurController.getAll();
    print(joueurController.apiResponse.value.item); // Print the result

    final data = joueurController.apiResponse.value.itemList;
    print('Data: $data'); // Print the data

    setState(() {}); // Trigger a rebuild after data is fetched
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  TextEditingController weightController = TextEditingController();
  TextEditingController tailleController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController dateNaissanceController = TextEditingController();
  TextEditingController LieuNaissanceController = TextEditingController();
  TextEditingController postController = TextEditingController();
  TextEditingController mutationController = TextEditingController();
  TextEditingController umeroMailltController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController numeroMailltController = TextEditingController();
  TextEditingController rightFootController = TextEditingController();
  TextEditingController selectedBirthDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.players)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ApiViewHandler.modelListBuilder(
                  context,
                  apiResponse: joueurController.apiResponse,
                  builder: (joueurList) => ListView.builder(
                    itemCount: joueurList.length,
                    itemBuilder: (context, index) => PlayerWidget(
                      player: joueurList[index],
                      loadDataFunction: loadData,
                    ),
                  ),
                )),
          ),
          ElevatedButton(
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreateJoueur()),
            ),
              child: Text('${intl.createPlayer}')),
         /*  TextButton(
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
