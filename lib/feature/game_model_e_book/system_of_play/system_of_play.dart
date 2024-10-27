import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:pedagogue/feature/espqceEPS/ficheDePresence/save_file_mobile.dart';
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';

class SystemOfPlay extends StatefulWidget {
  const SystemOfPlay({super.key});

  @override
  State<SystemOfPlay> createState() => _SystemOfPlayState();
}

class _SystemOfPlayState extends State<SystemOfPlay> {
  Future<void> _generatePDF() async {
    final font = await rootBundle.load("assets/JannaLT-Regular.ttf");
    final ttf = p.Font.ttf(font);
    final pdf = p.Document();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langue = prefs.getString('SAVED_LOCALIZATION');
    print(langue);
    final netImage1 = await networkImage(
        'https://www.mobile.sportspedagogue.com/16_${intl.imgLang}.png');
    final netImage2 = await networkImage(
        "https://www.mobile.sportspedagogue.com/21_${intl.imgLang}.png");

    pdf.addPage(
      p.MultiPage(
          maxPages: 200,
          pageFormat: PdfPageFormat.a4,
          build: (p.Context context) {
            return <p.Widget>[
              p.Column(
                children: [
                  p.SizedBox(height: 10),
                  p.Container(
                      color: PdfColors.amber,
                      height: 50,
                      width: 500,
                      child: p.Row(
                          mainAxisAlignment: p.MainAxisAlignment.center,
                          children: [
                            p.Padding(
                                padding: const p.EdgeInsets.only(left: 10),
                                child: p.Text("${intl.systemofPlay1}",
                                    textAlign: p.TextAlign.center,
                                    textDirection: langue == "ar"
                                        ? p.TextDirection.rtl
                                        : p.TextDirection.ltr,
                                    style: p.TextStyle(
                                        font: ttf,
                                        color: PdfColors.white,
                                        fontSize: 15)))
                          ])),
                  p.SizedBox(
                    width: 500,
                    child: p.Text("${intl.systemofPlay3}",
                        textAlign: p.TextAlign.center,
                        textDirection: langue == "ar"
                            ? p.TextDirection.rtl
                            : p.TextDirection.ltr,
                        style: p.TextStyle(
                            font: ttf, color: PdfColors.black, fontSize: 15)),
                  )
                ],
              ),
              p.Column(
                children: [
                  p.SizedBox(height: 10),
                  p.Container(
                      color: PdfColors.amber,
                      height: 50,
                      width: 500,
                      child: p.Row(
                          mainAxisAlignment: p.MainAxisAlignment.center,
                          children: [
                            p.Padding(
                                padding: const p.EdgeInsets.only(left: 10),
                                child: p.Text("${intl.systemofPlay2}",
                                    textAlign: p.TextAlign.center,
                                    textDirection: langue == "ar"
                                        ? p.TextDirection.rtl
                                        : p.TextDirection.ltr,
                                    style: p.TextStyle(
                                        font: ttf,
                                        color: PdfColors.white,
                                        fontSize: 15)))
                          ])),
                  p.SizedBox(
                    width: 500,
                    child: p.Text("${intl.systemofPlay4}",
                        textAlign: p.TextAlign.center,
                        textDirection: langue == "ar"
                            ? p.TextDirection.rtl
                            : p.TextDirection.ltr,
                        style: p.TextStyle(
                            font: ttf, color: PdfColors.black, fontSize: 15)),
                  )
                ],
              ),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "${intl.systemofPlayList}(4-2-3-1).pdf");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.systemofPlayList}(4-2-3-1)")),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              Dimensions.verticalSpacingExtraLarge,
              Card(
                color: AppColors.primaryColor,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          child: Center(child: Text("${intl.systemofPlay1}"))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Text(
                "${intl.systemofPlay3}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Card(
                color: AppColors.primaryColor,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          child: Center(child: Text("${intl.systemofPlay2}"))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Text(
                "${intl.systemofPlay4}",
                style: TextStyle(fontWeight: FontWeight.bold),
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
