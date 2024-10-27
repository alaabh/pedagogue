import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:pedagogue/feature/espqceEPS/ficheDePresence/save_file_mobile.dart';
import 'package:pedagogue/shared/style/app_color.dart';
import 'package:pedagogue/shared/widget/custom_button.dart';
import 'package:pedagogue/shared/widget/loading_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/joueur_controller.dart';
import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/shimmer/radio_widget_list.dart';

class WellnessQuestionnaire extends StatefulWidget {
  const WellnessQuestionnaire({super.key});

  @override
  State<WellnessQuestionnaire> createState() => _WellnessQuestionnaireState();
}

class _WellnessQuestionnaireState extends State<WellnessQuestionnaire> {
  String? oVERALL = "";
  String? pREVIOUS = "";
  String? eMOTIONS = "";
  String? calmandPeaceful = "";
  String? energetic = "";
  String? gloomy = "";
  String? angry = "";

  String? cHARACTER = "";
  String? optimism = "";
  String? motivation = "";
  String? self_Confidence = "";
  String? stress = "";
  String? connectWithFriends = "";
  String? competitiveness = "";
  String? dealWithSetbacks = "";

  JoueurController joueurController = JoueurController();

  bool playerLoader = false;

  List<String>? playerList = [];
  Future<void> loadData() async {
    await joueurController.getAll();

    setState(() {
      for (var element in joueurController.apiResponse.value.itemList) {
        // print(element.name);
        playerList!.add(element.firstName.toString());
      }
    });

    playerLoader = true;
  }

  final TextEditingController _Player = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController input1Controller = TextEditingController();
  final TextEditingController input2Controller = TextEditingController();
  final TextEditingController input3Controller = TextEditingController();
  final TextEditingController input4Controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
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
              p.SizedBox(height: 10),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text("${intl.player}",
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
                      child: p.Text(_Player.text,
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
                      width: 500,
                      child: p.Text("${intl.date}",
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
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text("${intl.wellnessQuestionnaire1}",
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
                      child: p.Text(pREVIOUS.toString(),
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
                      width: 500,
                      child: p.Text("${intl.wellnessQuestionnaire2}",
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
                      child: p.Text(oVERALL.toString(),
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
                      width: 500,
                      child: p.Text("${intl.wellnessQuestionnaire3}",
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
                      child: p.Text(eMOTIONS.toString(),
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
                      width: 500,
                      child: p.Text("${intl.wellnessQuestionnaire4}",
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
                      child: p.Text(calmandPeaceful.toString(),
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
                      width: 500,
                      child: p.Text("${intl.wellnessQuestionnaire5}",
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
                      child: p.Text(energetic.toString(),
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
                      width: 500,
                      child: p.Text("${intl.wellnessQuestionnaire6}",
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
                      child: p.Text(gloomy.toString(),
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text("${intl.wellnessQuestionnaire7}",
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
                      child: p.Text(angry.toString(),
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text("${intl.wellnessQuestionnaire8}",
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
                      child: p.Text(input1Controller.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text("${intl.wellnessQuestionnaire9}",
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
                      child: p.Text(input2Controller.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.Column(
                  mainAxisAlignment: p.MainAxisAlignment.spaceEvenly,
                  children: [
                    p.SizedBox(
                      width: 500,
                      child: p.Text("${intl.wellnessQuestionnaire10}",
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
                      child: p.Text(cHARACTER.toString(),
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
                      width: 500,
                      child: p.Text("${intl.wellnessQuestionnaire11}",
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
                      child: p.Text(optimism.toString(),
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
                      width: 500,
                      child: p.Text("${intl.wellnessQuestionnaire12}",
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
                      child: p.Text(motivation.toString(),
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
                      width: 500,
                      child: p.Text("${intl.wellnessQuestionnaire13}",
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
                      child: p.Text(self_Confidence.toString(),
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
                      width: 500,
                      child: p.Text("${intl.wellnessQuestionnaire14}",
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
                      child: p.Text(stress.toString(),
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
                      width: 500,
                      child: p.Text("${intl.wellnessQuestionnaire15}",
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
                      child: p.Text(connectWithFriends.toString(),
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
                      width: 500,
                      child: p.Text("${intl.wellnessQuestionnaire16}",
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
                      child: p.Text(competitiveness.toString(),
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
                      width: 500,
                      child: p.Text("${intl.wellnessQuestionnaire17}",
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
                      child: p.Text(dealWithSetbacks.toString(),
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
                      width: 500,
                      child: p.Text("${intl.wellnessQuestionnaire18}",
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
                      child: p.Text(input3Controller.text,
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
                      width: 500,
                      child: p.Text("${intl.wellnessQuestionnaire19}",
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
                      child: p.Text(input4Controller.text,
                          textAlign: p.TextAlign.center,
                          textDirection: langue == "ar"
                              ? p.TextDirection.rtl
                              : p.TextDirection.ltr,
                          style: p.TextStyle(
                              font: ttf, color: PdfColors.black, fontSize: 15)),
                    )
                  ]),
              p.SizedBox(height: 10),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "${intl.roleofaCoachList}.pdf");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.wellnessQuestionnaireList}")),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              Dimensions.verticalSpacingExtraLarge,
              playerLoader == true
                  ? CustomInput(
                      controller: _Player,
                      hint: "${intl.select(intl.player)}",
                      title: intl.player,
                      inputType: InputType.dropdown,
                      dropdownItems: playerList,
                    )
                  : LoadingWidget(),
              Dimensions.verticalSpacingExtraLarge,
              CustomInput(
                controller: dateController,
                hint: "${intl.select(intl.date)}",
                title: intl.date,
                inputType: InputType.date,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Container(
                child: RadioWidgetList(
                  onChanged: (value) {
                    setState(() {
                      pREVIOUS = value;
                    });
                  },
                  selectedValue: pREVIOUS,
                  orientation: Axis.horizontal,
                  title: "${intl.wellnessQuestionnaire1}",
                  values: [
                    "${intl.vERYPOOR}",
                    "${intl.pOOR}",
                    "${intl.oKAY}",
                    "${intl.gOOD}",
                    "${intl.eXCELLENT}",
                    "${intl.nOTSURE}",
                  ],
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Container(
                child: RadioWidgetList(
                  onChanged: (value) {
                    setState(() {
                      oVERALL = value;
                    });
                  },
                  selectedValue: oVERALL,
                  orientation: Axis.horizontal,
                  title: "${intl.wellnessQuestionnaire2}",
                  values: [
                    "${intl.vERYPOOR}",
                    "${intl.pOOR}",
                    "${intl.oKAY}",
                    "${intl.gOOD}",
                    "${intl.eXCELLENT}",
                    "${intl.nOTSURE}",
                  ],
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Container(
                child: RadioWidgetList(
                  onChanged: (value) {
                    setState(() {
                      eMOTIONS = value;
                    });
                  },
                  selectedValue: eMOTIONS,
                  orientation: Axis.horizontal,
                  title: "${intl.wellnessQuestionnaire3}",
                  values: [
                    "${intl.vERYPOOR}",
                    "${intl.pOOR}",
                    "${intl.oKAY}",
                    "${intl.gOOD}",
                    "${intl.eXCELLENT}",
                    "${intl.nOTSURE}",
                  ],
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Container(
                child: RadioWidgetList(
                  onChanged: (value) {
                    setState(() {
                      calmandPeaceful = value;
                    });
                  },
                  selectedValue: calmandPeaceful,
                  orientation: Axis.horizontal,
                  title: "${intl.wellnessQuestionnaire4}",
                  values: [
                    "${intl.vERYPOOR}",
                    "${intl.pOOR}",
                    "${intl.oKAY}",
                    "${intl.gOOD}",
                    "${intl.eXCELLENT}",
                    "${intl.nOTSURE}",
                  ],
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Container(
                child: RadioWidgetList(
                  onChanged: (value) {
                    setState(() {
                      energetic = value;
                    });
                  },
                  selectedValue: energetic,
                  orientation: Axis.horizontal,
                  title: "${intl.wellnessQuestionnaire5}",
                  values: [
                    "${intl.vERYPOOR}",
                    "${intl.pOOR}",
                    "${intl.oKAY}",
                    "${intl.gOOD}",
                    "${intl.eXCELLENT}",
                    "${intl.nOTSURE}",
                  ],
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Container(
                child: RadioWidgetList(
                  onChanged: (value) {
                    setState(() {
                      gloomy = value;
                    });
                  },
                  selectedValue: gloomy,
                  orientation: Axis.horizontal,
                  title: "${intl.wellnessQuestionnaire6}",
                  values: [
                    "${intl.vERYPOOR}",
                    "${intl.pOOR}",
                    "${intl.oKAY}",
                    "${intl.gOOD}",
                    "${intl.eXCELLENT}",
                    "${intl.nOTSURE}",
                  ],
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Container(
                child: RadioWidgetList(
                  onChanged: (value) {
                    setState(() {
                      angry = value;
                    });
                  },
                  selectedValue: angry,
                  orientation: Axis.horizontal,
                  title: "${intl.wellnessQuestionnaire7}",
                  values: [
                    "${intl.vERYPOOR}",
                    "${intl.pOOR}",
                    "${intl.oKAY}",
                    "${intl.gOOD}",
                    "${intl.eXCELLENT}",
                    "${intl.nOTSURE}",
                  ],
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Text(
                "${intl.wellnessQuestionnaire8}",
                style: TextStyle(
                    color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              ),
              Dimensions.verticalSpacingExtraLarge,
              TextField(
                controller: input1Controller,
                decoration: const InputDecoration(),
                autofocus: false,
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Text(
                "${intl.wellnessQuestionnaire9}",
                style: TextStyle(
                    color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              ),
              Dimensions.verticalSpacingExtraLarge,
              TextField(
                controller: input2Controller,
                decoration: const InputDecoration(),
                autofocus: false,
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Container(
                child: RadioWidgetList(
                  onChanged: (value) {
                    setState(() {
                      cHARACTER = value;
                    });
                  },
                  selectedValue: cHARACTER,
                  orientation: Axis.horizontal,
                  title: "${intl.wellnessQuestionnaire10}",
                  values: [
                    "${intl.vERYPOOR}",
                    "${intl.pOOR}",
                    "${intl.oKAY}",
                    "${intl.gOOD}",
                    "${intl.eXCELLENT}",
                    "${intl.nOTSURE}",
                  ],
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Container(
                child: RadioWidgetList(
                  onChanged: (value) {
                    setState(() {
                      optimism = value;
                    });
                  },
                  selectedValue: optimism,
                  orientation: Axis.horizontal,
                  title: "${intl.wellnessQuestionnaire11}",
                  values: [
                    "${intl.vERYPOOR}",
                    "${intl.pOOR}",
                    "${intl.oKAY}",
                    "${intl.gOOD}",
                    "${intl.eXCELLENT}",
                    "${intl.nOTSURE}",
                  ],
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Container(
                child: RadioWidgetList(
                  onChanged: (value) {
                    setState(() {
                      motivation = value;
                    });
                  },
                  selectedValue: motivation,
                  orientation: Axis.horizontal,
                  title: "${intl.wellnessQuestionnaire12}",
                  values: [
                    "${intl.vERYPOOR}",
                    "${intl.pOOR}",
                    "${intl.oKAY}",
                    "${intl.gOOD}",
                    "${intl.eXCELLENT}",
                    "${intl.nOTSURE}",
                  ],
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Container(
                child: RadioWidgetList(
                  onChanged: (value) {
                    setState(() {
                      self_Confidence = value;
                    });
                  },
                  selectedValue: self_Confidence,
                  orientation: Axis.horizontal,
                  title: "${intl.wellnessQuestionnaire13}",
                  values: [
                    "${intl.vERYPOOR}",
                    "${intl.pOOR}",
                    "${intl.oKAY}",
                    "${intl.gOOD}",
                    "${intl.eXCELLENT}",
                    "${intl.nOTSURE}",
                  ],
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Container(
                child: RadioWidgetList(
                  onChanged: (value) {
                    setState(() {
                      stress = value;
                    });
                  },
                  selectedValue: stress,
                  orientation: Axis.horizontal,
                  title: "${intl.wellnessQuestionnaire14}",
                  values: [
                    "${intl.vERYPOOR}",
                    "${intl.pOOR}",
                    "${intl.oKAY}",
                    "${intl.gOOD}",
                    "${intl.eXCELLENT}",
                    "${intl.nOTSURE}",
                  ],
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Container(
                child: RadioWidgetList(
                  onChanged: (value) {
                    setState(() {
                      connectWithFriends = value;
                    });
                  },
                  selectedValue: connectWithFriends,
                  orientation: Axis.horizontal,
                  title: "${intl.wellnessQuestionnaire15}",
                  values: [
                    "${intl.vERYPOOR}",
                    "${intl.pOOR}",
                    "${intl.oKAY}",
                    "${intl.gOOD}",
                    "${intl.eXCELLENT}",
                    "${intl.nOTSURE}",
                  ],
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Container(
                child: RadioWidgetList(
                  onChanged: (value) {
                    setState(() {
                      competitiveness = value;
                    });
                  },
                  selectedValue: competitiveness,
                  orientation: Axis.horizontal,
                  title: "${intl.wellnessQuestionnaire16}",
                  values: [
                    "${intl.vERYPOOR}",
                    "${intl.pOOR}",
                    "${intl.oKAY}",
                    "${intl.gOOD}",
                    "${intl.eXCELLENT}",
                    "${intl.nOTSURE}",
                  ],
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Container(
                child: RadioWidgetList(
                  onChanged: (value) {
                    setState(() {
                      dealWithSetbacks = value;
                    });
                  },
                  selectedValue: dealWithSetbacks,
                  orientation: Axis.horizontal,
                  title: "${intl.wellnessQuestionnaire17}",
                  values: [
                    "${intl.vERYPOOR}",
                    "${intl.pOOR}",
                    "${intl.oKAY}",
                    "${intl.gOOD}",
                    "${intl.eXCELLENT}",
                    "${intl.nOTSURE}",
                  ],
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Text(
                "${intl.wellnessQuestionnaire18}",
                style: TextStyle(
                    color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              ),
              Dimensions.verticalSpacingExtraLarge,
              TextField(
                controller: input3Controller,
                decoration: const InputDecoration(),
                autofocus: false,
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Text(
                "${intl.wellnessQuestionnaire19}",
                style: TextStyle(
                    color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              ),
              Dimensions.verticalSpacingExtraLarge,
              TextField(
                controller: input4Controller,
                decoration: const InputDecoration(),
                autofocus: false,
                maxLines: null,
                keyboardType: TextInputType.multiline,
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
