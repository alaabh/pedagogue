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

class StrengthWeaknesses extends StatefulWidget {
  const StrengthWeaknesses({super.key});

  @override
  State<StrengthWeaknesses> createState() => _StrengthWeaknessesState();
}

class _StrengthWeaknessesState extends State<StrengthWeaknesses> {
  Future<void> _generatePDF() async {
    final font = await rootBundle.load("assets/JannaLT-Regular.ttf");
    final ttf = p.Font.ttf(font);
    final pdf = p.Document();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langue = prefs.getString('SAVED_LOCALIZATION');
    print(langue);
    final netImage1 =
        await networkImage('https://www.mobile.sportspedagogue.com/29.png');
    final netImage2 = await networkImage(
        'https://www.mobile.sportspedagogue.com/28_${intl.imgLang}.png');
    p.Widget buildTextField(String title, String input1, String input2) {
      return p.Column(
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
                        child: p.Text(title,
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
          p.SizedBox(
            width: 500,
            child: p.Text("${intl.strengthWeaknesses6}",
                textAlign: p.TextAlign.center,
                textDirection:
                    langue == "ar" ? p.TextDirection.rtl : p.TextDirection.ltr,
                style: p.TextStyle(
                    font: ttf, color: PdfColors.deepOrange, fontSize: 15)),
          ),
          p.SizedBox(height: 10),
          p.SizedBox(
            width: 500,
            child: p.Text(input1,
                textAlign: p.TextAlign.center,
                textDirection:
                    langue == "ar" ? p.TextDirection.rtl : p.TextDirection.ltr,
                style: p.TextStyle(
                    font: ttf, color: PdfColors.black, fontSize: 15)),
          ),
          p.SizedBox(height: 10),
          p.SizedBox(
            width: 500,
            child: p.Text("${intl.strengthWeaknesses7}",
                textAlign: p.TextAlign.center,
                textDirection:
                    langue == "ar" ? p.TextDirection.rtl : p.TextDirection.ltr,
                style: p.TextStyle(
                    font: ttf, color: PdfColors.deepOrange, fontSize: 15)),
          ),
          p.SizedBox(height: 10),
          p.SizedBox(
            width: 500,
            child: p.Text(input2,
                textAlign: p.TextAlign.center,
                textDirection:
                    langue == "ar" ? p.TextDirection.rtl : p.TextDirection.ltr,
                style: p.TextStyle(
                    font: ttf, color: PdfColors.black, fontSize: 15)),
          ),
          p.SizedBox(height: 10),
        ],
      );
    };
    pdf.addPage(
      p.MultiPage(
          maxPages: 200,
          pageFormat: PdfPageFormat.a4,
          build: (p.Context context) {
            return <p.Widget>[
              p.SizedBox(height: 10),
              p.Image(netImage1, height: 400),
              p.SizedBox(height: 50),
              p.Image(netImage2, height: 400),
              p.SizedBox(height: 50),
              buildTextField(
                  intl.strengthWeaknesses1,
                  inputs[0]["${intl.strengthWeaknesses1}strength"].text,
                  inputs[0]["${intl.strengthWeaknesses1}potential"].text),
              buildTextField(
                  intl.strengthWeaknesses1,
                  inputs[1]["${intl.strengthWeaknesses2}strength"].text,
                  inputs[1]["${intl.strengthWeaknesses2}potential"].text),
              buildTextField(
                  intl.strengthWeaknesses1,
                  inputs[2]["${intl.strengthWeaknesses3}strength"].text,
                  inputs[2]["${intl.strengthWeaknesses3}potential"].text),
              buildTextField(
                  intl.strengthWeaknesses1,
                  inputs[3]["${intl.strengthWeaknesses4}strength"].text,
                  inputs[3]["${intl.strengthWeaknesses4}potential"].text),
              buildTextField(
                  intl.strengthWeaknesses1,
                  inputs[4]["${intl.strengthWeaknesses5}strength"].text,
                  inputs[4]["${intl.strengthWeaknesses5}potential"].text),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "${intl.strengthWeaknessesList}.pdf");
  }

  @override
  void initState() {
    super.initState();
  }

  List<String> titleCardList = [
    "${intl.strengthWeaknesses1}",
    "${intl.strengthWeaknesses2}",
    "${intl.strengthWeaknesses3}",
    "${intl.strengthWeaknesses4}",
    "${intl.strengthWeaknesses5}",
  ];
  List<Map<String, dynamic>> inputs = [
    {
      "${intl.strengthWeaknesses1}strength": TextEditingController(),
      "${intl.strengthWeaknesses1}potential": TextEditingController(),
    },
    {
      "${intl.strengthWeaknesses2}strength": TextEditingController(),
      "${intl.strengthWeaknesses2}potential": TextEditingController(),
    },
    {
      "${intl.strengthWeaknesses3}strength": TextEditingController(),
      "${intl.strengthWeaknesses3}potential": TextEditingController(),
    },
    {
      "${intl.strengthWeaknesses4}strength": TextEditingController(),
      "${intl.strengthWeaknesses4}potential": TextEditingController(),
    },
    {
      "${intl.strengthWeaknesses5}strength": TextEditingController(),
      "${intl.strengthWeaknesses5}potential": TextEditingController(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.strengthWeaknessesList}")),
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
                imageUrl: "https://www.mobile.sportspedagogue.com/29.png",
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
                    "https://www.mobile.sportspedagogue.com/28_${intl.imgLang}.png",
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
                                          child: Center(child: Text("$item"))),
                                    ],
                                  ),
                                ),
                              ),
                              Dimensions.verticalSpacingExtraLarge,
                              Column(
                                children: [
                                  Text(
                                    "${intl.strengthWeaknesses6}",
                                    style: TextStyle(
                                        color: AppColors.secondaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Dimensions.verticalSpacingExtraLarge,
                                  TextField(
                                    keyboardType: TextInputType.multiline,
                                    controller:
                                        inputs[titleCardList.indexOf(item)]
                                            ["${item}strength"],
                                    decoration: const InputDecoration(),
                                    autofocus: false,
                                    maxLines: null,
                                    minLines: 3,
                                  ),
                                ],
                              ),
                              Dimensions.verticalSpacingExtraLarge,
                              Column(
                                children: [
                                  Text(
                                    "${intl.strengthWeaknesses7} ",
                                    style: TextStyle(
                                        color: AppColors.secondaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Dimensions.verticalSpacingExtraLarge,
                                  TextField(
                                    keyboardType: TextInputType.multiline,
                                    controller:
                                        inputs[titleCardList.indexOf(item)]
                                            ["${item}potential"],
                                    decoration: const InputDecoration(),
                                    autofocus: false,
                                    maxLines: null,
                                    minLines: 3,
                                  ),
                                ],
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
                    /* print(inputs[0]["${intl.strengthWeaknesses1}strength"]);
                    print(inputs[0]["${intl.strengthWeaknesses1}potential"]); */
                  }),
              Dimensions.verticalSpacingExtraLarge,
            ],
          ),
        ))));
  }
}
