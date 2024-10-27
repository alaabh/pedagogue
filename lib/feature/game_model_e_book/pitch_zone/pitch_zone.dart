import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';

import 'package:pedagogue/shared/style/dimensions.dart';
import 'package:pedagogue/shared/widget/custom_button.dart';
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/widget/loading_widget.dart';
import '../../espqceEPS/ficheDePresence/save_file_mobile.dart';
import 'package:pdf/widgets.dart' as p;
class PitchZone extends StatefulWidget {
  const PitchZone({super.key});

  @override
  State<PitchZone> createState() => _PitchZoneState();
}

class _PitchZoneState extends State<PitchZone> {
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
        'https://www.mobile.sportspedagogue.com/17_${intl.imgLang}.png');
    final netImage3 = await networkImage(
        "https://www.mobile.sportspedagogue.com/18_${intl.imgLang}.png");
    final netImage4 = await networkImage(
        "https://www.mobile.sportspedagogue.com/19_${intl.imgLang}.png");
    final netImage5 = await networkImage(
      "https://www.mobile.sportspedagogue.com/20_${intl.imgLang}.png",
    );
    final netImage6 = await networkImage(
        'https://www.mobile.sportspedagogue.com/21_${intl.imgLang}.png');
    

    pdf.addPage(
      p.MultiPage(
          maxPages: 200,
          pageFormat: PdfPageFormat.a4,
          build: (p.Context context) {
            return <p.Widget>[
              p.SizedBox(height: 10),
              p.Image(netImage1),
              p.SizedBox(height: 10),
              p.Image(netImage2),
              p.SizedBox(height: 10),
              p.Image(netImage3),
              p.SizedBox(height: 10),
              p.Image(netImage4),
              p.SizedBox(height: 10),
              p.Image(netImage4),
              p.SizedBox(height: 10),
              p.Column(
                children: titleCardList
                    .map(
                      (item) => p.Column(
                        children: [
                          p.SizedBox(height: 10),
                          item == "https://www.mobile.sportspedagogue.com/21_${intl.imgLang}.png"
                              ? p.Image(netImage6, height: 400)
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

    saveAndLaunchFile(bytes, "${intl.pitchZoneList}.pdf");
  }

  List<String> titleCardList = [
    "${intl.pitchZone1}",
    "${intl.pitchZone2}",
    "${intl.pitchZone3}",
    "https://www.mobile.sportspedagogue.com/21_${intl.imgLang}.png",
    "${intl.pitchZone4}",
    "${intl.pitchZone5}",
    "${intl.pitchZone6}",
  ];
  List<String> paragCardList = [
    "${intl.pitchZone7}",
    "${intl.pitchZone8}",
    "${intl.pitchZone9}",
    "",
    "${intl.pitchZone10}",
    "${intl.pitchZone11}",
    "${intl.pitchZone12}",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.pitchZoneList}")),
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
                    "https://www.mobile.sportspedagogue.com/16_${intl.imgLang}.png",
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
              CachedNetworkImage(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                imageUrl:
                    "https://www.mobile.sportspedagogue.com/17_${intl.imgLang}.png",
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
              CachedNetworkImage(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                imageUrl:
                    "https://www.mobile.sportspedagogue.com/18_${intl.imgLang}.png",
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
              CachedNetworkImage(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                imageUrl:
                    "https://www.mobile.sportspedagogue.com/19_${intl.imgLang}.png",
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
              CachedNetworkImage(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                imageUrl:
                    "https://www.mobile.sportspedagogue.com/20_${intl.imgLang}.png",
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
