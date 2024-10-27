import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/team_controller.dart';
import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';
import '../../espqceEPS/ficheDePresence/save_file_mobile.dart';

class SessionPlan3 extends StatefulWidget {
  const SessionPlan3({super.key});

  @override
  State<SessionPlan3> createState() => _SessionPlan3State();
}

class _SessionPlan3State extends State<SessionPlan3> {
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

  TextEditingController nameController = TextEditingController();
  TextEditingController assistantController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController noPlayerController = TextEditingController();

  Map<String, dynamic> sessionPlan3List = {
    "${intl.sessionPlan33}": TextEditingController(),
    "${intl.sessionPlan34}": TextEditingController(),
    "${intl.sessionPlan35}": TextEditingController(),
    "${intl.sessionPlan36}": TextEditingController(),
    "${intl.sessionPlan37}": TextEditingController(),
    "${intl.sessionPlan38}": TextEditingController(),
    "${intl.sessionPlan39}": TextEditingController(),
    "${intl.sessionPlan310}": TextEditingController(),
    "${intl.sessionPlan311}": TextEditingController(),
    "${intl.sessionPlan312}": TextEditingController(),
  };
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
                      child: p.Text(nameController.text,
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
                      child: p.Text(intl.sessionPlan31,
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
                      child: p.Text(intl.sessionPlan32,
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
                      child: p.Text(noPlayerController.text,
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
                children: sessionPlan3List.entries
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

    saveAndLaunchFile(bytes, "${intl.sessionPlan3List}.pdf");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.sessionPlan3List}")),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              teamLoader == true
                  ? CustomInput(
                      controller: _Team,
                      hint: "${intl.select(intl.team)}",
                      title: intl.player,
                      inputType: InputType.dropdown,
                      dropdownItems: teamList,
                    )
                  : LoadingWidget(),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: nameController,
                hint: "${intl.name}",
                title: "${intl.name}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: assistantController,
                hint: "${intl.sessionPlan31}",
                title: "${intl.sessionPlan31}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: dateController,
                hint: "${intl.date}",
                title: "${intl.date}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: timeController,
                hint: "${intl.time}",
                title: "${intl.time}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: noPlayerController,
                hint: "${intl.sessionPlan32}",
                title: "${intl.sessionPlan32}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: sessionPlan3List.entries
                    .map(
                      (item) => SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        // height: MediaQuery.of(context).size.height * 0.15,
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
