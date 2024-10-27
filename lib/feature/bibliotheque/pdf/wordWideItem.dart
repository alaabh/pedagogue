import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../../../model/PdfWordWide_model.dart';
import 'contenuPdfWordWide.dart'; // Ensure this import is correct
import 'package:pedagogue/shared/style/dimensions.dart'; // Ensure this import is correct

// Convert to StatefulWidget
class WordWideItem extends StatefulWidget {
  final PdfWorldWide pdfWorldWide;
  final Function() loadDataFunction;

  const WordWideItem({
    Key? key,
    required this.pdfWorldWide,
    required this.loadDataFunction,
  }) : super(key: key);

  @override
  State<WordWideItem> createState() => _WordWideItemState();
}

class _WordWideItemState extends State<WordWideItem> {

  // Add initState method
  @override
  void initState() {
    super.initState();
    // Your initialization code here
  }

  Future<String> downloadPdfFromUrl(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/downloaded.pdf');
    await file.writeAsBytes(response.bodyBytes);
    return file.path;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.mediumValue,
        horizontal: Dimensions.largeValue,
      ),
      child: Padding(
        padding: Dimensions.paddingLarge,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(widget.pdfWorldWide.name!), // Use widget to access PdfWorldWide
                  ),
                  IconButton(
                    icon: const Icon(Icons.download),
                    onPressed: () async {
                      String localPath = await downloadPdfFromUrl(widget.pdfWorldWide.pdf!);
                      // Use localPath for navigation to ensure you're opening the downloaded file
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => contenuPdfwordWide(pdfPath: localPath),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
