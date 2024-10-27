import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import '../../../shared/widget/loading_widget.dart';

class SessionDesignBoard extends StatefulWidget {
  const SessionDesignBoard({super.key});

  @override
  State<SessionDesignBoard> createState() => _SessionDesignBoardState();
}

class _SessionDesignBoardState extends State<SessionDesignBoard> {
  Future<void> _generatePDF() async {
    final font = await rootBundle.load("assets/JannaLT-Regular.ttf");
    final ttf = p.Font.ttf(font);
    final pdf = p.Document();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langue = prefs.getString('SAVED_LOCALIZATION');
    print(langue);
    final netImage1 = await networkImage("${intl.roleofaCoachimg}");

    pdf.addPage(
      p.MultiPage(
          maxPages: 200,
          pageFormat: PdfPageFormat.a4,
          build: (p.Context context) {
            return <p.Widget>[
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  child: p.Text(intl.coach,
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.amber, fontSize: 15)),
                ),
              ),
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  child: p.Text(coachController.text,
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15)),
                ),
              ),
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  child: p.Text(intl.team,
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.amber, fontSize: 15)),
                ),
              ),
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  child: p.Text(_Team.text,
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15)),
                ),
              ),
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  child: p.Text(intl.date,
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.amber, fontSize: 15)),
                ),
              ),
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  child: p.Text(dateController.text,
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15)),
                ),
              ),
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  child: p.Text("1 ${intl.age}",
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.amber, fontSize: 15)),
                ),
              ),
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  child: p.Text("${ageController.text}",
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15)),
                ),
              ),
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  child: p.Text("2 ${intl.sessionDesignBoard1}",
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.amber, fontSize: 15)),
                ),
              ),
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  child: p.Text("${topicController.text}",
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15)),
                ),
              ),
              p.SizedBox(height: 10),
              p.SizedBox(
                child: p.Text("${intl.sessionDesignBoardPrag1}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf, color: PdfColors.black, fontSize: 15)),
              ),
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  child: p.Text("3 ${intl.sessionDesignBoard2}",
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.amber, fontSize: 15)),
                ),
              ),
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  child: p.Text("${pitchController.text}",
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15)),
                ),
              ),
              p.SizedBox(height: 10),
              p.SizedBox(
                child: p.Text("${intl.sessionDesignBoardPrag2}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf, color: PdfColors.black, fontSize: 15)),
              ),
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  child: p.Text("4 ${intl.sessionDesignBoard3}",
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.amber, fontSize: 15)),
                ),
              ),
              p.SizedBox(height: 10),
              p.Center(
                child: p.SizedBox(
                  child: p.Text("${sessionController.text}",
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15)),
                ),
              ),
              p.SizedBox(height: 10),
              p.SizedBox(
                child: p.Text("${intl.sessionDesignBoardPrag3}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf, color: PdfColors.black, fontSize: 15)),
              ),
              p.SizedBox(height: 50),
              p.SizedBox(
                child: p.Text("${intl.sessionDesignBoard4}",
                    textAlign: p.TextAlign.center,
                    textDirection: langue == "ar"
                        ? p.TextDirection.rtl
                        : p.TextDirection.ltr,
                    style: p.TextStyle(
                        font: ttf, color: PdfColors.amber, fontSize: 15)),
              ),
              p.SizedBox(height: 20),
              p.Column(
                children: titleList
                    .map((item) => p.Column(children: [
                          p.SizedBox(height: 10),
                          p.Container(
                              color: PdfColors.amber,
                              height: 50,
                              width: 500,
                              child: p.Row(
                                  mainAxisAlignment: p.MainAxisAlignment.center,
                                  children: [
                                    p.Padding(
                                        padding:
                                            const p.EdgeInsets.only(left: 10),
                                        child: p.Text(item,
                                            textAlign: p.TextAlign.center,
                                            textDirection: langue == "ar"
                                                ? p.TextDirection.rtl
                                                : p.TextDirection.ltr,
                                            style: p.TextStyle(
                                                font: ttf,
                                                color: PdfColors.white,
                                                fontSize: 15)))
                                  ])),
                        ]))
                    .toList(),
              ),
              p.SizedBox(height: 10),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "${intl.sessionDesignBoardList}.pdf");
  }

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
  final TextEditingController dateController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController topicController = TextEditingController();
  final TextEditingController pitchController = TextEditingController();
  final TextEditingController sessionController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  List<String> titleList = [
    "${intl.sessionDesignBoard1}",
    "${intl.sessionDesignBoard2}",
    "${intl.sessionDesignBoard3}",
    "${intl.sessionDesignBoard4}",
    "${intl.sessionDesignBoard5}",
    "${intl.sessionDesignBoard6}",
    "${intl.sessionDesignBoard7}",
    "${intl.sessionDesignBoard8}",
    "${intl.sessionDesignBoard9}",
    "${intl.sessionDesignBoard10}",
    "${intl.sessionDesignBoard11}",
    "${intl.sessionDesignBoard12}",
    "${intl.sessionDesignBoard13}",
    "${intl.sessionDesignBoard14}",
    "${intl.sessionDesignBoard15}",
    "${intl.sessionDesignBoard16}",
    "${intl.sessionDesignBoard17}",
    "${intl.sessionDesignBoard18}",
    "${intl.sessionDesignBoard19}",
    "${intl.sessionDesignBoard20}",
    "${intl.sessionDesignBoard21}",
    "${intl.sessionDesignBoard22}",
    "${intl.sessionDesignBoard23}",
    "${intl.sessionDesignBoard24}",
    "${intl.sessionDesignBoard25}",
    "${intl.sessionDesignBoard26}",
    "${intl.sessionDesignBoard27}",
    "${intl.sessionDesignBoard28}",
    "${intl.sessionDesignBoard29}",
    "${intl.sessionDesignBoard30}",
    "${intl.sessionDesignBoard31}",
    "${intl.sessionDesignBoard32}",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.sessionDesignBoardList}")),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: coachController,
                hint: "${intl.coach}",
                title: "${intl.coach}",
                inputType: InputType.text,
              ),
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
                hint: "1 ${intl.age}",
                title: "1 ${intl.age}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: [
                  CustomInput(
                    controller: topicController,
                    hint: "2 ${intl.sessionDesignBoard1}",
                    title: "2 ${intl.sessionDesignBoard1}",
                    inputType: InputType.text,
                  ),
                  Text("${intl.sessionDesignBoardPrag1}")
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: [
                  CustomInput(
                    controller: pitchController,
                    hint: "3 ${intl.sessionDesignBoard2}",
                    title: "3 ${intl.sessionDesignBoard2}",
                    inputType: InputType.text,
                  ),
                  Text("${intl.sessionDesignBoardPrag2}")
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: [
                  CustomInput(
                    controller: sessionController,
                    hint: "4 ${intl.sessionDesignBoard3}",
                    title: "4 ${intl.sessionDesignBoard3}",
                    inputType: InputType.text,
                  ),
                  Text("${intl.sessionDesignBoardPrag3}")
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Dimensions.verticalSpacingExtraLarge,
                  SizedBox(
                      child: Center(
                          child: Text(
                    "${intl.sessionDesignBoard4}",
                    style: TextStyle(color: AppColors.primaryColor),
                  ))),
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: titleList
                    .map(
                      (item) => Card(
                        color: AppColors.primaryColor,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(child: Center(child: Text(item))),
                            ],
                          ),
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
