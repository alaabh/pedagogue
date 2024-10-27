import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:pedagogue/shared/style/dimensions.dart';
import 'package:pedagogue/shared/widget/custom_button.dart';
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/widget/loading_widget.dart';
import '../../espqceEPS/ficheDePresence/save_file_mobile.dart';

class FourCorner extends StatefulWidget {
  const FourCorner({super.key});

  @override
  State<FourCorner> createState() => _FourCornerState();
}

class _FourCornerState extends State<FourCorner> {
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
              p.SizedBox(height: 10),
              p.Image(netImage1),
              p.SizedBox(height: 10),
              p.Column(
                children: titleCardList
                    .map(
                      (item) => p.Column(
                        children: [
                          p.SizedBox(height: 10),
                          item == "https://www.mobile.sportspedagogue.com/21_${intl.imgLang}.png"
                              ? p.Image(netImage2, height: 400)
                              : p.Column(
                                  children: [
                                    p.SizedBox(height: 10),
                                    p.Container(
                                        color: PdfColors.amber,
                                        height: 50,
                                        width: 500,
                                        child: p.Row(
                                            mainAxisAlignment:
                                                p.MainAxisAlignment.center,
                                            children: [
                                              p.Padding(
                                                  padding:
                                                      const p.EdgeInsets.only(
                                                          left: 10),
                                                  child: p.Text(item,
                                                      textAlign:
                                                          p.TextAlign.center,
                                                      textDirection: langue ==
                                                              "ar"
                                                          ? p.TextDirection.rtl
                                                          : p.TextDirection.ltr,
                                                      style: p.TextStyle(
                                                          font: ttf,
                                                          color:
                                                              PdfColors.white,
                                                          fontSize: 15)))
                                            ])),
                                    p.SizedBox(
                                      width: 500,
                                      child: p.Text(
                                          paragCardList[
                                              titleCardList.indexOf(item)],
                                          textAlign: p.TextAlign.center,
                                          textDirection: langue == "ar"
                                              ? p.TextDirection.rtl
                                              : p.TextDirection.ltr,
                                          style: p.TextStyle(
                                              font: ttf,
                                              color: PdfColors.black,
                                              fontSize: 15)),
                                    )
                                  ],
                                ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "${intl.fourcornerList}.pdf");
  }

  List<String> titleCardList = [
    "${intl.fourcorner1}",
    "${intl.fourcorner2}",
    "${intl.fourcorner3}",
    "${intl.fourcorner4}",
    "https://www.mobile.sportspedagogue.com/21_${intl.imgLang}.png",
    "${intl.fourcorner5}",
    "${intl.fourcorner6}",
    "${intl.fourcorner7}",
  ];
  List<String> paragCardList = [
    "${intl.fourcorner8}",
    "${intl.fourcorner9}",
    "${intl.fourcorner10}",
    "${intl.fourcorner11}",
    "",
    "${intl.fourcorner12}",
    "${intl.fourcorner13}",
    "${intl.fourcorner14}",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.fourcornerList}")),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              Dimensions.verticalSpacingExtraLarge,
              CachedNetworkImage(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                imageUrl:
                    "https://www.mobile.sportspedagogue.com/22_${intl.imgLang}.png",
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
              Column(
                children: titleCardList
                    .map(
                      (item) => Column(
                        children: [
                          Dimensions.verticalSpacingExtraLarge,
                          item == "https://www.mobile.sportspedagogue.com/21_${intl.imgLang}.png"
                              ? CachedNetworkImage(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  imageUrl:
                                      "https://www.mobile.sportspedagogue.com/21_${intl.imgLang}.png",
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
                                )
                              : Column(
                                  children: [
                                    Card(
                                      color: AppColors.primaryColor,
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                                child:
                                                    Center(child: Text(item))),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      child: Text(
                                        paragCardList[
                                            titleCardList.indexOf(item)],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
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
