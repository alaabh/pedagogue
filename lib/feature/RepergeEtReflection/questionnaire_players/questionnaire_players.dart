import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/joueur_controller.dart';
import '../../../controller/team_controller.dart';
import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';
import '../../espqceEPS/ficheDePresence/save_file_mobile.dart';

class QuestionnairePlayers extends StatefulWidget {
  const QuestionnairePlayers({super.key});

  @override
  State<QuestionnairePlayers> createState() => _QuestionnairePlayersState();
}

class _QuestionnairePlayersState extends State<QuestionnairePlayers> {
  TeamController teamController = TeamController();
  JoueurController joueurController = JoueurController();
  String? eXITTICKETValue = "";

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Map<String, dynamic> titleList = {
    "${intl.questionnairePlayers1}": TextEditingController(),
    "${intl.questionnairePlayers2}": TextEditingController(),
    "${intl.questionnairePlayers3}": TextEditingController(),
    "${intl.questionnairePlayers4}": TextEditingController(),
    "${intl.questionnairePlayers5}": TextEditingController(),
    "${intl.questionnairePlayers6}": TextEditingController(),
    "${intl.questionnairePlayers7}": TextEditingController(),
    "${intl.questionnairePlayers8}": TextEditingController(),
    "${intl.questionnairePlayers9}": TextEditingController(),
    "${intl.questionnairePlayers10}": TextEditingController(),
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
              p.Column(
                children: titleList.entries.map((entry) {
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
                                            fontSize: 15))),
                              ])),
                      p.SizedBox(height: 10),
                      p.SizedBox(
                        width: 200,
                        child: p.Text(entry.value.text,
                            textAlign: p.TextAlign.center,
                            textDirection: langue == "ar"
                                ? p.TextDirection.rtl
                                : p.TextDirection.ltr,
                            style: p.TextStyle(
                                font: ttf,
                                color: PdfColors.black,
                                fontSize: 15)),
                      ),
                      p.SizedBox(height: 10),
                    ],
                  );
                }).toList(),
              ),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "${intl.questionnairePlayersList}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.questionnairePlayersList}")),
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
                inputType: InputType.date,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: titleList.entries.map((entry) {
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
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Center(child: Text(entry.key))),
                            ],
                          ),
                        ),
                      ),
                      Dimensions.verticalSpacingExtraLarge,
                      Column(
                        children: [
                          TextField(
                            keyboardType: TextInputType.multiline,
                            controller: entry.value,
                            decoration: const InputDecoration(),
                            autofocus: false,
                            maxLines: null,
                            minLines: 3,
                          ),
                        ],
                      ),
                      Dimensions.verticalSpacingMedium,
                    ],
                  );
                }).toList(),
              ),
              Dimensions.verticalSpacingExtraLarge,
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
