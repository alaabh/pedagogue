import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/joueur_controller.dart';
import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';
import '../../../shared/widget/shimmer/radio_widget_list.dart';
import '../../espqceEPS/ficheDePresence/save_file_mobile.dart';

class RetroactionMain extends StatefulWidget {
  const RetroactionMain({super.key});

  @override
  State<RetroactionMain> createState() => _RetroactionMainState();
}

class _RetroactionMainState extends State<RetroactionMain> {
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
              p.Column(
                children: [
                  p.Row(
                      mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                      children: [
                        p.SizedBox(
                          width: 200,
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
                          width: 200,
                          child: p.Text(_Joueur.text,
                              textAlign: p.TextAlign.center,
                              textDirection: langue == "ar"
                                  ? p.TextDirection.rtl
                                  : p.TextDirection.ltr,
                              style: p.TextStyle(
                                  font: ttf,
                                  color: PdfColors.black,
                                  fontSize: 15)),
                        ),
                      ]),
                  p.Row(children: [
                    p.SizedBox(
                      width: 200,
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
                      width: 200,
                      child: p.Text(dateController.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    ),
                  ]),
                  p.SizedBox(height: 10),
                  p.SizedBox(
                    width: 500,
                    child: p.Text("${intl.feedback1}",
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
                    child: p.Text("1 :  ${enjoyed1Controller.text}",
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
                    child: p.Text("2 :  ${enjoyed2Controller.text}",
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
                    child: p.Text("3 :  ${enjoyed3Controller.text}",
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
                    child: p.Text("${intl.feedback2}",
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
                    child: p.Text("1 :  ${quality1Controller.text}",
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
                    child: p.Text("2 :  ${quality2Controller.text}",
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
                    child: p.Text("3 :  ${quality3Controller.text}",
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
                                child: p.Text(
                                    intl.developmentalActionPlanCoaches2,
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
                    children: radioList.entries.map((entry) {
                      return p.Column(
                        children: [
                          p.Row(
                              mainAxisAlignment:
                                  p.MainAxisAlignment.spaceEvenly,
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
                              ]),
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
                                child: p.Text(titleListController[item].text,
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

    saveAndLaunchFile(bytes, "${intl.feedbackList}");
  }

  JoueurController joueurController = JoueurController();

  bool teamLoader = false;

  List<String>? joueurList = [];
  List<String>? teamList = [];
  Future<void> loadData() async {
    await joueurController.getAll();

    setState(() {
      for (var element in joueurController.apiResponse.value.itemList) {
        // print(element.name);
        joueurList!.add("${element.firstName} ${element.lastName}");
      }
    });

    teamLoader = true;
  }

  final TextEditingController _Team = TextEditingController();
  final TextEditingController _Joueur = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    radioList = {
      "${intl.feedback4}": eMOTIONS,
      "${intl.feedback5}": eMOTIONS,
      "${intl.feedback6}": eMOTIONS,
      "${intl.feedback7}": eMOTIONS,
      "${intl.feedback8}": eMOTIONS,
      "${intl.feedback9}": eMOTIONS,
      "${intl.feedback10}": eMOTIONS,
    };
  }

  String? eMOTIONS = "";
  List<String> titleList = [
    "${intl.feedback11}",
    "${intl.feedback12}",
    "${intl.feedback13}",
    "${intl.feedback14}",
    "${intl.feedback15}",
    "${intl.feedback16}",
    "${intl.feedback17}",
  ];
  Map<String, dynamic> titleListController = {
    "${intl.feedback11}": TextEditingController(),
    "${intl.feedback12}": TextEditingController(),
    "${intl.feedback13}": TextEditingController(),
    "${intl.feedback14}": TextEditingController(),
    "${intl.feedback15}": TextEditingController(),
    "${intl.feedback16}": TextEditingController(),
    "${intl.feedback17}": TextEditingController(),
  };
  Map<String, dynamic> radioList = {};
  TextEditingController dateController = TextEditingController();

  TextEditingController enjoyed1Controller = TextEditingController();
  TextEditingController enjoyed2Controller = TextEditingController();
  TextEditingController enjoyed3Controller = TextEditingController();
  TextEditingController quality1Controller = TextEditingController();
  TextEditingController quality2Controller = TextEditingController();
  TextEditingController quality3Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.feedbackList}")),
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
              CustomInput(
                controller: dateController,
                hint: "${intl.date}",
                title: "${intl.date}",
                inputType: InputType.time,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Text(
                "${intl.feedback1}",
                style: TextStyle(
                    color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: [
                  Text(
                    "1",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    keyboardType: TextInputType.multiline,
                    controller: enjoyed1Controller,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "2",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    keyboardType: TextInputType.multiline,
                    controller: enjoyed2Controller,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "3",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    keyboardType: TextInputType.multiline,
                    controller: enjoyed3Controller,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                  ),
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              Text(
                "${intl.feedback2}",
                style: TextStyle(
                    color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: [
                  Text(
                    "1",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    keyboardType: TextInputType.multiline,
                    controller: quality1Controller,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "2",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    keyboardType: TextInputType.multiline,
                    controller: quality2Controller,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "3",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  TextField(
                    keyboardType: TextInputType.multiline,
                    controller: quality3Controller,
                    decoration: const InputDecoration(),
                    autofocus: false,
                    maxLines: null,
                  ),
                ],
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
                      SizedBox(child: Center(child: Text("${intl.feedback3}"))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: radioList.entries.map((entry) {
                  return Column(
                    children: [
                      Dimensions.verticalSpacingExtraLarge,
                      RadioWidgetList(
                        onChanged: (value) {
                          setState(() {
                            radioList[entry.key] = value;
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
                            controller: titleListController[item],
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
