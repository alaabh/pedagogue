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

class SessionPlan2 extends StatefulWidget {
  const SessionPlan2({super.key});

  @override
  State<SessionPlan2> createState() => _SessionPlan2State();
}

class _SessionPlan2State extends State<SessionPlan2> {
  Map<String, dynamic> sessionPlan2List = {
    "${intl.sessionPlan22} 1": TextEditingController(),
    "${intl.sessionPlan23}": TextEditingController(),
    "${intl.sessionPlan22} 2": TextEditingController(),
    "${intl.sessionPlan23}": TextEditingController(),
    "${intl.sessionPlan22} 3": TextEditingController(),
    "${intl.sessionPlan23}": TextEditingController(),
    "${intl.sessionPlan24}": TextEditingController(),
    "${intl.sessionPlan25}": TextEditingController(),
    "${intl.sessionPlan26}": TextEditingController(),
    "${intl.sessionPlan23}": TextEditingController(),
    "${intl.sessionPlan27}": TextEditingController(),
    "${intl.sessionPlan23}": TextEditingController(),
    "${intl.sessionPlan28}": TextEditingController(),
    "${intl.sessionPlan29}": TextEditingController(),
    "${intl.sessionPlan210}": TextEditingController(),
  };
  TextEditingController teamController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController topicController = TextEditingController();
  TextEditingController coachController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController durationController = TextEditingController();
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
                      child: p.Text(teamController.text,
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
                      child: p.Text(intl.sessionPlan21,
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
                      child: p.Text(topicController.text,
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
                      child: p.Text(intl.sessionPlan23,
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
                      child: p.Text(durationController.text,
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
                children: sessionPlan2List.entries
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
              p.SizedBox(height: 10),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "${intl.sessionPlan2List}.pdf");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.sessionPlan2List}")),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: teamController,
                hint: "${intl.team}",
                title: "${intl.team}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: ageController,
                hint: "${intl.age}",
                title: "${intl.age}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: topicController,
                hint: "${intl.sessionPlan21}",
                title: "${intl.sessionPlan21}",
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
              CustomInput(
                controller: durationController,
                hint: "${intl.sessionPlan23}",
                title: "${intl.sessionPlan23}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: sessionPlan2List.entries
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
