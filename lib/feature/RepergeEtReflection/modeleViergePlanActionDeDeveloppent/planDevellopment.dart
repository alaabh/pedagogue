import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:pedagogue/controller/joueur_controller.dart';
import 'package:pedagogue/feature/RepergeEtReflection/modeleViergePlanActionDeDeveloppent/techniqueTactique.dart';
import 'package:pedagogue/shared/style/dimensions.dart';
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/team_controller.dart';
import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';
import '../../espqceEPS/ficheDePresence/save_file_mobile.dart';
import '../../home/tabs/home/statistics_game_live/widgets/image_picker_element_widget.dart';

class planDevelloppment extends StatefulWidget {
  const planDevelloppment({super.key});

  @override
  State<planDevelloppment> createState() => _planDevelloppmentState();
}

class _planDevelloppmentState extends State<planDevelloppment> {
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  List<String> titleCardList = [
    "${intl.iNDIVIDUALDEVELOPMENTPLAN1}",
    "${intl.iNDIVIDUALDEVELOPMENTPLAN2} 1",
    "${intl.iNDIVIDUALDEVELOPMENTPLAN2} 2",
    "${intl.iNDIVIDUALDEVELOPMENTPLAN2} 3",
  ];
  Map<String, dynamic> titleCardControllerList = {
    "${intl.iNDIVIDUALDEVELOPMENTPLAN1}": TextEditingController(),
    "${intl.iNDIVIDUALDEVELOPMENTPLAN2} 1": TextEditingController(),
    "${intl.iNDIVIDUALDEVELOPMENTPLAN2} 2": TextEditingController(),
    "${intl.iNDIVIDUALDEVELOPMENTPLAN2} 3": TextEditingController(),
  };
  List<String> pOSITIONSList = [
    "${intl.iNDIVIDUALDEVELOPMENTPLAN5}",
    "${intl.iNDIVIDUALDEVELOPMENTPLAN55}",
    "${intl.iNDIVIDUALDEVELOPMENTPLAN6}",
    "${intl.iNDIVIDUALDEVELOPMENTPLAN7}",
    "point",
    "${intl.iNDIVIDUALDEVELOPMENTPLAN8}",
    "${intl.iNDIVIDUALDEVELOPMENTPLAN9}",
    "${intl.iNDIVIDUALDEVELOPMENTPLAN10}",
    "${intl.iNDIVIDUALDEVELOPMENTPLAN11}",
    "${intl.iNDIVIDUALDEVELOPMENTPLAN12}",
    "${intl.iNDIVIDUALDEVELOPMENTPLAN13}",
    "${intl.iNDIVIDUALDEVELOPMENTPLAN14}",
    "${intl.iNDIVIDUALDEVELOPMENTPLAN15}",
  ];
  Map<String, dynamic> pOSITIONSControllerList = {
    "${intl.iNDIVIDUALDEVELOPMENTPLAN5}": TextEditingController(),
    "${intl.iNDIVIDUALDEVELOPMENTPLAN55}": TextEditingController(),
    "${intl.iNDIVIDUALDEVELOPMENTPLAN6}": TextEditingController(),
    "${intl.iNDIVIDUALDEVELOPMENTPLAN7}": TextEditingController(),
    "${intl.iNDIVIDUALDEVELOPMENTPLAN8}": TextEditingController(),
    "${intl.iNDIVIDUALDEVELOPMENTPLAN9}": TextEditingController(),
    "${intl.iNDIVIDUALDEVELOPMENTPLAN10}": TextEditingController(),
    "${intl.iNDIVIDUALDEVELOPMENTPLAN11}": TextEditingController(),
    "${intl.iNDIVIDUALDEVELOPMENTPLAN12}": TextEditingController(),
    "${intl.iNDIVIDUALDEVELOPMENTPLAN13}": TextEditingController(),
    "${intl.iNDIVIDUALDEVELOPMENTPLAN14}": TextEditingController(),
    "${intl.iNDIVIDUALDEVELOPMENTPLAN15}": TextEditingController(),
  };
  XFile? selectedImage1Path;
  Future<void> _generatePDF() async {
    final font = await rootBundle.load("assets/JannaLT-Regular.ttf");
    final ttf = p.Font.ttf(font);
    final pdf = p.Document();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langue = prefs.getString('SAVED_LOCALIZATION');
    print(langue);
    final netImage1 = await networkImage(
        'https://www.mobile.sportspedagogue.com/66_${intl.imgLang}.png');

    pdf.addPage(
      p.MultiPage(
          maxPages: 200,
          pageFormat: PdfPageFormat.a4,
          build: (p.Context context) {
            return <p.Widget>[
              p.Column(
                children: [
                  p.Column(
                    children: titleCardList
                        .map(
                          (item) => p.Column(
                            children: [
                              p.SizedBox(height: 10),
                              p.Container(
                                  color: PdfColors.amber,
                                  height: 50,
                                  width: 500,
                                  child: p.Row(
                                      mainAxisAlignment:
                                          p.MainAxisAlignment.center,
                                      children: [
                                        p.Padding(
                                            padding: const p.EdgeInsets.only(
                                                left: 10),
                                            child: p.Text("$item",
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
                              p.SizedBox(
                                width: 500,
                                child: p.Text(
                                    "${intl.iNDIVIDUALDEVELOPMENTPLAN3}",
                                    textAlign: p.TextAlign.center,
                                    textDirection: langue == "ar"
                                        ? p.TextDirection.rtl
                                        : p.TextDirection.ltr,
                                    style: p.TextStyle(
                                        font: ttf,
                                        color: PdfColors.deepOrange800,
                                        fontSize: 15)),
                              ),
                              p.SizedBox(
                                width: 500,
                                child: p.Text(
                                    titleCardControllerList[item].text,
                                    textAlign: p.TextAlign.center,
                                    textDirection: langue == "ar"
                                        ? p.TextDirection.rtl
                                        : p.TextDirection.ltr,
                                    style: p.TextStyle(
                                        font: ttf,
                                        color: PdfColors.black,
                                        fontSize: 15)),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                  p.SizedBox(height: 10),
                  p.SizedBox(
                    width: 500,
                    child: p.Text("${intl.player}",
                        textAlign: p.TextAlign.center,
                        textDirection: langue == "ar"
                            ? p.TextDirection.rtl
                            : p.TextDirection.ltr,
                        style: p.TextStyle(
                            font: ttf,
                            color: PdfColors.deepOrange800,
                            fontSize: 15)),
                  ),
                  p.SizedBox(
                    width: 500,
                    child: p.Text(_Joueur.text,
                        textAlign: p.TextAlign.center,
                        textDirection: langue == "ar"
                            ? p.TextDirection.rtl
                            : p.TextDirection.ltr,
                        style: p.TextStyle(
                            font: ttf, color: PdfColors.black, fontSize: 15)),
                  ),
                  p.SizedBox(height: 10),
                  p.SizedBox(
                    width: 500,
                    child: p.Text("${intl.date}",
                        textAlign: p.TextAlign.center,
                        textDirection: langue == "ar"
                            ? p.TextDirection.rtl
                            : p.TextDirection.ltr,
                        style: p.TextStyle(
                            font: ttf,
                            color: PdfColors.deepOrange800,
                            fontSize: 15)),
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
                  ),
                  p.SizedBox(height: 10),
                  p.SizedBox(
                    width: 500,
                    child: p.Text("${intl.coach}",
                        textAlign: p.TextAlign.center,
                        textDirection: langue == "ar"
                            ? p.TextDirection.rtl
                            : p.TextDirection.ltr,
                        style: p.TextStyle(
                            font: ttf,
                            color: PdfColors.deepOrange800,
                            fontSize: 15)),
                  ),
                  p.SizedBox(
                    width: 500,
                    child: p.Text(coachController.text,
                        textAlign: p.TextAlign.center,
                        textDirection: langue == "ar"
                            ? p.TextDirection.rtl
                            : p.TextDirection.ltr,
                        style: p.TextStyle(
                            font: ttf, color: PdfColors.black, fontSize: 15)),
                  ),
                  p.SizedBox(height: 10),
                  selectedImage1Path == null
                      ? p.Container()
                      : p.Image(
                          p.MemoryImage(
                              File(selectedImage1Path!.path).readAsBytesSync()),
                          width: 500,
                          height: 200),
                  p.SizedBox(height: 10),
                  p.Column(
                    children: pOSITIONSList
                        .map(
                          (item) => item == "point"
                              ? p.Image(netImage1, width: 500, height: 200)
                              : p.Column(
                                  children: [
                                    p.SizedBox(height: 10),
                                    p.SizedBox(
                                      width: 500,
                                      child: p.Text("$item",
                                          textAlign: p.TextAlign.center,
                                          textDirection: langue == "ar"
                                              ? p.TextDirection.rtl
                                              : p.TextDirection.ltr,
                                          style: p.TextStyle(
                                              font: ttf,
                                              color: PdfColors.deepOrange800,
                                              fontSize: 15)),
                                    ),
                                    p.SizedBox(
                                      width: 500,
                                      child: p.Text(
                                          pOSITIONSControllerList[item].text,
                                          textAlign: p.TextAlign.center,
                                          textDirection: langue == "ar"
                                              ? p.TextDirection.rtl
                                              : p.TextDirection.ltr,
                                          style: p.TextStyle(
                                              font: ttf,
                                              color: PdfColors.black,
                                              fontSize: 15)),
                                    ),
                                  ],
                                ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(bytes, "${intl.feedbackList}");
  }

  TextEditingController dateController = TextEditingController();
  TextEditingController coachController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.iNDIVIDUALDEVELOPMENTPLANList}")),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              Column(
                children: titleCardList
                    .map(
                      (item) => Column(
                        children: [
                          Dimensions.verticalSpacingExtraLarge,
                          Card(
                            color: AppColors.primaryColor,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(child: Center(child: Text(item))),
                                ],
                              ),
                            ),
                          ),
                          Dimensions.verticalSpacingExtraLarge,
                          Text(
                            "${intl.iNDIVIDUALDEVELOPMENTPLAN3}",
                            style: TextStyle(
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          TextField(
                            keyboardType: TextInputType.multiline,
                            controller: titleCardControllerList[item],
                            decoration: const InputDecoration(),
                            autofocus: false,
                            maxLines: null,
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),

              Dimensions.verticalSpacingExtraLarge,

              CustomInput(
                controller: _Joueur,
                hint: "${intl.player}",
                title: "${intl.player}",
                inputType: InputType.text,
              ),
              Dimensions.verticalSpacingExtraLarge,

              CustomInput(
                controller: dateController,
                hint: "${intl.date}",
                title: "${intl.date}",
                inputType: InputType.date,
              ),
              Dimensions.verticalSpacingExtraLarge,

              CustomInput(
                controller: coachController,
                hint: "${intl.coach}",
                title: "${intl.coach}",
                inputType: InputType.text,
              ),
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
                          child: Center(
                              child:
                                  Text("${intl.iNDIVIDUALDEVELOPMENTPLAN4}"))),
                    ],
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              ImagePickerElementWidget(
                commentVisibility: 0,
                title: "",
                titleBackgroundColor: AppColors.primaryLightColor,
                onImagePicked: (imagePath) => selectedImage1Path = imagePath,
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: pOSITIONSList
                    .map(
                      (item) => item == "point"
                          ? Column(
                              children: [
                                CachedNetworkImage(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  width:
                                      MediaQuery.of(context).size.width * 0.99,
                                  imageUrl:
                                      "https://www.mobile.sportspedagogue.com/66_${intl.imgLang}.png",
                                  imageBuilder: (context, imageProvioder) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvioder,
                                            fit: BoxFit.fill),
                                      ),
                                    );
                                  },
                                  placeholder: (context, url) => const SizedBox(
                                    height: 250,
                                    width: 164,
                                    child: Center(child: LoadingWidget()),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                                Dimensions.verticalSpacingExtraLarge,
                              ],
                            )
                          : Column(
                              children: [
                                Text(
                                  item,
                                  style: TextStyle(
                                      color: AppColors.secondaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Dimensions.verticalSpacingExtraLarge,
                                TextField(
                                  keyboardType: TextInputType.multiline,
                                  controller: pOSITIONSControllerList[item],
                                  decoration: const InputDecoration(),
                                  autofocus: false,
                                  maxLines: null,
                                ),
                                Dimensions.verticalSpacingExtraLarge,
                              ],
                            ),
                    )
                    .toList(),
              ),
              Dimensions.verticalSpacingExtraLarge,

              ////////////////////////////////////////////////////
              ///
              ///
              ///
              ///
              ///
              ///
              ///
              ///

              Dimensions.verticalSpacingExtraLarge,
              CustomButton(
                  text: intl.next,
                  onPressed: () {
                    // _generatePDF();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => techniqueTactique(
                          selectedImage1Path: selectedImage1Path,
                          titleCardList: titleCardList,
                          titleCardControllerList: titleCardControllerList,
                          pOSITIONSList: pOSITIONSList,
                          pOSITIONSControllerList: pOSITIONSControllerList,
                          dateController: dateController,
                          coachController: coachController,
                          joueur: _Joueur,
                        ),
                      ),
                    );
                  }),
              Dimensions.verticalSpacingExtraLarge,
            ],
          ),
        ))));
  }
}
