import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/widget/customTextField.dart';
import '../../../shared/widget/custom_button.dart';
import '../../espqceEPS/ficheDePresence/save_file_mobile.dart';
import '../widget/multiCheckboxReport_widget.dart';

class RepportWeeklyPlaningView extends StatefulWidget {
  const RepportWeeklyPlaningView({super.key});

  @override
  State<RepportWeeklyPlaningView> createState() =>
      _RepportWeeklyPlaningViewState();
}

class _RepportWeeklyPlaningViewState extends State<RepportWeeklyPlaningView> {
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
                            child: p.Text(intl.reportWeeklyPlaning,
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
                                      "${intl.team} : ${_TeamController.text}",
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
                                      "${intl.coach} : ${_CoachController.text}",
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
                                      "${intl.season} : ${_SeasonController.text}",
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
              p.Text("${_TypeController.text}",
                  textAlign: p.TextAlign.center,
                  textDirection: langue == "ar"
                      ? p.TextDirection.rtl
                      : p.TextDirection.ltr,
                  style: p.TextStyle(
                      font: ttf, color: PdfColors.black, fontSize: 15)),
              p.SizedBox(height: 30),
              p.Container(
                  width: 500,
                  child: p.Column(
                    children: (blocks).map((block) {
                      return p.Column(children: [
                        p.SizedBox(
                            height: 10,
                            child: p.Text(
                                "${intl.trainingProgram} : ${block['traningProgramController'].toString()}",
                                textDirection: langue == "ar"
                                    ? p.TextDirection.rtl
                                    : p.TextDirection.ltr,
                                style: p.TextStyle(
                                  font: ttf,
                                ))),
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

    saveAndLaunchFile(bytes, "report_weekly_planing.pdf");
  }
  /* RapportSmestre1Controller rapportSmestre1Controller =
      RapportSmestre1Controller();
  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    //if (!(_formKey.currentState?.validate() ?? false)) return;

    RapportSemestre1Model rapportSemestre1Model = RapportSemestre1Model(
        id: 0, userId: 0
        /* id: widget.season?.id,
      name: nameController.text,
      description: descriptionController.text, */
        );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: rapportSmestre1Controller.add(rapportSemestre1Model),
      successFunction: () => Navigator.pop(context),
    );
  } */

  late TextEditingController _TeamController;
  late TextEditingController _CoachController;
  late TextEditingController _SeasonController;
  late TextEditingController _TypeController;

  List<Map<String, dynamic>> blocks = [
    {
      'traningProgramValue': "",
      'weekCheckBox': {
        "${intl.week}1-M": false,
        "${intl.week}1-Tu": false,
        "${intl.week}1-w": false,
        "${intl.week}1-Th": false,
        "${intl.week}1-f": false,
        "${intl.week}1-Sa": false,
        "${intl.week}1-Su": false,
        "${intl.week}2-M": false,
        "${intl.week}2-Tu": false,
        "${intl.week}2-w": false,
        "${intl.week}2-Th": false,
        "${intl.week}2-f": false,
        "${intl.week}2-Sa": false,
        "${intl.week}2-Su": false,
        "${intl.week}3-M": false,
        "${intl.week}3-Tu": false,
        "${intl.week}3-w": false,
        "${intl.week}3-Th": false,
        "${intl.week}3-f": false,
        "${intl.week}3-Sa": false,
        "${intl.week}3-Su": false,
        "${intl.week}4-M": false,
        "${intl.week}4-Tu": false,
        "${intl.week}4-w": false,
        "${intl.week}4-Th": false,
        "${intl.week}4-f": false,
        "${intl.week}4-Sa": false,
        "${intl.week}4-Su": false,
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
    _TypeController = TextEditingController();

    blocks = [
      {
        'traningProgramValue': "",
        'weekCheckBox': {
          "${intl.week}1-M": false,
          "${intl.week}1-Tu": false,
          "${intl.week}1-w": false,
          "${intl.week}1-Th": false,
          "${intl.week}1-f": false,
          "${intl.week}1-Sa": false,
          "${intl.week}1-Su": false,
          "${intl.week}2-M": false,
          "${intl.week}2-Tu": false,
          "${intl.week}2-w": false,
          "${intl.week}2-Th": false,
          "${intl.week}2-f": false,
          "${intl.week}2-Sa": false,
          "${intl.week}2-Su": false,
          "${intl.week}3-M": false,
          "${intl.week}3-Tu": false,
          "${intl.week}3-w": false,
          "${intl.week}3-Th": false,
          "${intl.week}3-f": false,
          "${intl.week}3-Sa": false,
          "${intl.week}3-Su": false,
          "${intl.week}4-M": false,
          "${intl.week}4-Tu": false,
          "${intl.week}4-w": false,
          "${intl.week}4-Th": false,
          "${intl.week}4-f": false,
          "${intl.week}4-Sa": false,
          "${intl.week}4-Su": false,
        }
      }
    ];
  }

  void addBlock() {
    setState(() {
      blocks.add({
        'traningProgramValue': "",
        'weekCheckBox': {
          "${intl.week}1-M": false,
          "${intl.week}1-Tu": false,
          "${intl.week}1-w": false,
          "${intl.week}1-Th": false,
          "${intl.week}1-f": false,
          "${intl.week}1-Sa": false,
          "${intl.week}1-Su": false,
          "${intl.week}2-M": false,
          "${intl.week}2-Tu": false,
          "${intl.week}2-w": false,
          "${intl.week}2-Th": false,
          "${intl.week}2-f": false,
          "${intl.week}2-Sa": false,
          "${intl.week}2-Su": false,
          "${intl.week}3-M": false,
          "${intl.week}3-Tu": false,
          "${intl.week}3-w": false,
          "${intl.week}3-Th": false,
          "${intl.week}3-f": false,
          "${intl.week}3-Sa": false,
          "${intl.week}3-Su": false,
          "${intl.week}4-M": false,
          "${intl.week}4-Tu": false,
          "${intl.week}4-w": false,
          "${intl.week}4-Th": false,
          "${intl.week}4-f": false,
          "${intl.week}4-Sa": false,
          "${intl.week}4-Su": false,
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
      appBar: AppBar(title: Text(intl.reportWeeklyPlaning)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
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
                    CustomInput(
                      controller: _TypeController,
                      hint: intl.selectThetype,
                      title: intl.type,
                      inputType: InputType.dropdown,
                      dropdownItems: [
                        intl.childrenFootball77,
                        intl.preformation99,
                        intl.juniorGrassrootsFootball1111,
                        intl.senior,
                      ],
                    )
                  ],
                ),
              ),
            ),
            MultiCheckBoxReportWidget(
              blocks: blocks,
              deleteBlock: removeBlock,
              gridViewAxisCount: 5,
              gridchildAspectRatiot:
                  MediaQuery.of(context).size.height * 0.0008,
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
