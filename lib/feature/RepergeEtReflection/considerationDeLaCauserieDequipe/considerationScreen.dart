import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../espqceEPS/ficheDePresence/save_file_mobile.dart';

class consederationScreen extends StatefulWidget {
  const consederationScreen({super.key});

  @override
  State<consederationScreen> createState() => _consederationScreenState();
}

class _consederationScreenState extends State<consederationScreen> {
  Map<String, bool> tHESITUATIONList = {
    "${intl.teamTalks2}": false,
    "${intl.teamTalks3}": false,
    "${intl.teamTalks4}": false,
    "${intl.teamTalks5}": false,
    "${intl.teamTalks55}": false,
    "${intl.teamTalks6}": false,
  };
  Map<String, dynamic> tHESITUATIONControllerList = {
    "${intl.teamTalks2}": TextEditingController(),
    "${intl.teamTalks3}": TextEditingController(),
    "${intl.teamTalks4}": TextEditingController(),
    "${intl.teamTalks5}": TextEditingController(),
    "${intl.teamTalks55}": TextEditingController(),
    "${intl.teamTalks6}": TextEditingController(),
  };
  Map<String, bool> tHREATSList = {
    "${intl.teamTalks8}": false,
    "${intl.teamTalks9}": false,
    "${intl.teamTalks10}": false,
    "${intl.teamTalks11}": false,
    "${intl.teamTalks12}": false,
  };
  Map<String, dynamic> tHREATSControllerList = {
    "${intl.teamTalks8}": TextEditingController(),
    "${intl.teamTalks9}": TextEditingController(),
    "${intl.teamTalks10}": TextEditingController(),
    "${intl.teamTalks11}": TextEditingController(),
    "${intl.teamTalks12}": TextEditingController(),
  };
  Map<String, bool> sUCCESSList = {
    "${intl.teamTalks14}": false,
    "${intl.teamTalks15}": false,
    "${intl.teamTalks16}": false,
    "${intl.teamTalks17}": false,
    "${intl.teamTalks18}": false,
  };
  Map<String, dynamic> sUCCESSControllerList = {
    "${intl.teamTalks14}": TextEditingController(),
    "${intl.teamTalks15}": TextEditingController(),
    "${intl.teamTalks16}": TextEditingController(),
    "${intl.teamTalks17}": TextEditingController(),
    "${intl.teamTalks18}": TextEditingController(),
  };

  Future<void> _generatePDF() async {
    final font = await rootBundle.load("assets/JannaLT-Regular.ttf");
    final ttf = p.Font.ttf(font);
    final pdf = p.Document();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langue = prefs.getString('SAVED_LOCALIZATION');
    print(langue);
    final netImage1 = await networkImage(
        'https://www.mobile.sportspedagogue.com/66_${intl.imgLang}.png');

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
                                child: p.Text(intl.teamTalks1,
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
                  p.Column(
                    children: tHESITUATIONList.entries.map((entry) {
                      return p.Column(
                        children: [
                          p.SizedBox(height: 10),
                          entry.value == false
                              ? p.Container()
                              : p.Column(
                                  children: [
                                    p.SizedBox(height: 10),
                                    p.SizedBox(
                                      width: 500,
                                      child: p.Text(entry.key,
                                          textAlign: p.TextAlign.center,
                                          textDirection: langue == "ar"
                                              ? p.TextDirection.rtl
                                              : p.TextDirection.ltr,
                                          style: p.TextStyle(
                                              font: ttf,
                                              color: PdfColors.deepOrange800,
                                              fontSize: 15)),
                                    ),
                                    p.SizedBox(
                                      width: 500,
                                      child: p.Text(
                                          tHESITUATIONControllerList[entry.key]
                                              .text,
                                          textAlign: p.TextAlign.center,
                                          textDirection: langue == "ar"
                                              ? p.TextDirection.rtl
                                              : p.TextDirection.ltr,
                                          style: p.TextStyle(
                                              font: ttf,
                                              color: PdfColors.black,
                                              fontSize: 15)),
                                    ),
                                  ],
                                ),
                        ],
                      );
                    }).toList(),
                  ),
                  p.Container(
                      color: PdfColors.amber,
                      height: 50,
                      width: 500,
                      child: p.Row(
                          mainAxisAlignment: p.MainAxisAlignment.center,
                          children: [
                            p.Padding(
                                padding: const p.EdgeInsets.only(left: 10),
                                child: p.Text(intl.teamTalks7,
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
                  p.Column(
                    children: tHREATSList.entries.map((entry) {
                      return p.Column(
                        children: [
                          p.SizedBox(height: 10),
                          entry.value == false
                              ? p.Container()
                              : p.Column(
                                  children: [
                                    p.SizedBox(height: 10),
                                    p.SizedBox(
                                      width: 500,
                                      child: p.Text(entry.key,
                                          textAlign: p.TextAlign.center,
                                          textDirection: langue == "ar"
                                              ? p.TextDirection.rtl
                                              : p.TextDirection.ltr,
                                          style: p.TextStyle(
                                              font: ttf,
                                              color: PdfColors.deepOrange800,
                                              fontSize: 15)),
                                    ),
                                    p.SizedBox(
                                      width: 500,
                                      child: p.Text(
                                          tHREATSControllerList[entry.key].text,
                                          textAlign: p.TextAlign.center,
                                          textDirection: langue == "ar"
                                              ? p.TextDirection.rtl
                                              : p.TextDirection.ltr,
                                          style: p.TextStyle(
                                              font: ttf,
                                              color: PdfColors.black,
                                              fontSize: 15)),
                                    ),
                                  ],
                                ),
                        ],
                      );
                    }).toList(),
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
                                child: p.Text(intl.teamTalks13,
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
                  p.Column(
                    children: sUCCESSList.entries.map((entry) {
                      return p.Column(
                        children: [
                          p.SizedBox(height: 10),
                          entry.value == false
                              ? p.Container()
                              : p.Column(
                                  children: [
                                    p.SizedBox(height: 10),
                                    p.SizedBox(
                                      width: 500,
                                      child: p.Text(entry.key,
                                          textAlign: p.TextAlign.center,
                                          textDirection: langue == "ar"
                                              ? p.TextDirection.rtl
                                              : p.TextDirection.ltr,
                                          style: p.TextStyle(
                                              font: ttf,
                                              color: PdfColors.deepOrange800,
                                              fontSize: 15)),
                                    ),
                                    p.SizedBox(
                                      width: 500,
                                      child: p.Text(
                                          sUCCESSControllerList[entry.key].text,
                                          textAlign: p.TextAlign.center,
                                          textDirection: langue == "ar"
                                              ? p.TextDirection.rtl
                                              : p.TextDirection.ltr,
                                          style: p.TextStyle(
                                              font: ttf,
                                              color: PdfColors.black,
                                              fontSize: 15)),
                                    ),
                                  ],
                                ),
                        ],
                      );
                    }).toList(),
                  ),
                  p.SizedBox(height: 10),
                ],
              ),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "${intl.teamTalksList}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.teamTalksList}")),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
          width: MediaQuery.of(context).size.width * 0.99,
          child: Column(
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
                          child: Center(child: Text("${intl.teamTalks1}"))),
                    ],
                  ),
                ),
              ),
              Column(
                children: tHESITUATIONList.entries.map((entry) {
                  return Column(
                    children: [
                      Dimensions.verticalSpacingExtraLarge,
                      CheckboxListTile(
                        title: Text(entry.key),
                        value: entry.value,
                        onChanged: (bool? value) {
                          setState(() {
                            tHESITUATIONList[entry.key] = value!;
                          });
                        },
                      ),
                      if (entry.value)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            controller: tHESITUATIONControllerList[entry.key],
                            decoration: const InputDecoration(),
                            autofocus: false,
                            maxLines: null,
                            minLines: 3,
                          ),
                        ),
                    ],
                  );
                }).toList(),
              ),
              Card(
                color: AppColors.primaryColor,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          child: Center(child: Text("${intl.teamTalks7}"))),
                    ],
                  ),
                ),
              ),
              Column(
                children: tHREATSList.entries.map((entry) {
                  return Column(
                    children: [
                      Dimensions.verticalSpacingExtraLarge,
                      CheckboxListTile(
                        title: Text(entry.key),
                        value: entry.value,
                        onChanged: (bool? value) {
                          setState(() {
                            tHREATSList[entry.key] = value!;
                          });
                        },
                      ),
                      if (entry.value)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            controller: tHREATSControllerList[entry.key],
                            decoration: const InputDecoration(),
                            autofocus: false,
                            maxLines: null,
                            minLines: 3,
                          ),
                        ),
                    ],
                  );
                }).toList(),
              ),
              Card(
                color: AppColors.primaryColor,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          child: Center(child: Text("${intl.teamTalks13}"))),
                    ],
                  ),
                ),
              ),
              Column(
                children: sUCCESSList.entries.map((entry) {
                  return Column(
                    children: [
                      Dimensions.verticalSpacingExtraLarge,
                      CheckboxListTile(
                        title: Text(entry.key),
                        value: entry.value,
                        onChanged: (bool? value) {
                          setState(() {
                            sUCCESSList[entry.key] = value!;
                          });
                        },
                      ),
                      if (entry.value)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            controller: sUCCESSControllerList[entry.key],
                            decoration: const InputDecoration(),
                            autofocus: false,
                            maxLines: null,
                            minLines: 3,
                          ),
                        ),
                    ],
                  );
                }).toList(),
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
