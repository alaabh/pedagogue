import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:pedagogue/feature/espqceEPS/ficheDePresence/save_file_mobile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/team_controller.dart';
import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';

class SessionPlan1 extends StatefulWidget {
  const SessionPlan1({super.key});

  @override
  State<SessionPlan1> createState() => _SessionPlan1State();
}

class _SessionPlan1State extends State<SessionPlan1> {
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Map<String, dynamic> titleList1 = {
    "": TextEditingController(),
    "${intl.sessionPlan18}": TextEditingController(),
    "${intl.sessionPlan19}": TextEditingController(),
    "${intl.sessionPlan18}": TextEditingController(),
    "${intl.sessionPlan110}": TextEditingController(),
    "${intl.sessionPlan111}": TextEditingController(),
    "${intl.sessionPlan112}": TextEditingController(),
    "${intl.sessionPlan113}": TextEditingController(),
    "${intl.sessionPlan114}": TextEditingController(),
    "${intl.sessionPlan115}": TextEditingController(),
  };
  Map<String, dynamic> titleList2 = {
    "": TextEditingController(),
    "${intl.sessionPlan18}": TextEditingController(),
    "${intl.sessionPlan19}": TextEditingController(),
    "${intl.sessionPlan18}": TextEditingController(),
    "${intl.sessionPlan110}": TextEditingController(),
    "${intl.sessionPlan111}": TextEditingController(),
    "${intl.sessionPlan112}": TextEditingController(),
    "${intl.sessionPlan113}": TextEditingController(),
    "${intl.sessionPlan114}": TextEditingController(),
    "${intl.sessionPlan115}": TextEditingController(),
  };
  Map<String, dynamic> titleList3 = {
    "": TextEditingController(),
    "${intl.sessionPlan18}": TextEditingController(),
    "${intl.sessionPlan19}": TextEditingController(),
    "${intl.sessionPlan18}": TextEditingController(),
    "${intl.sessionPlan110}": TextEditingController(),
    "${intl.sessionPlan111}": TextEditingController(),
    "${intl.sessionPlan112}": TextEditingController(),
    "${intl.sessionPlan113}": TextEditingController(),
    "${intl.sessionPlan114}": TextEditingController(),
    "${intl.sessionPlan115}": TextEditingController(),
  };
  Map<String, dynamic> titleList4 = {
    "": TextEditingController(),
    "${intl.sessionPlan18}": TextEditingController(),
    "${intl.sessionPlan19}": TextEditingController(),
    "${intl.sessionPlan18}": TextEditingController(),
    "${intl.sessionPlan110}": TextEditingController(),
    "${intl.sessionPlan111}": TextEditingController(),
    "${intl.sessionPlan112}": TextEditingController(),
    "${intl.sessionPlan113}": TextEditingController(),
    "${intl.sessionPlan114}": TextEditingController(),
    "${intl.sessionPlan115}": TextEditingController(),
  };
  Map<String, dynamic> titleList5 = {
    "": TextEditingController(),
    "${intl.sessionPlan18}": TextEditingController(),
    "${intl.sessionPlan19}": TextEditingController(),
    "${intl.sessionPlan18}": TextEditingController(),
    "${intl.sessionPlan110}": TextEditingController(),
    "${intl.sessionPlan111}": TextEditingController(),
    "${intl.sessionPlan112}": TextEditingController(),
    "${intl.sessionPlan113}": TextEditingController(),
    "${intl.sessionPlan114}": TextEditingController(),
    "${intl.sessionPlan115}": TextEditingController(),
  };
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController coachController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController abilityController = TextEditingController();
  TextEditingController objectivesController = TextEditingController();

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
                      child: p.Text(intl.age,
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
                      child: p.Text(intl.sessionPlan11,
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
                      child: p.Text(locationController.text,
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
                      child: p.Text(intl.time,
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
                      child: p.Text(timeController.text,
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
                      child: p.Text(intl.sessionPlan12,
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
                      child: p.Text(abilityController.text,
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
                      width: 200,
                      child: p.Text(intl.sessionPlan13,
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
                      child: p.Text(objectivesController.text,
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
                            child: p.Text(intl.sessionPlan14,
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
                children: titleList1.entries
                    .map((item) => p.Column(
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
                            ]))
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
                            child: p.Text(intl.sessionPlan15,
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
                children: titleList2.entries
                    .map((item) => p.Column(
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
                            ]))
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
                            child: p.Text(intl.sessionPlan16,
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
                children: titleList3.entries
                    .map((item) => p.Column(
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
                            ]))
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
                            child: p.Text(intl.sessionPlan17,
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
                children: titleList4.entries
                    .map((item) => p.Column(
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
                            ]))
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
                            child: p.Text(intl.sessionPlan18,
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
                children: titleList5.entries
                    .map((item) => p.Column(
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
                            ]))
                    .toList(),
              ),
              p.SizedBox(height: 10),
              
              p.SizedBox(height: 10),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "${intl.sessionPlan1List}.pdf");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.sessionPlan1List}")),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
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
                controller: ageController,
                hint: "${intl.age}",
                title: "${intl.age}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: locationController,
                hint: "${intl.sessionPlan11}",
                title: "${intl.sessionPlan11}",
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
                controller: timeController,
                hint: "${intl.time}",
                title: "${intl.time}",
                inputType: InputType.time,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: abilityController,
                hint: "${intl.sessionPlan12}",
                title: "${intl.sessionPlan12}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Dimensions.verticalSpacingExtraLarge,
                  SizedBox(
                      child: Center(
                          child: Text(
                    "${intl.sessionPlan13}",
                    style: TextStyle(color: AppColors.primaryColor),
                  ))),
                  Dimensions.verticalSpacingExtraLarge,
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Center(
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          controller: objectivesController,
                          decoration: const InputDecoration(),
                          autofocus: false,
                          maxLines: null,
                        ),
                      )),
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              child:
                                  Center(child: Text("${intl.sessionPlan14}"))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: titleList1.entries
                    .map(
                      (item) => SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Dimensions.verticalSpacingExtraLarge,
                                SizedBox(
                                    child: Center(
                                        child: Text(
                                  item.key,
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                ))),
                                Dimensions.verticalSpacingExtraLarge,
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
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
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              child:
                                  Center(child: Text("${intl.sessionPlan15}"))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: titleList2.entries
                    .map(
                      (item) => SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Dimensions.verticalSpacingExtraLarge,
                                SizedBox(
                                    child: Center(
                                        child: Text(
                                  item.key,
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                ))),
                                Dimensions.verticalSpacingExtraLarge,
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
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
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              child:
                                  Center(child: Text("${intl.sessionPlan16}"))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: titleList3.entries
                    .map(
                      (item) => SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Dimensions.verticalSpacingExtraLarge,
                                SizedBox(
                                    child: Center(
                                        child: Text(
                                  item.key,
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                ))),
                                Dimensions.verticalSpacingExtraLarge,
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
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
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              child:
                                  Center(child: Text("${intl.sessionPlan17}"))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: titleList4.entries
                    .map(
                      (item) => SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Dimensions.verticalSpacingExtraLarge,
                                SizedBox(
                                    child: Center(
                                        child: Text(
                                  item.key,
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                ))),
                                Dimensions.verticalSpacingExtraLarge,
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
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
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  child: Text("${intl.sessionPlan116}"))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: titleList5.entries
                    .map(
                      (item) => SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Dimensions.verticalSpacingExtraLarge,
                                SizedBox(
                                    child: Center(
                                        child: Text(
                                  item.key,
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                ))),
                                Dimensions.verticalSpacingExtraLarge,
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
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
                          ],
                        ),
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
