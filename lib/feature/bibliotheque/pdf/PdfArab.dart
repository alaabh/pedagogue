import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/controller/pdfArab_controller.dart';

import '../../../l10n/localization.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'ArabItem.dart';

class PdfArabScreen extends StatefulWidget {
  const PdfArabScreen({super.key});

  @override
  State<PdfArabScreen> createState() => _PdfArabScreenState();
}

class _PdfArabScreenState extends State<PdfArabScreen> {
  final PdfArabController pdfArabController = PdfArabController();

  Future<void> loadData() async {
    final result = await pdfArabController.getAll();
    print(pdfArabController.apiResponse.value.item); // Print the result

    final data = pdfArabController.apiResponse.value.itemList;
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
            apiResponse: pdfArabController.apiResponse,
            builder: (pdfWordList) => ListView.builder(
              itemCount: pdfWordList.length,
              itemBuilder: (context, index) => ArabItem(
                pdfArab: pdfWordList[index],
                loadDataFunction: loadData,
              ),
            ),
          )),
    );
  }
}
