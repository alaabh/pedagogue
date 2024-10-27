import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ContenuPdfArab extends StatefulWidget {
  final String? pdfPath; // Optional PDF path

  const ContenuPdfArab({Key? key, this.pdfPath}) : super(key: key);

  @override
  State<ContenuPdfArab> createState() => _ContenuPdfArabState();
}

class _ContenuPdfArabState extends State<ContenuPdfArab> {
     final Completer<PDFViewController> _controller =
     Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    print(widget.pdfPath);
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Viewer"),
      ),
      body: widget.pdfPath == null
          ? const Center(child: Text("No PDF path provided"))
          : PDFView(
        filePath: widget.pdfPath,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: true,
        pageSnap: true,
        defaultPage: currentPage!,
        fitPolicy: FitPolicy.BOTH,
        preventLinkNavigation:
        false, // if set to true the link is handled in flutter
        onRender: (_pages) {
          setState(() {
            pages = _pages;
            isReady = true;
          });
        },
        onError: (error) {
          setState(() {
            errorMessage = error.toString();
          });
          print(error.toString());
        },
        onPageError: (page, error) {
          setState(() {
            errorMessage = '$page: ${error.toString()}';
          });
          print('$page: ${error.toString()}');
        },
        onViewCreated: (PDFViewController pdfViewController) {
          _controller.complete(pdfViewController);
        },
        onLinkHandler: (String? uri) {
          print('goto uri: $uri');
        },
        onPageChanged: (int? page, int? total) {
          print('page change: $page/$total');
          setState(() {
            currentPage = page;
          });
        },
      ),
    );
  }
}
