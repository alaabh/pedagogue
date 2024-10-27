import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/shimmer/radio_widget_list.dart';
import '../../espqceEPS/ficheDePresence/save_file_mobile.dart';

class ReflectivePracticePart2 extends StatefulWidget {
  final TextEditingController joueur;
  final TextEditingController date1Controller;
  final TextEditingController time1Controller;
  final TextEditingController sessionController1;
  final TextEditingController sessionController2;
  final TextEditingController sessionController3;
  final TextEditingController needsController;
  final Map<String, dynamic> titleList;
  final Map<String, dynamic> controllers1;
  final String? eXITTICKETValue;
  const ReflectivePracticePart2(
      {super.key,
      required this.joueur,
      required this.date1Controller,
      required this.time1Controller,
      required this.sessionController1,
      required this.sessionController2,
      required this.sessionController3,
      required this.needsController,
      required this.titleList,
      required this.controllers1,
      required this.eXITTICKETValue});

  @override
  State<ReflectivePracticePart2> createState() =>
      _ReflectivePracticePart2State();
}

class _ReflectivePracticePart2State extends State<ReflectivePracticePart2> {
  List<String> titleList = [
    "${intl.reflectivePracticePart24}",
    "${intl.reflectivePracticePart25}",
    "${intl.reflectivePracticePart26}",
    "${intl.reflectivePracticePart27}",
    "${intl.reflectivePracticePart28}",
    "${intl.reflectivePracticePart29}",
    "${intl.reflectivePracticePart210}",
    "${intl.reflectivePracticePart211}",
    "${intl.reflectivePracticePart212}",
    "${intl.reflectivePracticePart213}",
    "${intl.reflectivePracticePart214}",
  ];
  Map<String, String> radioValueList = {
    "${intl.reflectivePracticePart24}": "",
    "${intl.reflectivePracticePart25}": "",
    "${intl.reflectivePracticePart26}": "",
    "${intl.reflectivePracticePart27}": "",
    "${intl.reflectivePracticePart28}": "",
    "${intl.reflectivePracticePart29}": "",
    "${intl.reflectivePracticePart210}": "",
    "${intl.reflectivePracticePart211}": "",
    "${intl.reflectivePracticePart212}": "",
    "${intl.reflectivePracticePart213}": "",
    "${intl.reflectivePracticePart214}": "",
  };

  final TextEditingController bh616Controller = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  final TextEditingController questions1Controller1 = TextEditingController();
  final TextEditingController questions1Controller2 = TextEditingController();
  final TextEditingController questions1Controller3 = TextEditingController();

  final TextEditingController questions2Controller1 = TextEditingController();
  final TextEditingController questions2Controller2 = TextEditingController();
  final TextEditingController questions2Controller3 = TextEditingController();

  final TextEditingController questions3Controller = TextEditingController();

  final TextEditingController questions4Controller = TextEditingController();
  Future<void> _generatePDF() async {
    final font = await rootBundle.load("assets/JannaLT-Regular.ttf");
    final ttf = p.Font.ttf(font);
    final pdf = p.Document();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langue = prefs.getString('SAVED_LOCALIZATION');
    print(langue);

    pdf.addPage(
      p.MultiPage(
          maxPages: 200,
          pageFormat: PdfPageFormat.a4,
          build: (p.Context context) {
            return <p.Widget>[
              p.Row(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 200,
                      child: p.Text(intl.player,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.black,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 200,
                      child: p.Text(widget.joueur.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.Row(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 200,
                      child: p.Text(intl.date,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.black,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 200,
                      child: p.Text(widget.date1Controller.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.Row(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 200,
                      child: p.Text(intl.time,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.black,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 200,
                      child: p.Text(widget.time1Controller.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
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
                            child: p.Text("${intl.reflectivePracticePart11}",
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
                child: p.Text("1: ${widget.sessionController1.text}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf, color: PdfColors.black, fontSize: 15)),
              ),
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text("2: ${widget.sessionController2.text}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf, color: PdfColors.black, fontSize: 15)),
              ),
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text("3: ${widget.sessionController3.text}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf, color: PdfColors.black, fontSize: 15)),
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
                            child: p.Text("${intl.reflectivePracticePart12}",
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
                width: 200,
                child: p.Text("${widget.needsController.text}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf, color: PdfColors.black, fontSize: 15)),
              ),
              p.SizedBox(height: 10),
              p.Column(
                children: widget.titleList.entries.map((entry) {
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
                                    child: p.Text(entry.key,
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
                        children: [
                          p.SizedBox(
                            width: 500,
                            child: p.Text(entry.value,
                                textAlign: p.TextAlign.center,
                                textDirection: langue == "ar"
                                    ? p.TextDirection.rtl
                                    : p.TextDirection.ltr,
                                style: p.TextStyle(
                                    font: ttf,
                                    color: PdfColors.deepOrange,
                                    fontSize: 15)),
                          ),
                          p.SizedBox(
                            width: 500,
                            child: p.Text(widget.controllers1[entry.value].text,
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
                      p.SizedBox(height: 10),
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
                            child: p.Text("${intl.reflectivePracticePart18}",
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
                children: [
                  p.SizedBox(
                    width: 500,
                    child: p.Text("${intl.reflectivePracticePart114}",
                        textAlign: p.TextAlign.center,
                        textDirection: langue == "ar"
                            ? p.TextDirection.rtl
                            : p.TextDirection.ltr,
                        style: p.TextStyle(
                            font: ttf,
                            color: PdfColors.deepOrange,
                            fontSize: 15)),
                  ),
                  p.SizedBox(
                    width: 500,
                    child: p.Text(widget.eXITTICKETValue.toString(),
                        textAlign: p.TextAlign.center,
                        textDirection: langue == "ar"
                            ? p.TextDirection.rtl
                            : p.TextDirection.ltr,
                        style: p.TextStyle(
                            font: ttf, color: PdfColors.black, fontSize: 15)),
                  ),
                ],
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
                            child: p.Text("${intl.reflectivePracticePart21}",
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
                child: p.Text("1: ${questions1Controller1.text}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf, color: PdfColors.black, fontSize: 15)),
              ),
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text("2: ${questions1Controller2.text}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf, color: PdfColors.black, fontSize: 15)),
              ),
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text("3: ${questions1Controller3.text}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf, color: PdfColors.black, fontSize: 15)),
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
                            child: p.Text("${intl.reflectivePracticePart22}",
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
                child: p.Text("1: ${questions2Controller1.text}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf, color: PdfColors.black, fontSize: 15)),
              ),
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text("2: ${questions2Controller2.text}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf, color: PdfColors.black, fontSize: 15)),
              ),
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text("3: ${questions2Controller3.text}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf, color: PdfColors.black, fontSize: 15)),
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
                            child: p.Text("bh_616",
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
                child: p.Text("${bh616Controller.text}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf, color: PdfColors.black, fontSize: 15)),
              ),
              p.SizedBox(height: 10),
              p.Row(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text("${intl.date}: ${dateController.text}",
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.black,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                  ]),
              p.SizedBox(height: 10),
              p.Row(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text("${intl.time}: ${timeController.text}",
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.black,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                  ]),
              p.SizedBox(height: 10),
              p.Column(
                children: radioValueList.entries.map((entry) {
                  return p.Column(
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
                                color: PdfColors.amber,
                                fontSize: 15)),
                      ),
                      p.SizedBox(height: 10),
                      p.Column(
                        children: [
                          p.SizedBox(
                            width: 500,
                            child: p.Text(entry.value,
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
                      p.SizedBox(height: 10),
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
                            child: p.Text(intl.reflectivePracticePart215,
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
                child: p.Text(questions3Controller.text,
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf, color: PdfColors.black, fontSize: 15)),
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
                            child: p.Text(intl.reflectivePracticePart216,
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
                child: p.Text(questions4Controller.text,
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf, color: PdfColors.black, fontSize: 15)),
              ),
              p.SizedBox(height: 10),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "${intl.reflectivePracticePart1List}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.reflectivePracticePart2List}")),
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
                          child: Center(
                              child: Text("${intl.reflectivePracticePart21}"))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: questions1Controller1,
                hint: "1",
                title: "1",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: questions1Controller2,
                hint: "2",
                title: "2",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: questions1Controller3,
                hint: "3",
                title: "3",
                inputType: InputType.text,
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
                              child: Text("${intl.reflectivePracticePart22}"))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: questions2Controller1,
                hint: "1",
                title: "1",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: questions2Controller2,
                hint: "2",
                title: "2",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: questions2Controller3,
                hint: "3",
                title: "3",
                inputType: InputType.text,
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
                      SizedBox(child: Center(child: Text("bh_616"))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              TextField(
                keyboardType: TextInputType.multiline,
                controller: bh616Controller,
                decoration: const InputDecoration(),
                autofocus: false,
                maxLines: null,
                minLines: 3,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: dateController,
                hint: "${intl.date}",
                title: "${intl.date}",
                inputType: InputType.date,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: timeController,
                hint: "${intl.time}",
                title: "${intl.time}",
                inputType: InputType.time,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: titleList
                    .map(
                      (item) => Column(
                        children: [
                          Dimensions.verticalSpacingExtraLarge,
                          Row(
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Text(
                                    "${intl.reflectivePracticePart217}",
                                  )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: RadioWidgetList(
                                  title: item,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueList[item] = value!;
                                    });
                                  },
                                  selectedValue: radioValueList[item],
                                  orientation: Axis.horizontal,
                                  values: [
                                    "1",
                                    "2",
                                    "3",
                                    "4",
                                    "5",
                                  ],
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Text(
                                    "${intl.reflectivePracticePart218}",
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Card(
                color: AppColors.primaryColor,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Center(
                              child:
                                  Text("${intl.reflectivePracticePart215}"))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              TextField(
                keyboardType: TextInputType.multiline,
                controller: questions3Controller,
                decoration: const InputDecoration(),
                autofocus: false,
                maxLines: null,
                minLines: 3,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Card(
                color: AppColors.primaryColor,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Center(
                              child:
                                  Text("${intl.reflectivePracticePart216}"))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              TextField(
                keyboardType: TextInputType.multiline,
                controller: questions4Controller,
                decoration: const InputDecoration(),
                autofocus: false,
                maxLines: null,
                minLines: 3,
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
