import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:pedagogue/feature/espqceEPS/ficheDePresence/save_file_mobile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';

class KeyFactorsCreateSpacing extends StatefulWidget {
  final Map<String, dynamic> titleShootingList;
  final Map<String, dynamic> shootingControllerList;
  final TextEditingController joueurController;
  final TextEditingController dateController;
  final TextEditingController team1Controller;
  final TextEditingController ageController;
  final TextEditingController coachController;
  final TextEditingController footController;
  final Map<String, String> titleListPositions;
  final Map<String, dynamic> titleListPassing;
  final Map<String, dynamic> passingControllerList;
  const KeyFactorsCreateSpacing(
      {super.key,
      required this.titleShootingList,
      required this.shootingControllerList,
      required this.joueurController,
      required this.dateController,
      required this.team1Controller,
      required this.ageController,
      required this.coachController,
      required this.footController,
      required this.titleListPositions,
      required this.titleListPassing,
      required this.passingControllerList});

  @override
  State<KeyFactorsCreateSpacing> createState() =>
      _KeyFactorsCreateSpacingState();
}

class _KeyFactorsCreateSpacingState extends State<KeyFactorsCreateSpacing> {
  Map<String, dynamic> titleList = {};
  Map<String, String> individuallyList = {
    "title1": "${intl.keyfactorsCreatingSpace2}",
    "title2": "${intl.keyfactorsCreatingSpace3}",
    "title3": "${intl.keyfactorsCreatingSpace4}",
  };
  Map<String, String> asTeamList = {
    "title1": "${intl.keyfactorsCreatingSpace6}",
    "title2": "${intl.keyfactorsCreatingSpace7}",
  };
  Map<String, dynamic> spaceControllerList = {
    "${intl.keyfactorsCreatingSpace2}you": TextEditingController(),
    "${intl.keyfactorsCreatingSpace3}you": TextEditingController(),
    "${intl.keyfactorsCreatingSpace4}you": TextEditingController(),
    "${intl.keyfactorsCreatingSpace6}you": TextEditingController(),
    "${intl.keyfactorsCreatingSpace7}you": TextEditingController(),
    "${intl.keyfactorsCreatingSpace2}coach": TextEditingController(),
    "${intl.keyfactorsCreatingSpace3}coach": TextEditingController(),
    "${intl.keyfactorsCreatingSpace4}coach": TextEditingController(),
    "${intl.keyfactorsCreatingSpace6}coach": TextEditingController(),
    "${intl.keyfactorsCreatingSpace7}coach": TextEditingController(),
  };

  @override
  void initState() {
    super.initState();
    titleList = {
      "${intl.keyfactorsCreatingSpace1}": individuallyList,
      "${intl.keyfactorsCreatingSpace5}": asTeamList,
    };
  }

  TextEditingController comment = TextEditingController();
  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  TextEditingController input3 = TextEditingController();
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
                            child: p.Text(intl.keyfactorsMainList,
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
                      child: p.Text(widget.joueurController.text,
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
                      child: p.Text(widget.dateController.text,
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
                      child: p.Text(intl.team,
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
                      child: p.Text(widget.team1Controller.text,
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
                      child: p.Text(intl.age,
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
                      child: p.Text(widget.ageController.text,
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
                      child: p.Text(intl.coach,
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
                      child: p.Text(widget.coachController.text,
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
                      child: p.Text(intl.keyfactorsMain1,
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
                      child: p.Text(widget.footController.text,
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
                            child: p.Text(intl.keyfactorsPositionsList,
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
                child: p.Text("1:${intl.keyfactorsPositions9}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf,
                        color: PdfColors.deepOrange800,
                        fontSize: 15)),
              ),
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text(
                    "1:${intl.keyfactorsPositions10}\n2:${intl.keyfactorsPositions11}\n3:${intl.keyfactorsPositions12}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf,
                        color: PdfColors.deepOrange800,
                        fontSize: 15)),
              ),
              p.Column(
                children: widget.titleListPositions.entries.map((entry) {
                  return p.Column(
                    children: [
                      p.SizedBox(height: 10),
                      p.Row(
                          mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                          children: [
                            p.SizedBox(
                              width: 200,
                              child: p.Text(entry.key,
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
                              child: p.Text(entry.value,
                                  textAlign: p.TextAlign.center,
                                  textDirection: langue == "ar"
                                      ? p.TextDirection.rtl
                                      : p.TextDirection.ltr,
                                  style: p.TextStyle(
                                      font: ttf,
                                      color: PdfColors.black,
                                      fontSize: 15)),
                            )
                          ]),
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
                            child: p.Text(intl.keyfactorsPassingList,
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
              p.SizedBox(height: 10),
            ];
          }),
    );
    pdf.addPage(
      p.MultiPage(
          maxPages: 200,
          pageFormat: PdfPageFormat.a4,
          build: (p.Context context) {
            return <p.Widget>[
              p.SizedBox(height: 10),
              p.Column(
                children: widget.titleListPassing.entries.map((entry) {
                  Map<String, dynamic> list = entry.value;
                  return p.Column(
                    children: [
                      p.SizedBox(height: 10),
                      p.Container(
                          color: PdfColors.amber,
                          //height: 50,
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
                      p.SizedBox(
                        width: 500,
                        height: 200,
                        child: p.Column(
                          children: list.entries.map((entry) {
                            return p.Column(
                              children: [
                                p.SizedBox(height: 10),
                                p.SizedBox(
                                  width: 500,
                                  child: p.Text(entry.value,
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.deepOrange800,
                                          fontSize: 15)),
                                ),
                                p.SizedBox(height: 10),
                                p.SizedBox(
                                  width: 500,
                                  child: p.Text("${intl.keyfactorsPassing25} :",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15)),
                                ),
                                p.SizedBox(
                                  width: 500,
                                  child: p.Text(
                                      widget
                                          .passingControllerList[
                                              "${entry.value}you"]
                                          .text,
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15)),
                                ),
                                p.SizedBox(height: 10),
                                p.SizedBox(
                                  width: 500,
                                  child: p.Text("${intl.keyfactorsPassing26} :",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15)),
                                ),
                                p.SizedBox(
                                  width: 500,
                                  child: p.Text(
                                      widget
                                          .passingControllerList[
                                              "${entry.value}coach"]
                                          .text,
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15)),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ];
          }),
    );
    pdf.addPage(
      p.MultiPage(
          maxPages: 200,
          pageFormat: PdfPageFormat.a4,
          build: (p.Context context) {
            return <p.Widget>[
              p.SizedBox(height: 10),
              p.Column(
                children: widget.titleShootingList.entries.map((entry) {
                  Map<String, dynamic> list = entry.value;
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
                      p.SizedBox(
                        width: 500,
                        //  height: 500,
                        child: p.Column(
                          children: list.entries.map((entry) {
                            return p.Column(
                              children: [
                                p.SizedBox(height: 10),
                                p.SizedBox(
                                  width: 500,
                                  child: p.Text(entry.value,
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.deepOrange800,
                                          fontSize: 15)),
                                ),
                                p.SizedBox(height: 10),
                                p.SizedBox(
                                  width: 500,
                                  child: p.Text("${intl.keyfactorsPassing25} :",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15)),
                                ),
                                p.SizedBox(
                                  width: 500,
                                  child: p.Text(
                                      widget
                                          .shootingControllerList[
                                              "${entry.value}you"]
                                          .text,
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15)),
                                ),
                                p.SizedBox(height: 10),
                                p.SizedBox(
                                  width: 500,
                                  child: p.Text("${intl.keyfactorsPassing26} :",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15)),
                                ),
                                p.SizedBox(
                                  width: 500,
                                  child: p.Text(
                                      widget
                                          .shootingControllerList[
                                              "${entry.value}coach"]
                                          .text,
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15)),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ];
          }),
    );
    pdf.addPage(
      p.MultiPage(
          maxPages: 200,
          pageFormat: PdfPageFormat.a4,
          build: (p.Context context) {
            return <p.Widget>[
              p.SizedBox(height: 10),
              p.Column(
                children: titleList.entries.map((entry) {
                  Map<String, dynamic> list = entry.value;
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
                      p.SizedBox(
                        width: 500,
                        //  height: 500,
                        child: p.Column(
                          children: list.entries.map((entry) {
                            return p.Column(
                              children: [
                                p.SizedBox(height: 10),
                                p.SizedBox(
                                  width: 500,
                                  child: p.Text(entry.value,
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.deepOrange800,
                                          fontSize: 15)),
                                ),
                                p.SizedBox(height: 10),
                                p.SizedBox(
                                  width: 500,
                                  child: p.Text("${intl.keyfactorsPassing25} :",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15)),
                                ),
                                p.SizedBox(
                                  width: 500,
                                  child: p.Text(
                                      spaceControllerList["${entry.value}you"]
                                          .text,
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15)),
                                ),
                                p.SizedBox(height: 10),
                                p.SizedBox(
                                  width: 500,
                                  child: p.Text("${intl.keyfactorsPassing26} :",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15)),
                                ),
                                p.SizedBox(
                                  width: 500,
                                  child: p.Text(
                                      spaceControllerList["${entry.value}coach"]
                                          .text,
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15)),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text(intl.keyfactorsCreatingSpace8,
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf,
                        color: PdfColors.black,
                        fontWeight: p.FontWeight.bold,
                        fontSize: 15)),
              ),
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text(comment.text,
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf,
                        color: PdfColors.black,
                        fontWeight: p.FontWeight.bold,
                        fontSize: 15)),
              ),
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text("1 :${input1.text}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf,
                        color: PdfColors.black,
                        fontWeight: p.FontWeight.bold,
                        fontSize: 15)),
              ),
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text("2 :${input2.text}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf,
                        color: PdfColors.black,
                        fontWeight: p.FontWeight.bold,
                        fontSize: 15)),
              ),
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text("3 :${input3.text}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf,
                        color: PdfColors.black,
                        fontWeight: p.FontWeight.bold,
                        fontSize: 15)),
              ),
              p.SizedBox(height: 10),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "${intl.keyfactorsMainList}.pdf");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.keyfactorsCreatingSpaceList}")),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: titleList.entries.map((entry) {
                  Map<String, dynamic> list = entry.value;
                  return Column(
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
                              SizedBox(child: Center(child: Text(entry.key))),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: list.entries.map((entry) {
                          return Column(
                            children: [
                              Dimensions.verticalSpacingExtraLarge,
                              Text(
                                entry.value,
                                style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: CustomInput(
                                        controller: spaceControllerList[
                                            "${entry.value}you"],
                                        hint: "${intl.yOURRATING}",
                                        title: "${intl.yOURRATING}",
                                        inputType: InputType.text,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: CustomInput(
                                        controller: spaceControllerList[
                                            "${entry.value}coach"],
                                        hint: "${intl.cOACHRATING}",
                                        title: "${intl.cOACHRATING}",
                                        inputType: InputType.text,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  );
                }).toList(),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: [
                  Text(
                    "${intl.keyfactorsCreatingSpace8}",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    keyboardType: TextInputType.multiline,
                    controller: comment,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                    minLines: 3,
                  ),
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomInput(
                        controller: input1,
                        hint: "1",
                        title: "1",
                        inputType: InputType.text,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomInput(
                        controller: input2,
                        hint: "2",
                        title: "2",
                        inputType: InputType.text,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomInput(
                        controller: input3,
                        hint: "3",
                        title: "3",
                        inputType: InputType.text,
                      ),
                    ),
                  ],
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
