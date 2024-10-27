import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../l10n/localization.dart';
import '../../../shared/Widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../model/fiche_pedagogue_model.dart';
import 'ficheDePresence/save_file_mobile.dart';

class FichePedagogique extends StatefulWidget {
    final FichePedagogue? fichePedagogue;

  const FichePedagogique({super.key, this.fichePedagogue});

  @override
  State<FichePedagogique> createState() => _FichePedagogiqueState();
}

class _FichePedagogiqueState extends State<FichePedagogique> {
  Future<void> _generatePDF() async {
    final font = await rootBundle.load("assets/JannaLT-Regular.ttf");
    final ttf = p.Font.ttf(font);
    final pdf = p.Document();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langue = prefs.getString('SAVED_LOCALIZATION');
    print(langue);
    final netImage1 = await networkImage(
        'https://www.mobile.sportspedagogue.com/3_${intl.imgLang}.png');
    final netImage2 = await networkImage(
        'https://www.mobile.sportspedagogue.com/4_${intl.imgLang}.png');
    final netImage3 = await networkImage(
        'https://www.mobile.sportspedagogue.com/5_${intl.imgLang}.png');
    final netImage4 = await networkImage(
        'https://www.mobile.sportspedagogue.com/6_${intl.imgLang}.png');
    p.Widget buildTextField(String title, String labelText) {
      return p.Column(
        crossAxisAlignment: p.CrossAxisAlignment.start,
        children: [
          p.Container(
              color: PdfColors.amber,
              height: 50,
              width: 500,
              child: p.Row(
                  mainAxisAlignment: p.MainAxisAlignment.center,
                  children: [
                    p.Padding(
                        padding: const p.EdgeInsets.only(left: 10),
                        child: p.Text(title,
                            textAlign: p.TextAlign.center,
                            textDirection: langue == "ar"
                                ? p.TextDirection.rtl
                                : p.TextDirection.ltr,
                            style: p.TextStyle(
                                font: ttf,
                                color: PdfColors.white,
                                fontSize: 15)))
                  ])),
          p.SizedBox(
            width: 500,
            child: p.Text(labelText,
                textAlign: p.TextAlign.center,
                textDirection:
                    langue == "ar" ? p.TextDirection.rtl : p.TextDirection.ltr,
                style: p.TextStyle(
                    font: ttf, color: PdfColors.black, fontSize: 15)),
          ),
          p.SizedBox(height: 10),
        ],
      );
    }

    p.Widget buildCard(
      String title,
      String abilities,
      String conditions,
      String duration,
      String success,
    ) {
      return p.Column(
        crossAxisAlignment: p.CrossAxisAlignment.start,
        children: [
          p.SizedBox(height: 50),
          p.Container(
              color: PdfColors.amber,
              height: 50,
              width: 500,
              child: p.Row(
                  mainAxisAlignment: p.MainAxisAlignment.center,
                  children: [
                    p.Padding(
                        padding: const p.EdgeInsets.only(left: 10),
                        child: p.Text(title,
                            textAlign: p.TextAlign.center,
                            textDirection: langue == "ar"
                                ? p.TextDirection.rtl
                                : p.TextDirection.ltr,
                            style: p.TextStyle(
                                font: ttf,
                                color: PdfColors.white,
                                fontSize: 15)))
                  ])),
          p.SizedBox(
            width: 500,
            child: p.Text("${intl.capacities}:\n$abilities",
                textAlign: p.TextAlign.center,
                textDirection:
                    langue == "ar" ? p.TextDirection.rtl : p.TextDirection.ltr,
                style: p.TextStyle(
                    font: ttf, color: PdfColors.black, fontSize: 15)),
          ),
          p.SizedBox(height: 10),
          p.SizedBox(
            width: 500,
            child: p.Text("${intl.competitions}:\n$conditions",
                textAlign: p.TextAlign.center,
                textDirection:
                    langue == "ar" ? p.TextDirection.rtl : p.TextDirection.ltr,
                style: p.TextStyle(
                    font: ttf, color: PdfColors.black, fontSize: 15)),
          ),
          p.SizedBox(height: 10),
          p.SizedBox(
            width: 500,
            child: p.Text("${intl.duration}:\n$duration",
                textAlign: p.TextAlign.center,
                textDirection:
                    langue == "ar" ? p.TextDirection.rtl : p.TextDirection.ltr,
                style: p.TextStyle(
                    font: ttf, color: PdfColors.black, fontSize: 15)),
          ),
          p.SizedBox(height: 10),
          p.SizedBox(
            width: 500,
            child: p.Text("${intl.successCriteria}:\n$success",
                textAlign: p.TextAlign.center,
                textDirection:
                    langue == "ar" ? p.TextDirection.rtl : p.TextDirection.ltr,
                style: p.TextStyle(
                    font: ttf, color: PdfColors.black, fontSize: 15)),
          ),
          p.SizedBox(height: 10),
        ],
      );
    }

    pdf.addPage(
      p.MultiPage(
          maxPages: 200,
          pageFormat: PdfPageFormat.a4,
          build: (p.Context context) {
            return <p.Widget>[
              buildTextField(intl.classe,
                  _controllers['${intl.classe.toLowerCase()}']!.text),
              buildTextField(intl.scholasticYear,
                  _controllers['${intl.scholasticYear.toLowerCase()}']!.text),
              buildTextField(intl.cycle,
                  _controllers['${intl.cycle.toLowerCase()}']!.text),
              buildTextField(intl.effectif,
                  _controllers['${intl.effectif.toLowerCase()}']!.text),
              buildTextField(
                  intl.date, _controllers['${intl.date.toLowerCase()}']!.text),
              buildTextField(
                  intl.time, _controllers['${intl.time.toLowerCase()}']!.text),
              buildTextField(intl.materials,
                  _controllers['${intl.materials.toLowerCase()}']!.text),
              p.SizedBox(height: 50),
              buildCard(
                intl.getingStarted,
                _controllers["${intl.getingStarted.toLowerCase()}Abilities"]!
                    .text,
                _controllers[
                        "${intl.getingStarted.toLowerCase()}Conditions realization"]!
                    .text,
                _controllers["${intl.getingStarted.toLowerCase()}Duration"]!
                    .text,
                _controllers[
                        "${intl.getingStarted.toLowerCase()}Success Criteria"]!
                    .text,
              ),
              p.SizedBox(height: 50),
              buildCard(
                intl.wramUp,
                _controllers["${intl.wramUp.toLowerCase()}Abilities"]!.text,
                _controllers[
                        "${intl.wramUp.toLowerCase()}Conditions realization"]!
                    .text,
                _controllers["${intl.wramUp.toLowerCase()}Duration"]!.text,
                _controllers["${intl.wramUp.toLowerCase()}Success Criteria"]!
                    .text,
              ),
              p.SizedBox(height: 50),
              buildCard(
                intl.bodyOfTheSession,
                _controllers["${intl.bodyOfTheSession.toLowerCase()}Abilities"]!
                    .text,
                _controllers[
                        "${intl.bodyOfTheSession.toLowerCase()}Conditions realization"]!
                    .text,
                _controllers["${intl.bodyOfTheSession.toLowerCase()}Duration"]!
                    .text,
                _controllers[
                        "${intl.bodyOfTheSession.toLowerCase()}Success Criteria"]!
                    .text,
              ),
              p.SizedBox(height: 50),
              buildCard(
                intl.returnToCalm,
                _controllers["${intl.returnToCalm.toLowerCase()}Abilities"]!
                    .text,
                _controllers[
                        "${intl.returnToCalm.toLowerCase()}Conditions realization"]!
                    .text,
                _controllers["${intl.returnToCalm.toLowerCase()}Duration"]!
                    .text,
                _controllers[
                        "${intl.returnToCalm.toLowerCase()}Success Criteria"]!
                    .text,
              ),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "${intl.fichePedagogique}");
  }

  final _formKey = GlobalKey<FormState>();
  String? _fileName1;
  String? _fileName2;
  String? _fileName3;
  String? _fileName4;

  // Map to hold controllers to avoid redundancy
  Map<String, TextEditingController> _controllers = {
    '${intl.classe.toLowerCase()}': TextEditingController(),
    '${intl.scholasticYear.toLowerCase()}': TextEditingController(),
    '${intl.cycle.toLowerCase()}': TextEditingController(),
    '${intl.effectif.toLowerCase()}': TextEditingController(),
    '${intl.date.toLowerCase()}': TextEditingController(),
    '${intl.time.toLowerCase()}': TextEditingController(),
    '${intl.materials.toLowerCase()}': TextEditingController(),

    //////////////
    '${intl.getingStarted.toLowerCase()}Abilities': TextEditingController(),
    '${intl.getingStarted.toLowerCase()}Conditions realization':
        TextEditingController(),
    '${intl.getingStarted.toLowerCase()}Duration': TextEditingController(),
    '${intl.getingStarted.toLowerCase()}Success Criteria':
        TextEditingController(),
    //////////
    //////////////
    '${intl.wramUp.toLowerCase()}Abilities': TextEditingController(),
    '${intl.wramUp.toLowerCase()}Conditions realization':
        TextEditingController(),
    '${intl.wramUp.toLowerCase()}Duration': TextEditingController(),
    '${intl.wramUp.toLowerCase()}Success Criteria': TextEditingController(),
    //////////
    //////////////
    '${intl.bodyOfTheSession.toLowerCase()}Abilities': TextEditingController(),
    '${intl.bodyOfTheSession.toLowerCase()}Conditions realization':
        TextEditingController(),
    '${intl.bodyOfTheSession.toLowerCase()}Duration': TextEditingController(),
    '${intl.bodyOfTheSession.toLowerCase()}Success Criteria':
        TextEditingController(),
    //////////
    //////////////
    '${intl.returnToCalm.toLowerCase()}Abilities': TextEditingController(),
    '${intl.returnToCalm.toLowerCase()}Conditions realization':
        TextEditingController(),
    '${intl.returnToCalm.toLowerCase()}Duration': TextEditingController(),
    '${intl.returnToCalm.toLowerCase()}Success Criteria':
        TextEditingController(),
    //////////
  };

  @override
  void dispose() {
    _controllers.forEach((key, controller) => controller.dispose());
    super.dispose();
  }

  Future<void> _pickFile(String? _fileName) async {
    print(_fileName);
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        if (_fileName == "1") {
          _fileName1 = result.files.single.name;
          print(_fileName1);
        }
        if (_fileName == "2") {
          _fileName2 = result.files.single.name;
        }
        if (_fileName == "3") {
          _fileName3 = result.files.single.name;
        }
        if (_fileName == "4") {
          _fileName4 = result.files.single.name;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.fichePedagogique),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextField(
                    intl.classe.toLowerCase(), intl.classe, InputType.text),
                buildTextField(intl.scholasticYear.toLowerCase(),
                    intl.scholasticYear, InputType.text),
                buildTextField(
                    intl.cycle.toLowerCase(), intl.cycle, InputType.text),
                buildTextField(
                    intl.effectif.toLowerCase(), intl.effectif, InputType.text),
                buildTextField(
                    intl.date.toLowerCase(), intl.date, InputType.date),
                buildTextField(
                    intl.time.toLowerCase(), intl.time, InputType.time),
                buildTextField(intl.material.toLowerCase(), intl.materials,
                    InputType.text),
                buildCardSection(intl.getingStarted, "1", _fileName1),
                buildCardSection(intl.wramUp, "2", _fileName2),
                buildCardSection(intl.bodyOfTheSession, "3", _fileName3),
                buildCardSection(intl.returnToCalm, "4", _fileName4),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(child: _buildSubmitButton()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String controllerKey, String labelText, InputType inputTupe) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        CustomInput(
            controller: _controllers[controllerKey], inputType: inputTupe),
        SizedBox(height: 7),
      ],
    );
  }

  Widget buildCardSection(String title, String? _fileName, String? fichierUrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Card(
          margin: EdgeInsets.all(8),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextField('${title.toLowerCase()}Abilities',
                    intl.capacities, InputType.text),
                buildTextField('${title.toLowerCase()}Conditions realization',
                    intl.conditionsRealization, InputType.text),
                buildTextField('${title.toLowerCase()}Duration', intl.duration,
                    InputType.time),
                buildTextField('${title.toLowerCase()}Success Criteria',
                    intl.successCriteria, InputType.text),
                if (_fileName != null) Text("$fichierUrl"),
                ElevatedButton(
                  onPressed: () {
                    _pickFile(_fileName);
                    print(_fileName);
                  },
                  child: Text(intl.selectAfile),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return CustomButton(
      text: intl.save,
      onPressed: () {
        _generatePDF();
      },
    );
  }
}
