import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:pedagogue/feature/espqceEPS/ficheDePresence/save_file_mobile.dart';
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/loading_widget.dart';

class RoleOfCoach extends StatefulWidget {
  const RoleOfCoach({super.key});

  @override
  State<RoleOfCoach> createState() => _RoleOfCoachState();
}

class _RoleOfCoachState extends State<RoleOfCoach> {
  Future<void> _generatePDF() async {
    final font = await rootBundle.load("assets/JannaLT-Regular.ttf");
    final ttf = p.Font.ttf(font);
    final pdf = p.Document();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langue = prefs.getString('SAVED_LOCALIZATION');
    print(langue);
    final netImage1 = await networkImage("${intl.roleofaCoachimg}");

    pdf.addPage(
      p.MultiPage(
          maxPages: 200,
          pageFormat: PdfPageFormat.a4,
          build: (p.Context context) {
            return <p.Widget>[
              p.SizedBox(height: 10),
              p.Image(netImage1),
              p.SizedBox(height: 10),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "${intl.roleofaCoachList}.pdf");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.roleofaCoachList}")),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
          width: MediaQuery.of(context).size.width * 0.99,
          child: Column(
            children: [
              Dimensions.verticalSpacingExtraLarge,
              CachedNetworkImage(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.99,
                imageUrl: "${intl.roleofaCoachimg}",
                imageBuilder: (context, imageProvioder) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvioder, fit: BoxFit.fill),
                    ),
                  );
                },
                placeholder: (context, url) => const SizedBox(
                  height: 250,
                  width: 164,
                  child: Center(child: LoadingWidget()),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomButton(
                  text: intl.print,
                  onPressed: () {
                    _generatePDF();
                  }),
              Dimensions.verticalSpacingExtraLarge,
            ],
          ),
        ))));
  }
}
