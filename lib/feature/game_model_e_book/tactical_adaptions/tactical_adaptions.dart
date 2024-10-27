import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:pedagogue/feature/espqceEPS/ficheDePresence/save_file_mobile.dart';
import 'package:pedagogue/shared/style/dimensions.dart';
import 'package:pedagogue/shared/widget/custom_button.dart';
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/widget/loading_widget.dart';

class TacticalAdaptions extends StatefulWidget {
  const TacticalAdaptions({super.key});

  @override
  State<TacticalAdaptions> createState() => _TacticalAdaptionsState();
}

class _TacticalAdaptionsState extends State<TacticalAdaptions> {
  Future<void> _generatePDF() async {
    final font = await rootBundle.load("assets/JannaLT-Regular.ttf");
    final ttf = p.Font.ttf(font);
    final pdf = p.Document();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langue = prefs.getString('SAVED_LOCALIZATION');
    print(langue);
    final netImage1 =
        await networkImage("https://www.mobile.sportspedagogue.com/30.png");
    final netImage2 =
        await networkImage("https://www.mobile.sportspedagogue.com/31.png");
    final netImage3 =
        await networkImage("https://www.mobile.sportspedagogue.com/32.png");
    final netImage4 =
        await networkImage("https://www.mobile.sportspedagogue.com/33.png");

    pdf.addPage(
      p.MultiPage(
          maxPages: 200,
          pageFormat: PdfPageFormat.a4,
          build: (p.Context context) {
            return <p.Widget>[
              p.Container(
                  color: PdfColors.amber,
                  height: 50,
                  width: 500,
                  child: p.Row(
                      mainAxisAlignment: p.MainAxisAlignment.center,
                      children: [
                        p.Padding(
                            padding: const p.EdgeInsets.only(left: 10),
                            child: p.Text("1-5-4-1",
                                textAlign: p.TextAlign.center,
                                textDirection: langue == "ar"
                                    ? p.TextDirection.rtl
                                    : p.TextDirection.ltr,
                                style: p.TextStyle(
                                    font: ttf,
                                    color: PdfColors.white,
                                    fontSize: 15)))
                      ])),
              p.Image(netImage1, height: 400),
            ];
          }),
    );
    pdf.addPage(
      p.MultiPage(
          maxPages: 200,
          pageFormat: PdfPageFormat.a4,
          build: (p.Context context) {
            return <p.Widget>[
              p.Container(
                  color: PdfColors.amber,
                  height: 50,
                  width: 500,
                  child: p.Row(
                      mainAxisAlignment: p.MainAxisAlignment.center,
                      children: [
                        p.Padding(
                            padding: const p.EdgeInsets.only(left: 10),
                            child: p.Text("1-4-3-3",
                                textAlign: p.TextAlign.center,
                                textDirection: langue == "ar"
                                    ? p.TextDirection.rtl
                                    : p.TextDirection.ltr,
                                style: p.TextStyle(
                                    font: ttf,
                                    color: PdfColors.white,
                                    fontSize: 15)))
                      ])),
              p.Image(netImage2, height: 400),
            ];
          }),
    );
    pdf.addPage(
      p.MultiPage(
          maxPages: 200,
          pageFormat: PdfPageFormat.a4,
          build: (p.Context context) {
            return <p.Widget>[
              p.Container(
                  color: PdfColors.amber,
                  height: 50,
                  width: 500,
                  child: p.Row(
                      mainAxisAlignment: p.MainAxisAlignment.center,
                      children: [
                        p.Padding(
                            padding: const p.EdgeInsets.only(left: 10),
                            child: p.Text("1-4-4-2",
                                textAlign: p.TextAlign.center,
                                textDirection: langue == "ar"
                                    ? p.TextDirection.rtl
                                    : p.TextDirection.ltr,
                                style: p.TextStyle(
                                    font: ttf,
                                    color: PdfColors.white,
                                    fontSize: 15)))
                      ])),
              p.Image(netImage3, height: 400),
            ];
          }),
    );
    pdf.addPage(
      p.MultiPage(
          maxPages: 200,
          pageFormat: PdfPageFormat.a4,
          build: (p.Context context) {
            return <p.Widget>[
              p.Container(
                  color: PdfColors.amber,
                  height: 50,
                  width: 500,
                  child: p.Row(
                      mainAxisAlignment: p.MainAxisAlignment.center,
                      children: [
                        p.Padding(
                            padding: const p.EdgeInsets.only(left: 10),
                            child: p.Text("1-4-5-1",
                                textAlign: p.TextAlign.center,
                                textDirection: langue == "ar"
                                    ? p.TextDirection.rtl
                                    : p.TextDirection.ltr,
                                style: p.TextStyle(
                                    font: ttf,
                                    color: PdfColors.white,
                                    fontSize: 15)))
                      ])),
              p.Image(netImage4, height: 400),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "${intl.tacticalAdaptionsList}.pdf");
  }

  List<String> titleCardList = [
    "1-5-4-1",
    "1-4-3-3",
    "1-4-4-2",
    "1-4-5-1",
  ];
  List<String> imgCardList = [
    "https://www.mobile.sportspedagogue.com/30.png",
    "https://www.mobile.sportspedagogue.com/31.png",
    "https://www.mobile.sportspedagogue.com/32.png",
    "https://www.mobile.sportspedagogue.com/33.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.tacticalAdaptionsList}")),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              Column(
                children: titleCardList
                    .map(
                      (item) => Column(
                        children: [
                          Dimensions.verticalSpacingExtraLarge,
                          Column(
                            children: [
                              Card(
                                color: AppColors.primaryColor,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          child: Center(child: Text(item))),
                                    ],
                                  ),
                                ),
                              ),
                              CachedNetworkImage(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                width: MediaQuery.of(context).size.width * 0.9,
                                imageUrl:
                                    imgCardList[titleCardList.indexOf(item)],
                                imageBuilder: (context, imageProvioder) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: imageProvioder,
                                          fit: BoxFit.fill),
                                    ),
                                  );
                                },
                                placeholder: (context, url) => const SizedBox(
                                  height: 250,
                                  width: 164,
                                  child: Center(child: LoadingWidget()),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                    .toList(),
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
