import 'package:flutter/material.dart';
import 'package:pedagogue/feature/bibliotheque/pdf/pdfWordWide.dart';
import 'package:pedagogue/l10n/localization.dart';

import 'PdfArab.dart';

class HomePdf extends StatelessWidget {
  const HomePdf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.pdf), // Set the title for the AppBar!
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min, // Use minimum space
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        pdfWordWide()), // Replace DetailPage with the actual page you want to navigate to
              );
            },
            child: Card(
              child: ListTile(
                title: Text(intl.pdfTitle1), // Title for the first card
              ),
            ),
          ),
          SizedBox(height: 10), // Space between cards
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PdfArabScreen()));
            },
            child: Card(
              child: ListTile(
                title: Text(intl.pdfTitle2), // Title for the second card
              ),
            ),
          ),
        ],
      ),
    );
  }
}
