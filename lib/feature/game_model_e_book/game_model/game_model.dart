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

class GameModel extends StatefulWidget {
  const GameModel({super.key});

  @override
  State<GameModel> createState() => _GameModelState();
}

class _GameModelState extends State<GameModel> {
  Future<void> _generatePDF() async {
    final font = await rootBundle.load("assets/JannaLT-Regular.ttf");
    final ttf = p.Font.ttf(font);
    final pdf = p.Document();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langue = prefs.getString('SAVED_LOCALIZATION');
    print(langue);
    final netImage1 = await networkImage(
        'https://www.mobile.sportspedagogue.com/14_${intl.imgLang}.png');
    final netImage2 = await networkImage(
        'https://www.mobile.sportspedagogue.com/11_${intl.imgLang}.png');
    final netImage3 = await networkImage(
        'https://www.mobile.sportspedagogue.com/12_${intl.imgLang}.png');
    final netImage4 = await networkImage(
        'https://www.mobile.sportspedagogue.com/13_${intl.imgLang}.png');
    final netImage5 = await networkImage(
        'https://www.mobile.sportspedagogue.com/15_${intl.imgLang}.png');

    pdf.addPage(
      p.MultiPage(
          maxPages: 200,
          pageFormat: PdfPageFormat.a4,
          build: (p.Context context) {
            return <p.Widget>[
              p.Column(
                children: titleCardList
                    .map(
                      (item) => p.Column(
                        children: [
                          p.SizedBox(height: 10),
                          item == "${intl.gameModel29}"
                              ? p.Text(
                                  "${intl.iNDIVIDUALDEVELOPMENTPLAN3}",
                                  textAlign: p.TextAlign.center,
                                  textDirection: langue == "ar"
                                      ? p.TextDirection.rtl
                                      : p.TextDirection.ltr,
                                  style: p.TextStyle(
                                      font: ttf,
                                      color: PdfColors.deepOrange,
                                      fontSize: 20,
                                      fontWeight: p.FontWeight.bold),
                                )
                              : p.Column(
                                  children: [
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
                                      child: p.Text(
                                        paragCardList[
                                            titleCardList.indexOf(item)],
                                        textAlign: p.TextAlign.center,
                                        textDirection: langue == "ar"
                                            ? p.TextDirection.rtl
                                            : p.TextDirection.ltr,
                                        style: p.TextStyle(
                                            font: ttf,
                                            fontWeight: p.FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              p.SizedBox(height: 10),
              p.Image(netImage1),

              /*   */
            ];
          }),
    );

    for (var item in input1) {
      pdf.addPage(
        p.MultiPage(
            maxPages: 200,
            pageFormat: PdfPageFormat.a4,
            build: (p.Context context) {
              return <p.Widget>[
                p.Column(
                  children: [
                    p.Container(
                        color: PdfColors.amber,
                        height: 50,
                        width: 500,
                        child: p.Row(
                            mainAxisAlignment: p.MainAxisAlignment.center,
                            children: [
                              p.Padding(
                                  padding: const p.EdgeInsets.only(left: 10),
                                  child: p.Text(item['title'],
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.white,
                                          fontSize: 15)))
                            ])),
                    p.SizedBox(height: 10),
                    p.Text(
                      "${intl.gameModel42}",
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                        font: ttf,
                        fontWeight: p.FontWeight.bold,
                        color: PdfColors.deepOrange,
                      ),
                    ),
                    p.SizedBox(height: 10),
                    p.Text(
                      item['prag1'],
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                        font: ttf,
                        fontWeight: p.FontWeight.bold,
                      ),
                    ),
                    p.SizedBox(height: 10),
                    p.Text(
                      "${intl.gameModel43}",
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                        font: ttf,
                        fontWeight: p.FontWeight.bold,
                        color: PdfColors.deepOrange,
                      ),
                    ),
                    p.SizedBox(height: 10),
                    p.Text(
                      item['prag2'],
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                        font: ttf,
                        fontWeight: p.FontWeight.bold,
                      ),
                    ),
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
                                  child: p.Text("${intl.gameModel44}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.white,
                                          fontSize: 15)))
                            ])),
                    p.SizedBox(height: 10),
                    p.Image(netImage2),
                    p.SizedBox(height: 10),
                    p.Image(netImage3),
                    p.SizedBox(height: 10),
                    p.Image(netImage4),
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
                                  child: p.Text("${intl.gameModel45}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.white,
                                          fontSize: 15)))
                            ])),
                    p.SizedBox(height: 10),
                    p.Text(
                      item['prag3'],
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                        font: ttf,
                        fontWeight: p.FontWeight.bold,
                      ),
                    ),
                    p.SizedBox(height: 10),
                    p.Text(
                      item['prag4'],
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                        font: ttf,
                        fontWeight: p.FontWeight.bold,
                      ),
                    ),
                    p.SizedBox(height: 10),
                    p.Text(
                      item['prag5'],
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                        font: ttf,
                        fontWeight: p.FontWeight.bold,
                      ),
                    ),
                    p.SizedBox(height: 10),
                  ],
                )
              ];
            }),
      );
    }
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
                            child: p.Text("${intl.gameModel46}",
                                textAlign: p.TextAlign.center,
                                textDirection: langue == "ar"
                                    ? p.TextDirection.rtl
                                    : p.TextDirection.ltr,
                                style: p.TextStyle(
                                    font: ttf,
                                    color: PdfColors.white,
                                    fontSize: 15)))
                      ])),
              p.SizedBox(height: 10),
              p.Text(
                "${intl.gameModel47}",
                textAlign: p.TextAlign.center,
                textDirection:
                    langue == "ar" ? p.TextDirection.rtl : p.TextDirection.ltr,
                style: p.TextStyle(
                  font: ttf,
                  fontWeight: p.FontWeight.bold,
                ),
              ),
              p.SizedBox(height: 10),
              p.Image(netImage5),
              p.SizedBox(height: 10),
              p.Text(
                "${intl.gameModel48}",
                textAlign: p.TextAlign.center,
                textDirection:
                    langue == "ar" ? p.TextDirection.rtl : p.TextDirection.ltr,
                style: p.TextStyle(
                  font: ttf,
                  fontWeight: p.FontWeight.bold,
                ),
              ),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "principles_of_plays.pdf");
  }

  List<String> titleCardList = [
    "${intl.gameModel25}",
    "${intl.gameModel26}",
    "${intl.gameModel27}",
    "${intl.gameModel28}",
    "${intl.gameModel29}",
    "${intl.gameModel30}",
    "${intl.gameModel31}",
    "${intl.gameModel32}",
    "${intl.gameModel33}",
  ];
  List<String> paragCardList = [
    "${intl.gameModel34}",
    "${intl.gameModel35}",
    "${intl.gameModel36}",
    "${intl.gameModel37}",
    "${intl.gameModel38}",
    "${intl.gameModel39}",
    "${intl.gameModel40}",
    "${intl.gameModel41}",
  ];
  List input1 = [
    {
      "title": "${intl.gameModel1}",
      "prag1": "${intl.gameModel2}",
      "prag2": "${intl.gameModel3}",
      "prag3": "${intl.gameModel4}",
      "prag4": "${intl.gameModel5}",
      "prag5": "${intl.gameModel6}",
    },
    {
      "title": "${intl.gameModel7}",
      "prag1": "${intl.gameModel8}",
      "prag2": "${intl.gameModel9}",
      "prag3": "${intl.gameModel10}",
      "prag4": "${intl.gameModel11}",
      "prag5": "${intl.gameModel12}",
    },
    {
      "title": "${intl.gameModel13}",
      "prag1": "${intl.gameModel14}",
      "prag2": "${intl.gameModel15}",
      "prag3": "${intl.gameModel16}",
      "prag4": "${intl.gameModel17}",
      "prag5": "${intl.gameModel18}",
    },
    {
      "title": "${intl.gameModel19}",
      "prag1": "${intl.gameModel20}",
      "prag2": "${intl.gameModel21}",
      "prag3": "${intl.gameModel22}",
      "prag4": "${intl.gameModel23}",
      "prag5": "${intl.gameModel24}",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.gameModelList}")),
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
                          item == "${intl.gameModel29}"
                              ? Text(
                                  "${intl.iNDIVIDUALDEVELOPMENTPLAN3}",
                                  style: TextStyle(
                                      color: AppColors.secondaryColor,
                                      fontWeight: FontWeight.bold),
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
              CachedNetworkImage(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                imageUrl:
                    "https://www.mobile.sportspedagogue.com/14_${intl.imgLang}.png",
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ...input1.map((item) {
                    return Column(
                      children: [
                        Card(
                          color: AppColors.primaryColor,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    child: Center(child: Text(item['title']))),
                              ],
                            ),
                          ),
                        ),
                        Dimensions.verticalSpacingExtraLarge,
                        Text(
                          "${intl.gameModel42}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        Dimensions.verticalSpacingExtraLarge,
                        Text(
                          item['prag1'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Dimensions.verticalSpacingExtraLarge,
                        Text(
                          "${intl.gameModel43}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        Dimensions.verticalSpacingExtraLarge,
                        Text(
                          item['prag2'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
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
                                    child: Center(
                                        child: Text("${intl.gameModel44}"))),
                              ],
                            ),
                          ),
                        ),
                        Dimensions.verticalSpacingExtraLarge,
                        CachedNetworkImage(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.9,
                          imageUrl:
                              "https://www.mobile.sportspedagogue.com/11_${intl.imgLang}.png",
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
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        Dimensions.verticalSpacingExtraLarge,
                        CachedNetworkImage(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.9,
                          imageUrl:
                              "https://www.mobile.sportspedagogue.com/12_${intl.imgLang}.png",
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
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        Dimensions.verticalSpacingExtraLarge,
                        CachedNetworkImage(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.9,
                          imageUrl:
                              "https://www.mobile.sportspedagogue.com/13_${intl.imgLang}.png",
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
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
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
                                    child: Center(
                                        child: Text("${intl.gameModel45}"))),
                              ],
                            ),
                          ),
                        ),
                        Dimensions.verticalSpacingExtraLarge,
                        Text(
                          item['prag3'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Dimensions.verticalSpacingExtraLarge,
                        Text(
                          item['prag4'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Dimensions.verticalSpacingExtraLarge,
                        Text(
                          item['prag5'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Dimensions.verticalSpacingExtraLarge,
                      ],
                    );
                  }).toList(),
                ],
              ),
              /*   */
              Card(
                color: AppColors.primaryColor,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Center(
                      child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text("${intl.gameModel46}"),
                  )),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Text(
                "${intl.gameModel47}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              CachedNetworkImage(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                imageUrl:
                    "https://www.mobile.sportspedagogue.com/15_${intl.imgLang}.png",
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
              Text(
                "${intl.gameModel48}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
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
