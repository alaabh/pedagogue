import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:pedagogue/feature/espqceEPS/ficheDePresence/save_file_mobile.dart';
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/team_controller.dart';
import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../home/tabs/home/statistics_game_live/widgets/image_picker_element_widget.dart';

class SessionPlan6 extends StatefulWidget {
  const SessionPlan6({super.key});

  @override
  State<SessionPlan6> createState() => _SessionPlan6State();
}

class _SessionPlan6State extends State<SessionPlan6> {
  XFile? selectedImage1Path;
  TeamController teamController = TeamController();

  bool teamLoader = false;

  List<String>? teamList = [];
  Future<void> loadData() async {
    await teamController.getAll();

    setState(() {
      for (var element in teamController.apiResponse.value.itemList) {
        // print(element.name);
        teamList!.add(element.name.toString());
      }
    });

    teamLoader = true;
  }

  final TextEditingController _Team = TextEditingController();
  final TextEditingController coachController = TextEditingController();
  final TextEditingController assistantController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController sessionNumberController = TextEditingController();
  final TextEditingController blockNoController = TextEditingController();
  final TextEditingController sessionDurationController =
      TextEditingController();
  final TextEditingController equipementController = TextEditingController();
  final TextEditingController diagramController1 = TextEditingController();
  final TextEditingController diagramController2 = TextEditingController();
  final TextEditingController diagramController3 = TextEditingController();
  final TextEditingController descriptionController1 = TextEditingController();
  final TextEditingController descriptionController2 = TextEditingController();
  final TextEditingController descriptionController3 = TextEditingController();
  final TextEditingController goalsController = TextEditingController();
  final TextEditingController bibsController = TextEditingController();
  final TextEditingController conesController = TextEditingController();
  final TextEditingController ballController = TextEditingController();
  final TextEditingController otherController = TextEditingController();
  final TextEditingController kkeyController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController technicalController = TextEditingController();
  final TextEditingController tacticalController = TextEditingController();
  final TextEditingController physicalController = TextEditingController();
  final TextEditingController psyController = TextEditingController();
  final TextEditingController socialController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Map<String, dynamic> attendanceList = {
    "1": TextEditingController(),
    "2": TextEditingController(),
    "3": TextEditingController(),
    "4": TextEditingController(),
    "5": TextEditingController(),
    "6": TextEditingController(),
    "7": TextEditingController(),
    "8": TextEditingController(),
    "9": TextEditingController(),
    "10": TextEditingController(),
    "11": TextEditingController(),
    "12": TextEditingController(),
    "13": TextEditingController(),
    "14": TextEditingController(),
    "15": TextEditingController(),
    "16": TextEditingController(),
  };
  Map<String, dynamic> _days = {
    "M": TextEditingController(),
    "Tu": TextEditingController(),
    "W": TextEditingController(),
    "Th": TextEditingController(),
    "F": TextEditingController(),
    "S": TextEditingController(),
    "Su": TextEditingController(),
  };
  Map<String, dynamic> _MD = {
    "MD+1": TextEditingController(),
    "MD+2": TextEditingController(),
    "MD+3": TextEditingController(),
    "MD-3": TextEditingController(),
    "MD-2": TextEditingController(),
    "MD-1": TextEditingController(),
  };

  Future<void> _generatePDF() async {
    final font = await rootBundle.load("assets/JannaLT-Regular.ttf");
    final ttf = p.Font.ttf(font);
    final pdf = p.Document();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langue = prefs.getString('SAVED_LOCALIZATION');
    print(langue);
    final netImage1 = await networkImage(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVSL1CKoVN8xIj_yy6orfT7usogVPuvyszqw&usqp=CAU");
    final netImage2 = await networkImage(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVSL1CKoVN8xIj_yy6orfT7usogVPuvyszqw&usqp=CAU");
    final netImage3 = await networkImage(
        "https://www.mobile.sportspedagogue.com/1_${intl.imgLang}.png");
    pdf.addPage(
      p.MultiPage(
          maxPages: 200,
          pageFormat: PdfPageFormat.a4,
          build: (p.Context context) {
            return <p.Widget>[
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
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 200,
                      child: p.Text(_Team.text,
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
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 200,
                      child: p.Text(coachController.text,
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
                      child: p.Text(intl.sessionPlan61,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 200,
                      child: p.Text(assistantController.text,
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
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 200,
                      child: p.Text(dateController.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.Column(
                children: _days.entries
                    .map(
                      (item) => p.Row(
                          mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                          children: [
                            p.SizedBox(
                              width: 200,
                              child: p.Text(item.key,
                                  textAlign: p.TextAlign.center,
                                  textDirection: langue == "ar"
                                      ? p.TextDirection.rtl
                                      : p.TextDirection.ltr,
                                  style: p.TextStyle(
                                      font: ttf,
                                      color: PdfColors.amber,
                                      fontSize: 15,
                                      fontWeight: p.FontWeight.bold)),
                            ),
                            p.SizedBox(
                              width: 200,
                              child: p.Text(item.value.text,
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
                    )
                    .toList(),
              ),
              p.SizedBox(height: 10),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text(intl.sessionPlan62,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 500,
                      child: p.Text(sessionNumberController.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text(intl.sessionPlan63,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 500,
                      child: p.Text(blockNoController.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text(intl.sessionPlan64,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 500,
                      child: p.Text(sessionDurationController.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.Column(
                children: _MD.entries
                    .map(
                      (item) => p.Row(
                          mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                          children: [
                            p.SizedBox(
                              width: 200,
                              child: p.Text(item.key,
                                  textAlign: p.TextAlign.center,
                                  textDirection: langue == "ar"
                                      ? p.TextDirection.rtl
                                      : p.TextDirection.ltr,
                                  style: p.TextStyle(
                                      font: ttf,
                                      color: PdfColors.amber,
                                      fontSize: 15,
                                      fontWeight: p.FontWeight.bold)),
                            ),
                            p.SizedBox(
                              width: 200,
                              child: p.Text(item.value.text,
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
                    )
                    .toList(),
              ),
              p.SizedBox(height: 10),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text(intl.sessionPlan65,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 500,
                      child: p.Text(equipementController.text,
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
                            child: p.Text(intl.sessionPlan66,
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
                children: attendanceList.entries
                    .map(
                      (item) => p.Column(
                          mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                          children: [
                            p.SizedBox(
                              width: 500,
                              child: p.Text(item.key,
                                  textAlign: p.TextAlign.center,
                                  textDirection: langue == "ar"
                                      ? p.TextDirection.rtl
                                      : p.TextDirection.ltr,
                                  style: p.TextStyle(
                                      font: ttf,
                                      color: PdfColors.amber,
                                      fontSize: 15,
                                      fontWeight: p.FontWeight.bold)),
                            ),
                            p.SizedBox(
                              width: 500,
                              child: p.Text(item.value.text,
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
                            child: p.Text(intl.sessionPlan67,
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
                child: p.Text(diagramController1.text,
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
                child: p.Text(diagramController2.text,
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
                child: p.Text(diagramController3.text,
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
                            child: p.Text(intl.sessionPlan68,
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
                child: p.Text(descriptionController1.text,
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
                child: p.Text(descriptionController2.text,
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
                child: p.Text(descriptionController3.text,
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
                            child: p.Text(intl.sessionPlan69,
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
              selectedImage1Path == null
                  ? p.Container()
                  : p.Image(
                      p.MemoryImage(
                          File(selectedImage1Path!.path).readAsBytesSync()),
                      width: 500,
                      height: 200),
              p.SizedBox(height: 10),
              p.Container(
                padding: p.EdgeInsets.only(top: 10),
                // width: 600,
                height: 150,
                decoration: p.BoxDecoration(
                    border: p.Border.all(color: PdfColors.amber)),
                child: p.Row(
                  children: [
                    p.SizedBox(width: 10),
                    p.Image(
                        width: 100,
                        height: 50,
                        p.MemoryImage(
                          base64Decode(
                              "data:image/png;base64,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"
                                  .split(',')
                                  .last),
                        )),
                    p.Container(
                      width: 60,
                      height: 50,
                      decoration: p.BoxDecoration(color: PdfColors.black),
                      child: p.Center(
                        child: p.Text(
                          "${intl.sessionPlan45}",
                          style: p.TextStyle(color: PdfColors.white),
                        ),
                      ),
                    ),
                    p.SizedBox(width: 10),
                    p.Column(
                      children: [
                        p.Image(
                            width: 80,
                            height: 50,
                            p.MemoryImage(
                              base64Decode(
                                  "data:image/png;base64,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"
                                      .split(',')
                                      .last),
                            )),
                        p.Container(
                          width: 80,
                          height: 50,
                          decoration: p.BoxDecoration(color: PdfColors.black),
                          child: p.Center(
                            child: p.Text(
                              "${intl.sessionPlan46}",
                              style: p.TextStyle(color: PdfColors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    p.Image(
                      netImage1,
                      width: 100,
                      height: 50,
                    ),
                    p.Container(
                      width: 80,
                      height: 50,
                      decoration: p.BoxDecoration(color: PdfColors.black),
                      child: p.Center(
                        child: p.Text(
                          "${intl.sessionPlan47}",
                          style: p.TextStyle(color: PdfColors.white),
                        ),
                      ),
                    ),
                    p.Image(
                      netImage2,
                      width: 100,
                      height: 50,
                    ),
                    p.Container(
                      width: 80,
                      height: 50,
                      decoration: p.BoxDecoration(color: PdfColors.black),
                      child: p.Center(
                        child: p.Text(
                          "${intl.sessionPlan48}",
                          style: p.TextStyle(color: PdfColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              p.SizedBox(height: 20),
              p.Container(
                padding: p.EdgeInsets.only(top: 10),
                // width: 600,
                height: 150,
                decoration: p.BoxDecoration(
                    border: p.Border.all(color: PdfColors.amber)),
                child: p.Row(
                  children: [
                    p.SizedBox(width: 10),
                    p.Image(
                        width: 100,
                        height: 50,
                        p.MemoryImage(
                          base64Decode(
                              "data:image/png;base64,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"
                                  .split(',')
                                  .last),
                        )),
                    p.Container(
                      width: 60,
                      height: 50,
                      decoration: p.BoxDecoration(color: PdfColors.black),
                      child: p.Center(
                        child: p.Text(
                          "${intl.sessionPlan49}",
                          style: p.TextStyle(color: PdfColors.white),
                        ),
                      ),
                    ),
                    p.SizedBox(width: 10),
                    p.Image(
                        width: 100,
                        height: 50,
                        p.MemoryImage(
                          base64Decode(
                              "data:image/png;base64,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"
                                  .split(',')
                                  .last),
                        )),
                    p.Container(
                      width: 80,
                      height: 50,
                      decoration: p.BoxDecoration(color: PdfColors.black),
                      child: p.Center(
                        child: p.Text(
                          "${intl.sessionPlan410}",
                          style: p.TextStyle(color: PdfColors.white),
                        ),
                      ),
                    ),
                    p.Image(
                        width: 80,
                        height: 50,
                        p.MemoryImage(
                          base64Decode(
                              "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAALkAAACUCAMAAAD4QXiGAAAAYFBMVEX///8AAAAqKir8/PwdHR3t7e0WFhYLCwvMzMzY2NgtLS3g4OCvr6+IiIhYWFjq6upQUFCRkZHBwcH19fWCgoI8PDyhoaG5ubnS0tI0NDRERERxcXF4eHhfX19mZmabm5tAe5WVAAAEbElEQVR4nO2c63qiMBCGRZBTEETEKJ7u/y7XTLAmmaElbR+h63w/tt0vTPKWQ8iEwGLBYrFYLBaLxWKNVBg2ngpRFd8u+KQRFGOrSeW+Xnuqlnath0cN9dauXT4KbpkV0Wy/brPey7QZ5F4Vpyj4jgoLfPksSC3wp58fzB1ejGslOhUrGjwtv4V919KspjYKzmZBZxTsjZ2+uo5uqLR2xUP773IHQTdEvjMLNkaBeZRWJ4+m9p+AJ7GvjuaxX1TXj4JNZRZk7cOPrsIs2LZktZaSQXQZgx/tboW3hF3VSva+rOwCUQwUZCMauZ31NRhLp1J9Ep4Ow9fv1GoO+qzqrB0V3sCs58ut1OhL6GZ2qQLOlfqL3n5yhYAemzsdutqNGAyZiwT0T+aZDmdQPRnQeMFON+8S6rYXkb38zJSqDuZoGKq3XA7cWmelldrHyfP/YeCQN+mpjVzFQYI80P14kYqD2C8gIQLakznSAvIgHCQ/jB9JvELXw1jytJ2WFKlNx5GH+bSchPJwFLm+U6EzDlzybL6LugKST3zyCiBb0OOpehQ5bHrZClsVxKTCVQUDh3OFClI1FOqIgLMKuBEBQOH6W501jCEXsE9wF5nT9gIymjX24X5H3ZfXKqDA/grOC2RXcEzFCPJUkW9wxUBeYf/XyCuaHDKSJB1LfpkR+cWLvJwRecnkTM7kTM7kTP6XyNFcvB61V3hKHsh3eO4+A/IMB+yAHAdoctywH3m+3rmCgfIZ2WsYhXZ4+7NqZEkEwERgSQQoP8bb517kcxOTv14e5HjuPaBtPSdPPS74rQA/8m6LBAlugX3oKq7YL9TcR0sEwGTOjghQfoT9zot8KCeaIA/lnIjJmZzJmZzJmZzJmZzJ357cY3wuB8gr1WJJ/KlALrH/O+PzTsqigFVNH0ubIKaQT0f/JnVOJJ9O/88ecqK9tO37D50TycKpScLBW8rCrklKv5xobmLy1+sdyI+32hXMe6yRXatLP9jg7Xcwr7hD/g3WYl1wRdDnxHj7oxd5uQgd9f25a4dh358jv+/Pkd/357iivj9H27/LnYjJmZzJmZzJmZzJmZzJmXyI/A8/VUQLfvWK4gz78NoaXlFc9SuKcQGsqdhjPwMK7Pvt8+hSuoL0dIPsEpbZ59jfqIfWEREAB68lApSfIPsSeZHPTUz+eo0nT45IUEOOfViDEWM/h3qIAJj+iIgAaAH7iRd5KURmS/RvK7i20G8ruH4mYHVHt8UF+m0F3IB+WwE38Db9+QD5/O+hTM7kTM7kTM7kTP5u5EMjLuLDF7/23L8ZIPcbcUU4TfTOQ9U4PP55HlpyHjqNmPz1Gk++qdz08a70QJjKT2n/sPUNoPzqx29wT6Yf56GT6cf30MnE5K8Xk79e/zN5BUuoZksOcBVFnrRaMN08N/Lg2NMlBLml2ZFbMr6P98fIjcKjW0ZkZ5Np7cKZX28Tx6Wl65w+tNhcbbjW/jSk9ZCDSHsnlTXkFnP/CiSLxWKxWCyWo38attd9jx6lZwAAAABJRU5ErkJggg=="
                                  .split(',')
                                  .last),
                        )),
                    p.Container(
                      width: 80,
                      height: 50,
                      decoration: p.BoxDecoration(color: PdfColors.black),
                      child: p.Center(
                        child: p.Text(
                          "${intl.sessionPlan411}",
                          style: p.TextStyle(color: PdfColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              p.SizedBox(height: 10),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text(intl.sessionPlan616,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 500,
                      child: p.Text(goalsController.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text(intl.sessionPlan617,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 500,
                      child: p.Text(bibsController.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text(intl.sessionPlan615,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 500,
                      child: p.Text(conesController.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text(intl.sessionPlan614,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 500,
                      child: p.Text(ballController.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text(intl.sessionPlan618,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 500,
                      child: p.Text(otherController.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text("K${intl.sessionPlan619}",
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 500,
                      child: p.Text(kkeyController.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text("${intl.sessionPlan620}",
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 500,
                      child: p.Text(descriptionController.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text("${intl.sessionPlan621}",
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 500,
                      child: p.Text(technicalController.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text("${intl.sessionPlan622}",
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 500,
                      child: p.Text(tacticalController.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text("${intl.sessionPlan623}",
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 500,
                      child: p.Text(physicalController.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text("${intl.sessionPlan624}",
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 500,
                      child: p.Text(psyController.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text("${intl.sessionPlan625}",
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf,
                              color: PdfColors.amber,
                              fontSize: 15,
                              fontWeight: p.FontWeight.bold)),
                    ),
                    p.SizedBox(
                      width: 500,
                      child: p.Text(socialController.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "${intl.sessionPlan6List}.pdf");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.sessionPlan6List}")),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: _Team,
                hint: intl.team,
                title: intl.team,
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: coachController,
                hint: "${intl.coach}",
                title: "${intl.coach}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: assistantController,
                hint: "${intl.sessionPlan61}",
                title: "${intl.sessionPlan61}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: dateController,
                hint: "${intl.date}",
                title: "${intl.date}",
                inputType: InputType.date,
              ),
              Dimensions.verticalSpacingExtraLarge,
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.25,
                child: GridView.count(
                  crossAxisCount: 4,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 5,
                  children: List.generate(
                    _days.length,
                    (index1) => SizedBox(
                      child: CustomInput(
                        controller: _days[_days.keys.elementAt(index1)],
                        hint: _days.keys.elementAt(index1),
                        title: _days.keys.elementAt(index1),
                        inputType: InputType.text,
                      ),
                    ),
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: sessionNumberController,
                hint: "${intl.sessionPlan62}",
                title: "${intl.sessionPlan62}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: blockNoController,
                hint: "${intl.sessionPlan63}",
                title: "${intl.sessionPlan63}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: sessionDurationController,
                hint: "${intl.sessionPlan64}",
                title: "${intl.sessionPlan64}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.3,
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 5,
                  children: List.generate(
                    _MD.length,
                    (index1) => SizedBox(
                      child: CustomInput(
                        controller: _MD[_days.keys.elementAt(index1)],
                        hint: _MD.keys.elementAt(index1),
                        title: _MD.keys.elementAt(index1),
                        inputType: InputType.text,
                      ),
                    ),
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: equipementController,
                hint: "${intl.sessionPlan65}",
                title: "${intl.sessionPlan65}",
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
                              child: Text(
                        "${intl.sessionPlan66}",
                        textAlign: TextAlign.center,
                      ))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: attendanceList.entries
                    .map(
                      (item) => Card(
                        color: AppColors.primaryColor,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: Center(child: Text(item.key))),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: Center(
                                    child: TextField(
                                      keyboardType: TextInputType.multiline,
                                      controller: item.value,
                                      decoration: const InputDecoration(),
                                      autofocus: false,
                                      maxLines: null,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
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
                              child: Text(
                        "${intl.sessionPlan67}",
                        textAlign: TextAlign.center,
                      ))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              TextField(
                keyboardType: TextInputType.multiline,
                controller: diagramController1,
                decoration: const InputDecoration(),
                autofocus: false,
                maxLines: null,
              ),
              Dimensions.verticalSpacingExtraLarge,
              TextField(
                keyboardType: TextInputType.multiline,
                controller: diagramController2,
                decoration: const InputDecoration(),
                autofocus: false,
                maxLines: null,
              ),
              Dimensions.verticalSpacingExtraLarge,
              TextField(
                keyboardType: TextInputType.multiline,
                controller: diagramController3,
                decoration: const InputDecoration(),
                autofocus: false,
                maxLines: null,
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
                              child: Text(
                        "${intl.sessionPlan68}",
                        textAlign: TextAlign.center,
                      ))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              TextField(
                keyboardType: TextInputType.multiline,
                controller: descriptionController1,
                decoration: const InputDecoration(),
                autofocus: false,
                maxLines: null,
              ),
              Dimensions.verticalSpacingExtraLarge,
              TextField(
                keyboardType: TextInputType.multiline,
                controller: descriptionController2,
                decoration: const InputDecoration(),
                autofocus: false,
                maxLines: null,
              ),
              Dimensions.verticalSpacingExtraLarge,
              TextField(
                keyboardType: TextInputType.multiline,
                controller: descriptionController3,
                decoration: const InputDecoration(),
                autofocus: false,
                maxLines: null,
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
                              child: Text(
                        "${intl.sessionPlan69}",
                        textAlign: TextAlign.center,
                      ))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              ImagePickerElementWidget(
                commentVisibility: 0,
                title: "",
                titleBackgroundColor: AppColors.primaryLightColor,
                onImagePicked: (imagePath) => selectedImage1Path = imagePath,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Image.memory(
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.height * 0.1,
                        base64Decode(
                            "data:image/png;base64,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"
                                .split(',')
                                .last),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(color: Colors.black),
                        child: Center(
                          child: Text(
                            "${intl.sessionPlan610}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Image.memory(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height * 0.05,
                            base64Decode(
                                "data:image/png;base64,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"
                                    .split(',')
                                    .last),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.22,
                            height: MediaQuery.of(context).size.height * 0.045,
                            decoration: BoxDecoration(color: Colors.black),
                            child: Center(
                              child: Text(
                                "${intl.sessionPlan611}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVSL1CKoVN8xIj_yy6orfT7usogVPuvyszqw&usqp=CAU",
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(color: Colors.black),
                        child: Center(
                          child: Text(
                            "${intl.sessionPlan612}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVSL1CKoVN8xIj_yy6orfT7usogVPuvyszqw&usqp=CAU",
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(color: Colors.black),
                        child: Center(
                          child: Text(
                            "${intl.sessionPlan613}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.memory(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.height * 0.1,
                      base64Decode(
                          "data:image/png;base64,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"
                              .split(',')
                              .last),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(color: Colors.black),
                      child: Center(
                        child: Text(
                          "${intl.sessionPlan614}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Image.memory(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.height * 0.1,
                      base64Decode(
                          "data:image/png;base64,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"
                              .split(',')
                              .last),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(color: Colors.black),
                      child: Center(
                        child: Text(
                          "${intl.sessionPlan615}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Image.memory(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.height * 0.1,
                      base64Decode(
                          "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAALkAAACUCAMAAAD4QXiGAAAAYFBMVEX///8AAAAqKir8/PwdHR3t7e0WFhYLCwvMzMzY2NgtLS3g4OCvr6+IiIhYWFjq6upQUFCRkZHBwcH19fWCgoI8PDyhoaG5ubnS0tI0NDRERERxcXF4eHhfX19mZmabm5tAe5WVAAAEbElEQVR4nO2c63qiMBCGRZBTEETEKJ7u/y7XTLAmmaElbR+h63w/tt0vTPKWQ8iEwGLBYrFYLBaLxWKNVBg2ngpRFd8u+KQRFGOrSeW+Xnuqlnath0cN9dauXT4KbpkV0Wy/brPey7QZ5F4Vpyj4jgoLfPksSC3wp58fzB1ejGslOhUrGjwtv4V919KspjYKzmZBZxTsjZ2+uo5uqLR2xUP773IHQTdEvjMLNkaBeZRWJ4+m9p+AJ7GvjuaxX1TXj4JNZRZk7cOPrsIs2LZktZaSQXQZgx/tboW3hF3VSva+rOwCUQwUZCMauZ31NRhLp1J9Ep4Ow9fv1GoO+qzqrB0V3sCs58ut1OhL6GZ2qQLOlfqL3n5yhYAemzsdutqNGAyZiwT0T+aZDmdQPRnQeMFON+8S6rYXkb38zJSqDuZoGKq3XA7cWmelldrHyfP/YeCQN+mpjVzFQYI80P14kYqD2C8gIQLakznSAvIgHCQ/jB9JvELXw1jytJ2WFKlNx5GH+bSchPJwFLm+U6EzDlzybL6LugKST3zyCiBb0OOpehQ5bHrZClsVxKTCVQUDh3OFClI1FOqIgLMKuBEBQOH6W501jCEXsE9wF5nT9gIymjX24X5H3ZfXKqDA/grOC2RXcEzFCPJUkW9wxUBeYf/XyCuaHDKSJB1LfpkR+cWLvJwRecnkTM7kTM7kTP6XyNFcvB61V3hKHsh3eO4+A/IMB+yAHAdoctywH3m+3rmCgfIZ2WsYhXZ4+7NqZEkEwERgSQQoP8bb517kcxOTv14e5HjuPaBtPSdPPS74rQA/8m6LBAlugX3oKq7YL9TcR0sEwGTOjghQfoT9zot8KCeaIA/lnIjJmZzJmZzJmZzJmZzJ357cY3wuB8gr1WJJ/KlALrH/O+PzTsqigFVNH0ubIKaQT0f/JnVOJJ9O/88ecqK9tO37D50TycKpScLBW8rCrklKv5xobmLy1+sdyI+32hXMe6yRXatLP9jg7Xcwr7hD/g3WYl1wRdDnxHj7oxd5uQgd9f25a4dh358jv+/Pkd/357iivj9H27/LnYjJmZzJmZzJmZzJmZzJmXyI/A8/VUQLfvWK4gz78NoaXlFc9SuKcQGsqdhjPwMK7Pvt8+hSuoL0dIPsEpbZ59jfqIfWEREAB68lApSfIPsSeZHPTUz+eo0nT45IUEOOfViDEWM/h3qIAJj+iIgAaAH7iRd5KURmS/RvK7i20G8ruH4mYHVHt8UF+m0F3IB+WwE38Db9+QD5/O+hTM7kTM7kTM7kTP5u5EMjLuLDF7/23L8ZIPcbcUU4TfTOQ9U4PP55HlpyHjqNmPz1Gk++qdz08a70QJjKT2n/sPUNoPzqx29wT6Yf56GT6cf30MnE5K8Xk79e/zN5BUuoZksOcBVFnrRaMN08N/Lg2NMlBLml2ZFbMr6P98fIjcKjW0ZkZ5Np7cKZX28Tx6Wl65w+tNhcbbjW/jSk9ZCDSHsnlTXkFnP/CiSLxWKxWCyWo38attd9jx6lZwAAAABJRU5ErkJggg=="
                              .split(',')
                              .last),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(color: Colors.black),
                      child: Center(
                        child: Text(
                          "${intl.sessionPlan616}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: goalsController,
                hint: "${intl.sessionPlan616}",
                title: "${intl.sessionPlan616}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: bibsController,
                hint: "${intl.sessionPlan617}",
                title: "${intl.sessionPlan617}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: conesController,
                hint: "${intl.sessionPlan615}",
                title: "${intl.sessionPlan615}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: ballController,
                hint: "${intl.sessionPlan614}",
                title: "${intl.sessionPlan614}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: otherController,
                hint: "${intl.sessionPlan618}",
                title: "${intl.sessionPlan618}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: [
                  Dimensions.verticalSpacingExtraLarge,
                  Text(
                    "K${intl.sessionPlan619}",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    keyboardType: TextInputType.multiline,
                    controller: kkeyController,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                  ),
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: [
                  Dimensions.verticalSpacingExtraLarge,
                  Text(
                    "${intl.sessionPlan620}",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    keyboardType: TextInputType.multiline,
                    controller: descriptionController,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                  ),
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: technicalController,
                hint: "${intl.sessionPlan621}",
                title: "${intl.sessionPlan621}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: tacticalController,
                hint: "${intl.sessionPlan622}",
                title: "${intl.sessionPlan622}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: physicalController,
                hint: "${intl.sessionPlan623}",
                title: "${intl.sessionPlan623}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: psyController,
                hint: "${intl.sessionPlan624}",
                title: "${intl.sessionPlan624}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: socialController,
                hint: "${intl.sessionPlan625}",
                title: "${intl.sessionPlan625}",
                inputType: InputType.text,
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
