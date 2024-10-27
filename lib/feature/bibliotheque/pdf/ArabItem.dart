import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../../../model/PdfArab_model.dart';
import '../../../shared/style/dimensions.dart';
import 'contenuPdfArab.dart';
import 'package:http/http.dart' as http;

class ArabItem extends StatefulWidget {
  final PdfArab pdfArab;
  final Function() loadDataFunction;

  const ArabItem({
    Key? key,
    required this.pdfArab,
    required this.loadDataFunction,
  }) : super(key: key);

  @override
  _ArabItemState createState() => _ArabItemState();
}

class _ArabItemState extends State<ArabItem> {

  Future<String> downloadPdfFromUrl(String url, String fileName) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/$fileName');
    await file.writeAsBytes(bytes);
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
              child: Text(widget.pdfArab.name!), // No need for null check if name is required
            ),
            IconButton(
              icon: Icon(Icons.download),
              onPressed: () async {
                if (widget.pdfArab.pdf != null) {
                  final String localPath = await downloadPdfFromUrl(widget.pdfArab.pdf!, "downloadedPdf.pdf");
                  // After download, use the local file path for viewing
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContenuPdfArab(pdfPath: localPath),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("PDF path not available")),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
