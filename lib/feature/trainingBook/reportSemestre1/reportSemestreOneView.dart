import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:pedagogue/feature/trainingBook/widget/multiCheckboxReport_widget.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../../controller/rapportSemestre1_controller.dart';
import '../../../model/rapport_semestre1_model.dart';
import '../../../shared/widget/customTextField.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import '../../espqceEPS/ficheDePresence/save_file_mobile.dart';

class ReportSemestreOneView extends StatefulWidget {
  const ReportSemestreOneView({super.key});

  @override
  State<ReportSemestreOneView> createState() => _ReportSemestreOneViewState();
}

class _ReportSemestreOneViewState extends State<ReportSemestreOneView> {
  List<Map<String, dynamic>> weekCheckBox = [];
  String base64pdf = "";
  ////////////////////
  Future<void> _generatePDF() async {
    final pdf = p.Document();

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
                            child: p.Text(intl.reportSemestre1,
                                textAlign: p.TextAlign.center,
                                style: const p.TextStyle(
                                    color: PdfColors.white, fontSize: 15)))
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
                                      style: const p.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(left: 10),
                                  child: p.Text(
                                      "Coach : ${_CoachController.text}",
                                      textAlign: p.TextAlign.center,
                                      style: const p.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(left: 10),
                                  child: p.Text(
                                      "Season : ${_SeasonController.text}",
                                      textAlign: p.TextAlign.center,
                                      style: const p.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 15)))
                            ])
                      ])),
              p.SizedBox(height: 30),
              p.Container(
                  width: 500,
                  child: p.Column(
                    children: (blocks).map((block) {
                      setState(() {
                        weekCheckBox = [];
                        weekCheckBox.add(block['weekCheckBox']);
                      });
                      print(weekCheckBox);
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
                                        style: const p.TextStyle(
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
    base64pdf = base64Encode(bytes);
    print(bytes);
    saveAndLaunchFile(bytes, "pdf11.pdf");
  }

  Future<File> createFileFromBase64String(
      String base64String, String fileName) async {
    final decodedBytes = base64Decode(base64String);
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName.pdf');
    await file.writeAsBytes(decodedBytes);
    return file;
  }

  //////////////////////
  RapportSmestre1Controller rapportSmestre1Controller =
      RapportSmestre1Controller();
  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    //if (!(_formKey.currentState?.validate() ?? false)) return;

    RapportSemestre1Model rapportSemestre1Model = RapportSemestre1Model(

        // id: 0, userId: 0
        /* id: widget.season?.id,
      name: nameController.text,
      description: descriptionController.text, */
        );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: rapportSmestre1Controller.add(rapportSemestre1Model),
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
        "${intl.july}26": false,
        "${intl.july}27": false,
        "${intl.july}28": false,
        "${intl.july}29": false,
        "${intl.august}30": false,
        "${intl.august}31": false,
        "${intl.august}32": false,
        "${intl.august}33": false,
        "${intl.september}34": false,
        "${intl.september}35": false,
        "${intl.september}36": false,
        "${intl.september}37": false,
        "${intl.october}38": false,
        "${intl.october}39": false,
        "${intl.october}40": false,
        "${intl.october}41": false,
        "${intl.november}42": false,
        "${intl.november}43": false,
        "${intl.november}44": false,
        "${intl.november}45": false,
        "${intl.december}46": false,
        "${intl.december}47": false,
        "${intl.december}48": false,
        "${intl.december}49": false,
        "${intl.december}50": false,
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
        'traningProgramController': "",
        'weekCheckBox': {
          "${intl.july}26": false,
          "${intl.july}27": false,
          "${intl.july}28": false,
          "${intl.july}29": false,
          "${intl.august}30": false,
          "${intl.august}31": false,
          "${intl.august}32": false,
          "${intl.august}33": false,
          "${intl.september}34": false,
          "${intl.september}35": false,
          "${intl.september}36": false,
          "${intl.september}37": false,
          "${intl.october}38": false,
          "${intl.october}39": false,
          "${intl.october}40": false,
          "${intl.october}41": false,
          "${intl.november}42": false,
          "${intl.november}43": false,
          "${intl.november}44": false,
          "${intl.november}45": false,
          "${intl.december}46": false,
          "${intl.december}47": false,
          "${intl.december}48": false,
          "${intl.december}49": false,
          "${intl.december}50": false,
        }
      }
    ];
  }

  void addBlock() {
    setState(() {
      blocks.add({
        'traningProgramController': "",
        'weekCheckBox': {
          "${intl.july}26": false,
          "${intl.july}27": false,
          "${intl.july}28": false,
          "${intl.july}29": false,
          "${intl.august}30": false,
          "${intl.august}31": false,
          "${intl.august}32": false,
          "${intl.august}33": false,
          "${intl.september}34": false,
          "${intl.september}35": false,
          "${intl.september}36": false,
          "${intl.september}37": false,
          "${intl.october}38": false,
          "${intl.october}39": false,
          "${intl.october}40": false,
          "${intl.october}41": false,
          "${intl.november}42": false,
          "${intl.november}43": false,
          "${intl.november}44": false,
          "${intl.november}45": false,
          "${intl.december}46": false,
          "${intl.december}47": false,
          "${intl.december}48": false,
          "${intl.december}49": false,
          "${intl.december}50": false,
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
      appBar: AppBar(title: Text(intl.reportSemestre1)),
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
                      hintText: intl.session,
                      labelText: intl.session,
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
                    text: '${intl.save}',
                    width: MediaQuery.of(context).size.width * 0.18,
                  ),
                  CustomButton(
                    onPressed: () {
                      _generatePDF();
                      /*  final file =
                          await createFileFromBase64String(base64pdf, "pdf1");
                      print(file.path);
                      //OpenFile.open(file.path);
                      await PDFView(
                        filePath: file.path,
                      ); */
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
