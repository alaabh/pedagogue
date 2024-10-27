import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:pedagogue/controller/planingLeasonService.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/model/planingLeason_model.dart';
import 'package:pedagogue/shared/widget/custom_button.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/style/app_color.dart';
import '../../../shared/widget/customTextField.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import '../../espqceEPS/ficheDePresence/save_file_mobile.dart';

class PlaningLeasonView extends StatefulWidget {
  final PlaningLeasonModel? planingLeasonModel;
  const PlaningLeasonView({super.key, this.planingLeasonModel});

  @override
  State<PlaningLeasonView> createState() => _PlaningLeasonViewState();
}

class _PlaningLeasonViewState extends State<PlaningLeasonView> {
  TextEditingController _ThemeController = TextEditingController(text: "");
  TextEditingController _CycleController = TextEditingController(text: "");
  TextEditingController _MaterialsController = TextEditingController(text: "");
  TextEditingController _TeamInformationsController =
      TextEditingController(text: "");
  TextEditingController _DecisionsController = TextEditingController(text: "");
  TextEditingController _Capacities1Controller =
      TextEditingController(text: "");
  TextEditingController _Capacities2Controller =
      TextEditingController(text: "");
  TextEditingController _Capacities3Controller =
      TextEditingController(text: "");
  TextEditingController _Capacities4Controller =
      TextEditingController(text: "");
  TextEditingController _Description1Controller =
      TextEditingController(text: "");
  TextEditingController _Description2Controller =
      TextEditingController(text: "");
  TextEditingController _Description3Controller =
      TextEditingController(text: "");
  TextEditingController _Description4Controller =
      TextEditingController(text: "");
  TextEditingController _Coaching1Controller = TextEditingController(text: "");
  TextEditingController _Coaching2Controller = TextEditingController(text: "");
  TextEditingController _Coaching3Controller = TextEditingController(text: "");
  TextEditingController _Coaching4Controller = TextEditingController(text: "");

  FilePickerResult? selectedFiles1;
  FilePickerResult? selectedFiles2;
  FilePickerResult? selectedFiles3;
  FilePickerResult? selectedFiles4;
  TextEditingController duration1Controller = TextEditingController(text: "");
  TextEditingController duration2Controller = TextEditingController(text: "");
  TextEditingController duration3Controller = TextEditingController(text: "");
  TextEditingController duration4Controller = TextEditingController(text: "");
  int indice = 0;

  Future _getFileFromGallery(FilePickerResult? selectedFiles) async {
    final result = await FilePicker.platform
        .pickFiles(withData: true); // allowMultiple is false by default
    if (result == null) {
      // User canceled the picker
    } else {
      setState(() {
        selectedFiles = result;
        // Assign the single selected file
      });
    }
    if (indice == 1) {
      selectedFiles1 = selectedFiles;
    }
    if (indice == 2) {
      selectedFiles2 = selectedFiles;
    }
    if (indice == 3) {
      selectedFiles3 = selectedFiles;
    }
    if (indice == 4) {
      selectedFiles4 = selectedFiles;
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    if (widget.planingLeasonModel != null) {
      _ThemeController.text = widget.planingLeasonModel!.theme ?? '';
      _CycleController.text = widget.planingLeasonModel!.cycle ?? '';
      _MaterialsController.text = widget.planingLeasonModel!.material ?? '';
      _TeamInformationsController.text = widget.planingLeasonModel!.team ?? '';

      _DecisionsController.text = widget.planingLeasonModel!.desicion ?? '';
      _Capacities1Controller.text =
          widget.planingLeasonModel!.Capacities1 ?? '';
      _Capacities2Controller.text =
          widget.planingLeasonModel!.Capacities2 ?? '';
      _Capacities3Controller.text =
          widget.planingLeasonModel!.Capacities3 ?? '';
      _Capacities4Controller.text =
          widget.planingLeasonModel!.Capacities4 ?? '';

      _Description1Controller.text =
          widget.planingLeasonModel!.Description1 ?? '';
      _Description2Controller.text =
          widget.planingLeasonModel!.Description2 ?? '';
      _Description3Controller.text =
          widget.planingLeasonModel!.Description3 ?? '';
      _Description4Controller.text =
          widget.planingLeasonModel!.Description4 ?? '';

      _Coaching1Controller.text = widget.planingLeasonModel!.Coaching1 ?? '';
      _Coaching2Controller.text = widget.planingLeasonModel!.Coaching2 ?? '';
      _Coaching3Controller.text = widget.planingLeasonModel!.Coaching3 ?? '';
      _Coaching4Controller.text = widget.planingLeasonModel!.Coaching4 ?? '';

      duration1Controller.text = widget.planingLeasonModel!.Duration1 ?? '';
      duration1Controller.text = widget.planingLeasonModel!.Duration2 ?? '';
      duration1Controller.text = widget.planingLeasonModel!.Duration3 ?? '';
      duration1Controller.text = widget.planingLeasonModel!.Duration4 ?? '';
    }
  }

  File? getFirstFile(FilePickerResult? selectedFiles) {
    // Check if there is any selected file and it has at least one file
    if (selectedFiles != null && selectedFiles.files.isNotEmpty) {
      // Get the first selected file
      PlatformFile platformFile = selectedFiles.files.first;

      // Check if the path of the selected file is not null
      if (platformFile.path != null) {
        // Convert the PlatformFile to a File and return it

        return File(platformFile.path!);
      }
    }
    // Return null if no file was selected or the file path is null
    return null;
  }

  PlaningLeasonController planingLeasonController = PlaningLeasonController();
  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    //if (!(_formKey.currentState?.validate() ?? false)) return;

    PlaningLeasonModel planingLeasonModel = PlaningLeasonModel(
      theme: _ThemeController.text,
      cycle: _CycleController.text,
      material: _MaterialsController.text,
      team: _TeamInformationsController.text,
      desicion: _DecisionsController.text,
      Capacities1: _Capacities1Controller.text,
      Capacities2: _Capacities2Controller.text,
      Capacities3: _Capacities3Controller.text,
      Capacities4: _Capacities4Controller.text,
      Description1: _Description1Controller.text,
      Description2: _Description2Controller.text,
      Description3: _Description3Controller.text,
      Description4: _Description4Controller.text,
      Coaching1: _Coaching1Controller.text,
      Coaching2: _Coaching2Controller.text,
      Coaching3: _Coaching3Controller.text,
      Coaching4: _Coaching4Controller.text,
      Duration1: duration1Controller.text,
      Duration2: duration2Controller.text,
      Duration3: duration3Controller.text,
      Duration4: duration4Controller.text,
      Organization1: getFirstFile(selectedFiles1),
      Organization2: getFirstFile(selectedFiles2),
      Organization3: getFirstFile(selectedFiles3),
      Organization4: getFirstFile(selectedFiles4),
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.planingLeasonModel != null
          ? planingLeasonController.update(planingLeasonModel)
          : planingLeasonController.add(planingLeasonModel),
      successFunction: () => Navigator.pop(context),
    );
  }

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
                      mainAxisAlignment: p.MainAxisAlignment.center,
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
              p.SizedBox(height: 10),
              p.Container(
                  height: 80,
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
                                      "${intl.theme} : ${_ThemeController.text}",
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
                                      "${intl.cycle}  : ${_CycleController.text}",
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
                                      "${intl.materials}  : ${_MaterialsController.text}",
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
              p.Container(
                  height: 80,
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
                                      "${intl.teamInformations}  : ${_TeamInformationsController.text}",
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
                                      "${intl.desicions}  : ${_DecisionsController.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontSize: 15))),
                            ])
                      ])),
              p.SizedBox(height: 10),

              p.Padding(
                  padding: const p.EdgeInsets.only(left: 10),
                  child: p.Text(intl.getingStarted,
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15))),
              p.SizedBox(height: 20),
              p.Container(
                  width: 500,
                  height: 400,
                  decoration: p.BoxDecoration(
                    border: p.Border.all(color: PdfColors.amberAccent),
                    borderRadius: p.BorderRadius.circular(4),
                    // Optional, for rounded corners
                  ),
                  child: p.Column(
                      mainAxisAlignment: p.MainAxisAlignment.center,
                      children: [
                        p.Container(
                            width: 500,
                            child: p.Column(children: [
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "${intl.capacities}  : ${_Capacities1Controller.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "${intl.description}  : ${_Description1Controller.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "${intl.coaching}  : ${_Coaching1Controller.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "File : ${selectedFiles1 == null ? "" : selectedFiles1!.files.first.name}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "${intl.duration}  : ${duration1Controller.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15))),
                            ])),
                      ])),
              p.SizedBox(height: 30),

              p.Padding(
                  padding: const p.EdgeInsets.only(left: 10),
                  child: p.Text(intl.wramUp,
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15))),
              p.SizedBox(height: 20),
              p.Container(
                  width: 500,
                  height: 400,
                  decoration: p.BoxDecoration(
                    border: p.Border.all(color: PdfColors.amberAccent),
                    borderRadius: p.BorderRadius.circular(4),
                    // Optional, for rounded corners
                  ),
                  child: p.Column(
                      mainAxisAlignment: p.MainAxisAlignment.center,
                      children: [
                        p.Container(
                            width: 500,
                            child: p.Column(children: [
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "${intl.capacities}  : ${_Capacities2Controller.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "${intl.description}  : ${_Description2Controller.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "${intl.coaching}  : ${_Coaching2Controller.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "File : ${selectedFiles2 == null ? "" : selectedFiles2!.files.first.name}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "${intl.duration}  : ${duration2Controller.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15))),
                            ])),
                      ])),
              p.SizedBox(height: 30),

              p.Padding(
                  padding: const p.EdgeInsets.only(left: 10),
                  child: p.Text(intl.bodyOfTheSession,
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15))),
              p.SizedBox(height: 20),
              p.Container(
                  width: 500,
                  height: 400,
                  decoration: p.BoxDecoration(
                    border: p.Border.all(color: PdfColors.amberAccent),
                    borderRadius: p.BorderRadius.circular(4),
                    // Optional, for rounded corners
                  ),
                  child: p.Column(
                      mainAxisAlignment: p.MainAxisAlignment.center,
                      children: [
                        p.Container(
                            width: 500,
                            child: p.Column(children: [
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "${intl.capacities}  : ${_Capacities3Controller.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "${intl.description}  : ${_Description3Controller.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "${intl.coaching}  : ${_Coaching3Controller.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "File : ${selectedFiles3 == null ? "" : selectedFiles3!.files.first.name}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "${intl.duration}  : ${duration3Controller.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15))),
                            ])),
                      ])),
              p.SizedBox(height: 30),

              p.Padding(
                  padding: const p.EdgeInsets.only(left: 10),
                  child: p.Text(intl.returnToCalm,
                      textAlign: p.TextAlign.center,
                      textDirection: langue == "ar"
                          ? p.TextDirection.rtl
                          : p.TextDirection.ltr,
                      style: p.TextStyle(
                          font: ttf, color: PdfColors.black, fontSize: 15))),
              p.SizedBox(height: 20),
              p.Container(
                  width: 500,
                  height: 400,
                  decoration: p.BoxDecoration(
                    border: p.Border.all(color: PdfColors.amberAccent),
                    borderRadius: p.BorderRadius.circular(4),
                    // Optional, for rounded corners
                  ),
                  child: p.Column(
                      mainAxisAlignment: p.MainAxisAlignment.center,
                      children: [
                        p.Container(
                            width: 500,
                            child: p.Column(children: [
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "${intl.capacities}  : ${_Capacities4Controller.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "${intl.description}  : ${_Description4Controller.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "${intl.coaching}  : ${_Coaching4Controller.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "File : ${selectedFiles4 == null ? "" : selectedFiles4!.files.first.name}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15))),
                              p.Padding(
                                  padding: const p.EdgeInsets.only(top: 10),
                                  child: p.Text(
                                      "${intl.duration}  : ${duration4Controller.text}",
                                      textAlign: p.TextAlign.center,
                                      textDirection: langue == "ar"
                                          ? p.TextDirection.rtl
                                          : p.TextDirection.ltr,
                                      style: p.TextStyle(
                                          font: ttf,
                                          color: PdfColors.black,
                                          fontWeight: p.FontWeight.bold,
                                          fontSize: 15))),
                            ])),
                      ])),

              /*  p.Container(
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
                  )), */
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "report_semestre2.pdf");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(intl.planingALeason)),
        body: SingleChildScrollView(
            child: Column(children: [
          Center(
              child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextField(
                  hintText: intl.theme,
                  labelText: intl.theme,
                  controller: _ThemeController,
                ),
                CustomTextField(
                  hintText: intl.cycle,
                  labelText: intl.cycle,
                  controller: _CycleController,
                ),
                CustomTextField(
                  hintText: intl.materials,
                  labelText: intl.materials,
                  controller: _MaterialsController,
                ),
                CustomTextField(
                  hintText: intl.teamInformations,
                  labelText: intl.teamInformations,
                  controller: _TeamInformationsController,
                ),
                CustomTextField(
                  hintText: intl.desicions,
                  labelText: intl.desicions,
                  controller: _DecisionsController,
                ),
              ],
            ),
          )),

          ///1
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(
                          top: 10), // Make space for the title
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(
                            4), // Optional, for rounded corners
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: CustomTextField(
                                  hintText: intl.capacities,
                                  labelText: intl.capacities,
                                  controller: _Capacities1Controller,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: CustomTextField(
                                  hintText: intl.description,
                                  labelText: intl.description,
                                  controller: _Description1Controller,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width * 0.4,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6))),
                                child: TextButton(
                                    onPressed: () async {
                                      setState(() {
                                        indice = 1;
                                      });
                                      await _getFileFromGallery(selectedFiles1);
                                    },
                                    child: SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            child: Text(intl.selectAfile,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Icon(Icons.upload_file,
                                              color: Colors.white, size: 20)
                                        ],
                                      ),
                                    )),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(selectedFiles1 != null
                                      ? selectedFiles1!.files.first.name
                                      : intl.noselectAfile)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: CustomTextField(
                                  hintText: intl.coaching,
                                  labelText: intl.coaching,
                                  controller: _Coaching1Controller,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: CustomInput(
                                      controller: duration1Controller,
                                      inputType: InputType.time))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0, // Adjust the position as needed
                      left:
                          20, // Adjust based on the container's margin and desired position
                      child: Container(
                        color: Colors
                            .white, // Match the background color of the surrounding area
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          intl.getingStarted, // Your title text here
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ////2
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(
                          top: 10), // Make space for the title
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(
                            4), // Optional, for rounded corners
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: CustomTextField(
                                  hintText: intl.capacities,
                                  labelText: intl.capacities,
                                  controller: _Capacities2Controller,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: CustomTextField(
                                  hintText: intl.description,
                                  labelText: intl.description,
                                  controller: _Description2Controller,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width * 0.4,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6))),
                                child: TextButton(
                                    onPressed: () async {
                                      setState(() {
                                        indice = 2;
                                      });
                                      await _getFileFromGallery(selectedFiles2);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Text(intl.selectAfile,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Icon(Icons.upload_file,
                                            color: Colors.white, size: 20)
                                      ],
                                    )),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(selectedFiles2 != null
                                      ? selectedFiles2!.files.first.name
                                      : intl.noselectAfile)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: CustomTextField(
                                  hintText: intl.coaching,
                                  labelText: intl.coaching,
                                  controller: _Coaching2Controller,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: CustomInput(
                                      controller: duration2Controller,
                                      inputType: InputType.time))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0, // Adjust the position as needed
                      left:
                          20, // Adjust based on the container's margin and desired position
                      child: Container(
                        color: Colors
                            .white, // Match the background color of the surrounding area
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          intl.wramUp, // Your title text here
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //////3
          ///
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(
                          top: 10), // Make space for the title
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(
                            4), // Optional, for rounded corners
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: CustomTextField(
                                  hintText: intl.capacities,
                                  labelText: intl.capacities,
                                  controller: _Capacities3Controller,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: CustomTextField(
                                  hintText: intl.description,
                                  labelText: intl.description,
                                  controller: _Description3Controller,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width * 0.4,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6))),
                                child: TextButton(
                                    onPressed: () async {
                                      setState(() {
                                        indice = 3;
                                      });
                                      await _getFileFromGallery(selectedFiles3);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Text(intl.selectAfile,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Icon(Icons.upload_file,
                                            color: Colors.white, size: 20)
                                      ],
                                    )),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(selectedFiles3 != null
                                      ? selectedFiles3!.files.first.name
                                      : intl.noselectAfile)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: CustomTextField(
                                  hintText: intl.coaching,
                                  labelText: intl.coaching,
                                  controller: _Coaching3Controller,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: CustomInput(
                                      controller: duration3Controller,
                                      inputType: InputType.time))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0, // Adjust the position as needed
                      left:
                          20, // Adjust based on the container's margin and desired position
                      child: Container(
                        color: Colors
                            .white, // Match the background color of the surrounding area
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          intl.bodyOfTheSession, // Your title text here
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          ////4
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(
                          top: 10), // Make space for the title
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(
                            4), // Optional, for rounded corners
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: CustomTextField(
                                  hintText: intl.capacities,
                                  labelText: intl.capacities,
                                  controller: _Capacities4Controller,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: CustomTextField(
                                  hintText: intl.description,
                                  labelText: intl.description,
                                  controller: _Description4Controller,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width * 0.4,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6))),
                                child: TextButton(
                                    onPressed: () async {
                                      setState(() {
                                        indice = 4;
                                      });
                                      await _getFileFromGallery(selectedFiles4);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Text(intl.selectAfile,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Icon(Icons.upload_file,
                                            color: Colors.white, size: 20)
                                      ],
                                    )),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(selectedFiles4 != null
                                      ? selectedFiles4!.files.first.name
                                      : intl.noselectAfile)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: CustomTextField(
                                  hintText: intl.coaching,
                                  labelText: intl.coaching,
                                  controller: _Coaching4Controller,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: CustomInput(
                                      controller: duration4Controller,
                                      inputType: InputType.time))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0, // Adjust the position as needed
                      left:
                          20, // Adjust based on the container's margin and desired position
                      child: Container(
                        color: Colors
                            .white, // Match the background color of the surrounding area
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          intl.returnToCalm, // Your title text here
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
                    submit();
                  },
                  text: '${intl.save}',
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
        ])));
  }
}
