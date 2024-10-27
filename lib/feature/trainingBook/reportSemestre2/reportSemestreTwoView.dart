import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:pedagogue/l10n/localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/reportSemestre2_model.dart';
import '../../../model/rapport_semestre2_model.dart';
import '../../../shared/widget/customTextField.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import '../../espqceEPS/ficheDePresence/save_file_mobile.dart';
import '../widget/multiCheckboxReport_widget.dart';

class ReportSemestreTwoView extends StatefulWidget {
  const ReportSemestreTwoView({super.key});

  @override
  State<ReportSemestreTwoView> createState() => _ReportSemestreTwoViewState();
}

class _ReportSemestreTwoViewState extends State<ReportSemestreTwoView> {
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
              //Informations relatives au bénéficiaire
              p.Container(
                  color: PdfColors.purple,
                  height: 50,
                  width: 500,
                  child: p.Row(
                      mainAxisAlignment: p.MainAxisAlignment.start,
                      children: [
                        p.Padding(
                            padding: const p.EdgeInsets.only(left: 10),
                            child: p.Text(intl.reportSemestre2,
                                textAlign: p.TextAlign.center,
                                textDirection: langue == "ar"
                                    ? p.TextDirection.rtl
                                    : p.TextDirection.ltr,
                                style: p.TextStyle(
                                    font: ttf,
                                    color: PdfColors.white,
                                    fontSize: 15)))
                      ])),
              p.SizedBox(height: 30),
              p.Container(
                  height: 100,
                  width: 500,
                  child: p.Row(
                      mainAxisAlignment: p.MainAxisAlignment.center,
                      children: [
                        p.Row(
                            mainAxisAlignment: p.MainAxisAlignment.center,
                            children: [
                              p.Padding(
                                  padding: const p.EdgeInsets.only(left: 10),
                                  child: p.Text(
                                      "Team : ${_TeamController.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(left: 10),
                                  child: p.Text(
                                      "Coach : ${_CoachController.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(left: 10),
                                  child: p.Text(
                                      "Season : ${_SeasonController.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontSize: 15)))
                            ])
                      ])),
              p.SizedBox(height: 30),
              p.Container(
                  width: 500,
                  child: p.Column(
                    children: (blocks).map((block) {
                      return p.Column(children: [
                        p.SizedBox(
                            height: 10,
                            child: p.Text(
                                "Training program : ${block['traningProgramController'].toString()}")),
                        p.SizedBox(height: 10),
                        p.SizedBox(
                          height: 150,
                          width: 500,
                          child: p.GridView(
                            childAspectRatio: 4,
                            crossAxisCount: 8,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            children: block['weekCheckBox']
                                .entries
                                .map<p.Widget>((entry) {
                              return p.Column(children: [
                                p.SizedBox(
                                    child: p.Text(entry.key,
                                        textDirection: langue == "ar"
                                            ? p.TextDirection.rtl
                                            : p.TextDirection.ltr,
                                        style: p.TextStyle(
                                            font: ttf,
                                            color: PdfColors.black,
                                            fontSize: 9)),
                                    height: 10),
                                p.SizedBox(height: 5),
                                p.SizedBox(
                                  child: p.Checkbox(
                                      checkColor: PdfColors.amber,
                                      value: entry.value,
                                      name: entry.key),
                                ),
                              ]);
                            }).toList(),
                          ),
                        )
                      ]);
                    }).toList(),
                  )),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "report_semestre2.pdf");
  }

  RapportSmestre2Controller rapportSmestre2Controller =
      RapportSmestre2Controller();
  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    //if (!(_formKey.currentState?.validate() ?? false)) return;

    RapportSemestre2Model rapportSemestre1Model = RapportSemestre2Model(
        // id: 0, userId: 0
        /* id: widget.season?.id,
      name: nameController.text,
      description: descriptionController.text, */
        );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: rapportSmestre2Controller.add(rapportSemestre1Model),
      successFunction: () => Navigator.pop(context),
    );
  }

  late TextEditingController _TeamController;
  late TextEditingController _CoachController;
  late TextEditingController _SeasonController;

  List<Map<String, dynamic>> blocks = [
    {
      'traningProgramValue': "",
      'weekCheckBox': {
        "${intl.january}1": false,
        "${intl.january}2": false,
        "${intl.january}3": false,
        "${intl.january}4": false,
        "${intl.february}5": false,
        "${intl.february}6": false,
        "${intl.february}7": false,
        "${intl.february}8": false,
        "${intl.march}9": false,
        "${intl.march}10": false,
        "${intl.march}11": false,
        "${intl.march}12": false,
        "${intl.april}13": false,
        "${intl.april}14": false,
        "${intl.april}15": false,
        "${intl.april}16": false,
        "${intl.may}17": false,
        "${intl.may}18": false,
        "${intl.may}19": false,
        "${intl.may}20": false,
        "${intl.june}21": false,
        "${intl.june}22": false,
        "${intl.june}23": false,
        "${intl.june}24": false,
        "${intl.june}25": false,
      }
    }
  ];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _TeamController = TextEditingController();
    _CoachController = TextEditingController();
    _SeasonController = TextEditingController();

    blocks = [
      {
        'traningProgramValue': "",
        'weekCheckBox': {
          "${intl.january}1": false,
          "${intl.january}2": false,
          "${intl.january}3": false,
          "${intl.january}4": false,
          "${intl.february}5": false,
          "${intl.february}6": false,
          "${intl.february}7": false,
          "${intl.february}8": false,
          "${intl.march}9": false,
          "${intl.march}10": false,
          "${intl.march}11": false,
          "${intl.march}12": false,
          "${intl.april}13": false,
          "${intl.april}14": false,
          "${intl.april}15": false,
          "${intl.april}16": false,
          "${intl.may}17": false,
          "${intl.may}18": false,
          "${intl.may}19": false,
          "${intl.may}20": false,
          "${intl.june}21": false,
          "${intl.june}22": false,
          "${intl.june}23": false,
          "${intl.june}24": false,
          "${intl.june}25": false,
        }
      }
    ];
  }

  void addBlock() {
    setState(() {
      blocks.add({
        'traningProgramController': "",
        'weekCheckBox': {
          "${intl.january}1": false,
          "${intl.january}2": false,
          "${intl.january}3": false,
          "${intl.january}4": false,
          "${intl.february}5": false,
          "${intl.february}6": false,
          "${intl.february}7": false,
          "${intl.february}8": false,
          "${intl.march}9": false,
          "${intl.march}10": false,
          "${intl.march}11": false,
          "${intl.march}12": false,
          "${intl.april}13": false,
          "${intl.april}14": false,
          "${intl.april}15": false,
          "${intl.april}16": false,
          "${intl.may}17": false,
          "${intl.may}18": false,
          "${intl.may}19": false,
          "${intl.may}20": false,
          "${intl.june}21": false,
          "${intl.june}22": false,
          "${intl.june}23": false,
          "${intl.june}24": false,
          "${intl.june}25": false,
        }
      });
    });
  }

  void removeBlock(int index) {
    setState(() {
      blocks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.reportSemestre2)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextField(
                      hintText: intl.team,
                      labelText: intl.team,
                      controller: _TeamController,
                    ),
                    CustomTextField(
                      hintText: intl.coach,
                      labelText: intl.coach,
                      controller: _CoachController,
                    ),
                    CustomTextField(
                      hintText: intl.season,
                      labelText: intl.season,
                      controller: _SeasonController,
                    ),
                  ],
                ),
              ),
            ),
            MultiCheckBoxReportWidget(
              blocks: blocks,
              deleteBlock: removeBlock,
              gridViewAxisCount: 5,
              gridchildAspectRatiot: MediaQuery.of(context).size.height * 0.001,
            ),
            IconButton(
                onPressed: () {
                  addBlock();
                },
                icon: Icon(Icons.add)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    onPressed: () {
                      print(blocks);
                    },
                    text: intl.save,
                    width: MediaQuery.of(context).size.width * 0.18,
                  ),
                  CustomButton(
                    onPressed: () {
                      _generatePDF();
                    },
                    text: '${intl.print}',
                    width: MediaQuery.of(context).size.width * 0.18,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
