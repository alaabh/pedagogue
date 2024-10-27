import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../controller/PdfWordWide_controller.dart';
import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'wordWideItem.dart';

class pdfWordWide extends StatefulWidget {
  const pdfWordWide({super.key});

  @override
  State<pdfWordWide> createState() => _pdfWordWideAState();
}

class _pdfWordWideAState extends State<pdfWordWide> {
  final PdfWordWideController pdfWordWideController = PdfWordWideController();

  Future<void> loadData() async {
    final result = await pdfWordWideController.getAll();
    print(pdfWordWideController.apiResponse.value.item); // Print the result

    final data = pdfWordWideController.apiResponse.value.itemList;
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
        title: Text(intl.pdf),
      ),
      body: Obx(() => ApiViewHandler.modelListBuilder(
            context,
            apiResponse: pdfWordWideController.apiResponse,
            builder: (pdfWordList) => ListView.builder(
              itemCount: pdfWordList.length,
              itemBuilder: (context, index) => WordWideItem(
                pdfWorldWide: pdfWordList[index],
                loadDataFunction: loadData,
              ),
            ),
          )),
    );
  }
}
