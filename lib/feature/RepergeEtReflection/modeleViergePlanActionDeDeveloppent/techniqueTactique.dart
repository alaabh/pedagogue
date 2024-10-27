import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:pedagogue/feature/espqceEPS/ficheDePresence/save_file_mobile.dart';
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/shimmer/radio_widget_list.dart';

class techniqueTactique extends StatefulWidget {
  final List<String> titleCardList;
  final Map<String, dynamic> titleCardControllerList;
  final List<String> pOSITIONSList;
  final Map<String, dynamic> pOSITIONSControllerList;
  final XFile? selectedImage1Path;
  final TextEditingController dateController;
  final TextEditingController coachController;
  final TextEditingController joueur;
  const techniqueTactique(
      {super.key,
      required this.titleCardList,
      required this.titleCardControllerList,
      required this.pOSITIONSList,
      required this.pOSITIONSControllerList,
      this.selectedImage1Path,
      required this.dateController,
      required this.coachController,
      required this.joueur});

  @override
  State<techniqueTactique> createState() => _techniqueTactiqueState();
}

class _techniqueTactiqueState extends State<techniqueTactique> {
  Map<String, dynamic> tECHNICALTACTICALList = {};
  Map<String, dynamic> tACTICALList = {};
  Map<String, dynamic> sOCIALList = {};
  Map<String, dynamic> pSYCHOLOGICALList = {};
  @override
  void initState() {
    // TODO: implement initState
    print(widget.selectedImage1Path);
    super.initState();

    tECHNICALTACTICALList = {
      "${intl.iNDIVIDUALDEVELOPMENTPLAN17}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN18}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN19}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN20}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN21}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN22}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN23}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN24}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN25}": eMOTIONS,
    };
    tACTICALList = {
      "${intl.iNDIVIDUALDEVELOPMENTPLAN27}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN28}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN29}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN30}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN31}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN32}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN33}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN34}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN35}": eMOTIONS,
    };
    sOCIALList = {
      "${intl.iNDIVIDUALDEVELOPMENTPLAN37}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN38}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN39}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN40}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN41}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN42}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN43}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN44}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN45}": eMOTIONS,
    };
    pSYCHOLOGICALList = {
      "${intl.iNDIVIDUALDEVELOPMENTPLAN47}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN48}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN49}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN50}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN51}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN52}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN53}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN54}": eMOTIONS,
      "${intl.iNDIVIDUALDEVELOPMENTPLAN55}": eMOTIONS,
    };
  }

  String? eMOTIONS = "";
  List<String> titleList = [
    "${intl.iNDIVIDUALDEVELOPMENTPLAN56}",
    "${intl.iNDIVIDUALDEVELOPMENTPLAN57}",
    "${intl.iNDIVIDUALDEVELOPMENTPLAN58}",
    "${intl.iNDIVIDUALDEVELOPMENTPLAN59}",
  ];
  Map<String, dynamic> titleControllerList = {
    "${intl.iNDIVIDUALDEVELOPMENTPLAN56}": TextEditingController(),
    "${intl.iNDIVIDUALDEVELOPMENTPLAN57}": TextEditingController(),
    "${intl.iNDIVIDUALDEVELOPMENTPLAN58}": TextEditingController(),
    "${intl.iNDIVIDUALDEVELOPMENTPLAN59}": TextEditingController(),
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
                  p.Column(
                    children: widget.titleCardList
                        .map(
                          (item) => p.Column(
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
                                            padding: const p.EdgeInsets.only(
                                                left: 10),
                                            child: p.Text("$item",
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
                                child: p.Text(
                                    "${intl.iNDIVIDUALDEVELOPMENTPLAN3}",
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
                                    widget.titleCardControllerList[item].text,
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
                        )
                        .toList(),
                  ),
                  p.SizedBox(height: 10),
                  p.SizedBox(
                    width: 500,
                    child: p.Text("${intl.player}",
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
                    child: p.Text(widget.joueur.text,
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
                    child: p.Text("${intl.date}",
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
                    child: p.Text(widget.dateController.text,
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
                    child: p.Text("${intl.coach}",
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
                    child: p.Text(widget.coachController.text,
                        textAlign: p.TextAlign.center,
                        textDirection: langue == "ar"
                            ? p.TextDirection.rtl
                            : p.TextDirection.ltr,
                        style: p.TextStyle(
                            font: ttf, color: PdfColors.black, fontSize: 15)),
                  ),
                  p.SizedBox(height: 10),
                  widget.selectedImage1Path == null
                      ? p.Container()
                      : p.Image(
                          p.MemoryImage(File(widget.selectedImage1Path!.path)
                              .readAsBytesSync()),
                          width: 500,
                          height: 200),
                  p.SizedBox(height: 10),
                  p.Column(
                    children: widget.pOSITIONSList
                        .map(
                          (item) => item == "point"
                              ? p.Image(netImage1, width: 500, height: 200)
                              : p.Column(
                                  children: [
                                    p.SizedBox(height: 10),
                                    p.SizedBox(
                                      width: 500,
                                      child: p.Text("$item",
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
                                          widget.pOSITIONSControllerList[item]
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
                        )
                        .toList(),
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
                                child: p.Text(
                                    "${intl.iNDIVIDUALDEVELOPMENTPLAN16}",
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
                    children: tECHNICALTACTICALList.entries.map((entry) {
                      return p.Row(
                        children: [
                          p.SizedBox(
                            width: 200,
                            child: p.Text("${entry.key}",
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
                            width: 200,
                            child: p.Text(tECHNICALTACTICALList[entry.key],
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
                                child: p.Text(
                                    "${intl.iNDIVIDUALDEVELOPMENTPLAN26}",
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
                    children: tACTICALList.entries.map((entry) {
                      return p.Row(
                        children: [
                          p.SizedBox(
                            width: 200,
                            child: p.Text("${entry.key}",
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
                            width: 200,
                            child: p.Text(tACTICALList[entry.key],
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
                                child: p.Text(
                                    "${intl.iNDIVIDUALDEVELOPMENTPLAN36}",
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
                    children: sOCIALList.entries.map((entry) {
                      return p.Row(
                        children: [
                          p.SizedBox(
                            width: 200,
                            child: p.Text("${entry.key}",
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
                            width: 200,
                            child: p.Text(sOCIALList[entry.key],
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
                                child: p.Text(
                                    "${intl.iNDIVIDUALDEVELOPMENTPLAN46}",
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
                    children: pSYCHOLOGICALList.entries.map((entry) {
                      return p.Row(
                        children: [
                          p.SizedBox(
                            width: 200,
                            child: p.Text("${entry.key}",
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
                            width: 200,
                            child: p.Text(pSYCHOLOGICALList[entry.key],
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
                      );
                    }).toList(),
                  ),
                  p.SizedBox(height: 10),
                  p.Column(
                    children: titleList
                        .map(
                          (item) => p.Column(
                            children: [
                              p.SizedBox(height: 10),
                              p.SizedBox(
                                width: 500,
                                child: p.Text(item,
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
                                child: p.Text(titleControllerList[item].text,
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
                        )
                        .toList(),
                  ),
                ],
              ),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "${intl.iNDIVIDUALDEVELOPMENTPLANList}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.iNDIVIDUALDEVELOPMENTPLAN16}")),
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
                              child:
                                  Text("${intl.iNDIVIDUALDEVELOPMENTPLAN16}"))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: tECHNICALTACTICALList.entries.map((entry) {
                  return Column(
                    children: [
                      Dimensions.verticalSpacingExtraLarge,
                      RadioWidgetList(
                        onChanged: (value) {
                          setState(() {
                            tECHNICALTACTICALList[entry.key] = value;
                          });
                        },
                        selectedValue: entry.value,
                        orientation: Axis.horizontal,
                        title: "${entry.key}",
                        values: [
                          "1",
                          "2",
                          "3",
                          "4",
                          "5",
                        ],
                      ),
                    ],
                  );
                }).toList(),
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
                              child:
                                  Text("${intl.iNDIVIDUALDEVELOPMENTPLAN26}"))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: tACTICALList.entries.map((entry) {
                  return Column(
                    children: [
                      Dimensions.verticalSpacingExtraLarge,
                      RadioWidgetList(
                        onChanged: (value) {
                          setState(() {
                            tACTICALList[entry.key] = value;
                          });
                        },
                        selectedValue: entry.value,
                        orientation: Axis.horizontal,
                        title: "${entry.key}",
                        values: [
                          "1",
                          "2",
                          "3",
                          "4",
                          "5",
                        ],
                      ),
                    ],
                  );
                }).toList(),
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
                              child:
                                  Text("${intl.iNDIVIDUALDEVELOPMENTPLAN36}"))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: sOCIALList.entries.map((entry) {
                  return Column(
                    children: [
                      Dimensions.verticalSpacingExtraLarge,
                      RadioWidgetList(
                        onChanged: (value) {
                          setState(() {
                            sOCIALList[entry.key] = value;
                          });
                        },
                        selectedValue: entry.value,
                        orientation: Axis.horizontal,
                        title: "${entry.key}",
                        values: [
                          "1",
                          "2",
                          "3",
                          "4",
                          "5",
                        ],
                      ),
                    ],
                  );
                }).toList(),
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
                              child:
                                  Text("${intl.iNDIVIDUALDEVELOPMENTPLAN46}"))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: pSYCHOLOGICALList.entries.map((entry) {
                  return Column(
                    children: [
                      Dimensions.verticalSpacingExtraLarge,
                      RadioWidgetList(
                        onChanged: (value) {
                          setState(() {
                            pSYCHOLOGICALList[entry.key] = value;
                          });
                        },
                        selectedValue: entry.value,
                        orientation: Axis.horizontal,
                        title: "${entry.key}",
                        values: [
                          "1",
                          "2",
                          "3",
                          "4",
                          "5",
                        ],
                      ),
                    ],
                  );
                }).toList(),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: titleList
                    .map(
                      (item) => Column(
                        children: [
                          Dimensions.verticalSpacingExtraLarge,
                          Text(
                            item,
                            style: TextStyle(
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          TextField(
                            keyboardType: TextInputType.multiline,
                            controller: titleControllerList[item],
                            decoration: const InputDecoration(),
                            autofocus: false,
                            maxLines: null,
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
