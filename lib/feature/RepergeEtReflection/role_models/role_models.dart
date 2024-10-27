import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:pedagogue/controller/joueur_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/team_controller.dart';
import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/checkbox_widget_list.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';
import '../../espqceEPS/ficheDePresence/save_file_mobile.dart';

class RoleModels extends StatefulWidget {
  const RoleModels({super.key});

  @override
  State<RoleModels> createState() => _RoleModelsState();
}

class _RoleModelsState extends State<RoleModels> {
  TeamController teamController = TeamController();
  JoueurController joueurController = JoueurController();

  bool teamLoader = false;

  List<String>? joueurList = [];
  List<String>? teamList = [];
  Future<void> loadData() async {
    await teamController.getAll();
    await joueurController.getAll();

    setState(() {
      for (var element in teamController.apiResponse.value.itemList) {
        // print(element.name);
        teamList!.add(element.name.toString());
      }
      for (var element in joueurController.apiResponse.value.itemList) {
        // print(element.name);
        joueurList!.add("${element.firstName} ${element.lastName}");
      }
    });

    teamLoader = true;
  }

  final TextEditingController _Team = TextEditingController();
  final TextEditingController _Joueur = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController name1Controller = TextEditingController();
  final TextEditingController name2Controller = TextEditingController();
  final TextEditingController name3Controller = TextEditingController();
  final TextEditingController personal1Controller = TextEditingController();
  final TextEditingController personal2Controller = TextEditingController();
  final TextEditingController personal3Controller = TextEditingController();
  final TextEditingController attributesController1 = TextEditingController();
  final TextEditingController attributesController2 = TextEditingController();
  final TextEditingController attributesController3 = TextEditingController();
  final TextEditingController attributesController4 = TextEditingController();
  final TextEditingController attributesController5 = TextEditingController();
  final TextEditingController attributesController6 = TextEditingController();
  final TextEditingController attributesController7 = TextEditingController();
  final TextEditingController attributesController8 = TextEditingController();
  final TextEditingController attributesController9 = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  List<String> titleList = [
    "${intl.roleModels5}1",
    "${intl.roleModels5}2",
    "${intl.roleModels5}3",
    "${intl.roleModels5}4",
    "${intl.roleModels5}5",
    "${intl.roleModels5}6",
    "${intl.roleModels5}7",
    "${intl.roleModels5}8",
    "${intl.roleModels5}9",
  ];
  Map<String, dynamic> controllerList1 = {
    "${intl.roleModels5}1": TextEditingController(),
    "${intl.roleModels5}2": TextEditingController(),
    "${intl.roleModels5}3": TextEditingController(),
    "${intl.roleModels5}4": TextEditingController(),
    "${intl.roleModels5}5": TextEditingController(),
    "${intl.roleModels5}6": TextEditingController(),
    "${intl.roleModels5}7": TextEditingController(),
    "${intl.roleModels5}8": TextEditingController(),
    "${intl.roleModels5}9": TextEditingController(),
  };
  Map<String, dynamic> controllerList2 = {
    "${intl.roleModels5}1": TextEditingController(),
    "${intl.roleModels5}2": TextEditingController(),
    "${intl.roleModels5}3": TextEditingController(),
    "${intl.roleModels5}4": TextEditingController(),
    "${intl.roleModels5}5": TextEditingController(),
    "${intl.roleModels5}6": TextEditingController(),
    "${intl.roleModels5}7": TextEditingController(),
    "${intl.roleModels5}8": TextEditingController(),
    "${intl.roleModels5}9": TextEditingController(),
  };
  List<bool> s1List = [
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> s2List = [
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> s3List = [
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> s4List = [
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> s5List = [
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> s6List = [
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> s7List = [
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> s8List = [
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> s9List = [
    false,
    false,
    false,
    false,
    false,
  ];
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
                      child: p.Text(_Joueur.text,
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
                      child: p.Text(ageController.text,
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
                      child: p.Text(intl.name,
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
                      child: p.Text(name1Controller.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 200,
                child: p.Text(intl.roleModels1,
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
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text("S1 :${attributesController1.text}",
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
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text("S2 :${attributesController2.text}",
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
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text("S3 :${attributesController3.text}",
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
              p.SizedBox(height: 10),
              p.Row(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 200,
                      child: p.Text(intl.roleModels2,
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
                      //width: 100,
                      child: p.Text(personal1Controller.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 20),
              p.Center(
                child: p.SizedBox(
                  //width: 100,
                  child: p.Text('S1',
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15)),
                ),
              ),
              p.Row(
                mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                children: s1List.map((item) {
                  return p.Checkbox(value: item, name: 'S1');
                }).toList(),
              ),
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  //width: 100,
                  child: p.Text('S2',
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15)),
                ),
              ),
              p.Row(
                mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                children: s2List.map((item) {
                  return p.Checkbox(value: item, name: 'S1');
                }).toList(),
              ),
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  //width: 100,
                  child: p.Text('S3',
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15)),
                ),
              ),
              p.Row(
                mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                children: s3List.map((item) {
                  return p.Checkbox(value: item, name: 'S1');
                }).toList(),
              ),
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
              p.Row(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 200,
                      child: p.Text(intl.name,
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
                      child: p.Text(name2Controller.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 200,
                child: p.Text(intl.roleModels1,
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
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text("S4 :${attributesController4.text}",
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
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text("S5 :${attributesController5.text}",
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
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text("S6 :${attributesController6.text}",
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
              p.SizedBox(height: 10),
              p.Row(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 200,
                      child: p.Text(intl.roleModels2,
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
                      //width: 100,
                      child: p.Text(personal2Controller.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 20),
              p.Center(
                child: p.SizedBox(
                  //width: 100,
                  child: p.Text('S4',
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15)),
                ),
              ),
              p.Row(
                mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                children: s4List.map((item) {
                  return p.Checkbox(value: item, name: 'S1');
                }).toList(),
              ),
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  //width: 100,
                  child: p.Text('S5',
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15)),
                ),
              ),
              p.Row(
                mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                children: s5List.map((item) {
                  return p.Checkbox(value: item, name: 'S1');
                }).toList(),
              ),
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  //width: 100,
                  child: p.Text('S6',
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15)),
                ),
              ),
              p.Row(
                mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                children: s6List.map((item) {
                  return p.Checkbox(value: item, name: 'S1');
                }).toList(),
              ),
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
              p.Row(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 200,
                      child: p.Text(intl.name,
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
                      child: p.Text(name3Controller.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 200,
                child: p.Text(intl.roleModels1,
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
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text("S7 :${attributesController4.text}",
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
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text("S8 :${attributesController8.text}",
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
              p.SizedBox(height: 10),
              p.SizedBox(
                width: 500,
                child: p.Text("S9 :${attributesController9.text}",
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
              p.SizedBox(height: 10),
              p.Row(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 200,
                      child: p.Text(intl.roleModels2,
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
                      //width: 100,
                      child: p.Text(personal3Controller.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 20),
              p.Center(
                child: p.SizedBox(
                  //width: 100,
                  child: p.Text('S7',
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15)),
                ),
              ),
              p.Row(
                mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                children: s7List.map((item) {
                  return p.Checkbox(value: item, name: 'S1');
                }).toList(),
              ),
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  //width: 100,
                  child: p.Text('S8',
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15)),
                ),
              ),
              p.Row(
                mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                children: s8List.map((item) {
                  return p.Checkbox(value: item, name: 'S1');
                }).toList(),
              ),
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  //width: 100,
                  child: p.Text('S9',
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15)),
                ),
              ),
              p.Row(
                mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                children: s9List.map((item) {
                  return p.Checkbox(value: item, name: 'S1');
                }).toList(),
              ),
              p.SizedBox(height: 10),
              p.Column(
                mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                children: titleList.map((item) {
                  return p.Column(children: [
                    p.Center(
                      child: p.SizedBox(
                        child: p.Text(item,
                            textAlign: p.TextAlign.center,
                            textDirection: langue == "ar"
                                ? p.TextDirection.rtl
                                : p.TextDirection.ltr,
                            style: p.TextStyle(
                                font: ttf,
                                color: PdfColors.amber,
                                fontSize: 15)),
                      ),
                    ),
                    p.SizedBox(height: 10),
                    p.Center(
                      child: p.SizedBox(
                        child: p.Text("${intl.roleModels3}",
                            textAlign: p.TextAlign.center,
                            textDirection: langue == "ar"
                                ? p.TextDirection.rtl
                                : p.TextDirection.ltr,
                            style: p.TextStyle(
                                font: ttf,
                                color: PdfColors.black,
                                fontSize: 15)),
                      ),
                    ),
                    p.SizedBox(height: 10),
                    p.Center(
                      child: p.SizedBox(
                        child: p.Text(controllerList1[item].text,
                            textAlign: p.TextAlign.center,
                            textDirection: langue == "ar"
                                ? p.TextDirection.rtl
                                : p.TextDirection.ltr,
                            style: p.TextStyle(
                                font: ttf,
                                color: PdfColors.black,
                                fontSize: 15)),
                      ),
                    ),
                    p.SizedBox(height: 10),
                    p.Center(
                      child: p.SizedBox(
                        child: p.Text("${intl.roleModels4}",
                            textAlign: p.TextAlign.center,
                            textDirection: langue == "ar"
                                ? p.TextDirection.rtl
                                : p.TextDirection.ltr,
                            style: p.TextStyle(
                                font: ttf,
                                color: PdfColors.black,
                                fontSize: 15)),
                      ),
                    ),
                    p.SizedBox(height: 10),
                    p.Center(
                      child: p.SizedBox(
                        child: p.Text(controllerList2[item].text,
                            textAlign: p.TextAlign.center,
                            textDirection: langue == "ar"
                                ? p.TextDirection.rtl
                                : p.TextDirection.ltr,
                            style: p.TextStyle(
                                font: ttf,
                                color: PdfColors.black,
                                fontSize: 15)),
                      ),
                    ),
                  ]);
                }).toList(),
              ),
              p.SizedBox(height: 10),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "${intl.roleModelsList}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.roleModelsList}")),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              Dimensions.verticalSpacingExtraLarge,
              teamLoader == true
                  ? CustomInput(
                      controller: _Joueur,
                      hint: "${intl.select(intl.player)}",
                      title: intl.player,
                      inputType: InputType.dropdown,
                      dropdownItems: joueurList,
                    )
                  : LoadingWidget(),
              Dimensions.verticalSpacingExtraLarge,
              teamLoader == true
                  ? CustomInput(
                      controller: _Team,
                      hint: "${intl.select(intl.team)}",
                      title: intl.team,
                      inputType: InputType.dropdown,
                      dropdownItems: teamList,
                    )
                  : LoadingWidget(),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: dateController,
                hint: "${intl.date}",
                title: "${intl.date}",
                inputType: InputType.date,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: ageController,
                hint: "${intl.age}",
                title: "${intl.age}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: [
                  Text(
                    "${intl.name}",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    controller: name1Controller,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  Text(
                    "${intl.roleModels1}",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  CustomInput(
                    controller: attributesController1,
                    hint: "S1",
                    title: "S1",
                    inputType: InputType.text,
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  CustomInput(
                    controller: attributesController2,
                    hint: "S2",
                    title: "S2",
                    inputType: InputType.text,
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  CustomInput(
                    controller: attributesController3,
                    hint: "S3",
                    title: "S3",
                    inputType: InputType.text,
                  ),
                  Text(
                    "${intl.roleModels2}",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    controller: personal1Controller,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  Text(
                    "${intl.roleModels1}",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  CheckboxWidgetList(
                    title: "S1",
                    valueTitle: [
                      "1",
                      "2",
                      "3",
                      "4",
                      "5",
                    ],
                    orientation: Axis.horizontal,
                    values: s1List,
                    listLength: 5,
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  CheckboxWidgetList(
                    title: "S2",
                    valueTitle: [
                      "1",
                      "2",
                      "3",
                      "4",
                      "5",
                    ],
                    orientation: Axis.horizontal,
                    values: s2List,
                    listLength: 5,
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  CheckboxWidgetList(
                    title: "S3",
                    valueTitle: [
                      "1",
                      "2",
                      "3",
                      "4",
                      "5",
                    ],
                    orientation: Axis.horizontal,
                    values: s3List,
                    listLength: 5,
                  ),
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: [
                  Text(
                    "${intl.name}",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    controller: name2Controller,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  Text(
                    "${intl.roleModels1}",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  CustomInput(
                    controller: attributesController4,
                    hint: "S4",
                    title: "S4",
                    inputType: InputType.text,
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  CustomInput(
                    controller: attributesController5,
                    hint: "S5",
                    title: "S5",
                    inputType: InputType.text,
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  CustomInput(
                    controller: attributesController6,
                    hint: "S6",
                    title: "S6",
                    inputType: InputType.text,
                  ),
                  Text(
                    "${intl.roleModels2}",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    controller: personal2Controller,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  Text(
                    "${intl.roleModels1}",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  CheckboxWidgetList(
                    title: "S4",
                    valueTitle: [
                      "1",
                      "2",
                      "3",
                      "4",
                      "5",
                    ],
                    orientation: Axis.horizontal,
                    values: s4List,
                    listLength: 5,
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  CheckboxWidgetList(
                    title: "S5",
                    valueTitle: [
                      "1",
                      "2",
                      "3",
                      "4",
                      "5",
                    ],
                    orientation: Axis.horizontal,
                    values: s5List,
                    listLength: 5,
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  CheckboxWidgetList(
                    title: "S6",
                    valueTitle: [
                      "1",
                      "2",
                      "3",
                      "4",
                      "5",
                    ],
                    orientation: Axis.horizontal,
                    values: s6List,
                    listLength: 5,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "${intl.name}",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    controller: name3Controller,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  Text(
                    "${intl.roleModels1}",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  CustomInput(
                    controller: attributesController7,
                    hint: "S7",
                    title: "S7",
                    inputType: InputType.text,
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  CustomInput(
                    controller: attributesController8,
                    hint: "S8",
                    title: "S8",
                    inputType: InputType.text,
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  CustomInput(
                    controller: attributesController9,
                    hint: "S9",
                    title: "S9",
                    inputType: InputType.text,
                  ),
                  Text(
                    "${intl.roleModels2}",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    controller: personal3Controller,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  Text(
                    "${intl.roleModels1}",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  CheckboxWidgetList(
                    title: "S7",
                    valueTitle: [
                      "1",
                      "2",
                      "3",
                      "4",
                      "5",
                    ],
                    orientation: Axis.horizontal,
                    values: s7List,
                    listLength: 5,
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  CheckboxWidgetList(
                    title: "S8",
                    valueTitle: [
                      "1",
                      "2",
                      "3",
                      "4",
                      "5",
                    ],
                    orientation: Axis.horizontal,
                    values: s8List,
                    listLength: 5,
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  CheckboxWidgetList(
                    title: "S9",
                    valueTitle: [
                      "1",
                      "2",
                      "3",
                      "4",
                      "5",
                    ],
                    orientation: Axis.horizontal,
                    values: s9List,
                    listLength: 5,
                  ),
                ],
              ),
              Column(
                children: titleList
                    .map(
                      (item) => Column(
                        children: [
                          Dimensions.verticalSpacingExtraLarge,
                          Text(
                            item,
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Dimensions.verticalSpacingMedium,
                          Column(
                            children: [
                              Text(
                                "${intl.roleModels3}",
                                style: TextStyle(),
                              ),
                              Dimensions.verticalSpacingMedium,
                              TextField(
                                controller: controllerList1[item],
                                decoration: const InputDecoration(),
                                autofocus: false,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                              ),
                            ],
                          ),
                          Dimensions.verticalSpacingMedium,
                          Column(
                            children: [
                              Text(
                                "${intl.roleModels4}",
                                style: TextStyle(),
                              ),
                              Dimensions.verticalSpacingMedium,
                              TextField(
                                controller: controllerList2[item],
                                decoration: const InputDecoration(),
                                autofocus: false,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
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
                  }),
              Dimensions.verticalSpacingExtraLarge,
            ],
          ),
        ))));
  }
}
