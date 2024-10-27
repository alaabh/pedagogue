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
import '../../../shared/widget/loading_widget.dart';

class PrinciplesOfPlays extends StatefulWidget {
  const PrinciplesOfPlays({super.key});

  @override
  State<PrinciplesOfPlays> createState() => _PrinciplesOfPlaysState();
}

class _PrinciplesOfPlaysState extends State<PrinciplesOfPlays> {
  Future<void> _generatePDF() async {
    final font = await rootBundle.load("assets/JannaLT-Regular.ttf");
    final ttf = p.Font.ttf(font);
    final pdf = p.Document();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langue = prefs.getString('SAVED_LOCALIZATION');
    print(langue);
    final netImage1 = await networkImage(
        'https://www.mobile.sportspedagogue.com/3_${intl.imgLang}.png');
    final netImage2 = await networkImage(
        'https://www.mobile.sportspedagogue.com/4_${intl.imgLang}.png');
    final netImage3 = await networkImage(
        'https://www.mobile.sportspedagogue.com/5_${intl.imgLang}.png');
    final netImage4 = await networkImage(
        'https://www.mobile.sportspedagogue.com/6_${intl.imgLang}.png');

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
                            child: p.Text("${intl.principlesofplayList}",
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
              p.Image(netImage1),
              p.SizedBox(height: 10),
              p.Image(netImage2),
              p.SizedBox(height: 10),
              p.Image(netImage3),
              p.SizedBox(height: 10),
              p.Image(netImage4),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "principles_of_plays.pdf");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.principlesofplayList}")),
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
                imageUrl:
                    "https://www.mobile.sportspedagogue.com/3_${intl.imgLang}.png",
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
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.99,
                imageUrl:
                    "https://www.mobile.sportspedagogue.com/4_${intl.imgLang}.png",
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
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.99,
                imageUrl:
                    "https://www.mobile.sportspedagogue.com/5_${intl.imgLang}.png",
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
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.99,
                imageUrl:
                    "https://www.mobile.sportspedagogue.com/6_${intl.imgLang}.png",
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
