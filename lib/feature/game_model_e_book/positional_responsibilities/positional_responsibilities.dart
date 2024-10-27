import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:pedagogue/feature/espqceEPS/ficheDePresence/save_file_mobile.dart';
import 'package:pedagogue/feature/game_model_e_book/positional_responsibilities/gk/positions_widget.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/shared/style/dimensions.dart';
import 'package:pedagogue/shared/widget/custom_button.dart';
import 'package:pedagogue/shared/widget/loading_widget.dart';
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PositionalResponsibilities extends StatefulWidget {
  const PositionalResponsibilities({super.key});

  @override
  State<PositionalResponsibilities> createState() =>
      _PositionalResponsibilitiesState();
}

class _PositionalResponsibilitiesState
    extends State<PositionalResponsibilities> {
  int colorIndex = 1;
  List positions = [
    {
      "title": "${intl.gk}",
      "path": '1 vs 1 widget',
      "index": 1,
    },
    {"title": "${intl.rb}", "path": '2 vs 2 widget', "index": 2},
    {"title": "${intl.cb}1", "path": '3 vs 3 widget', "index": 3},
    {"title": "${intl.cb}2", "path": '4 vs 4 widget', "index": 4},
    {"title": "${intl.lb}", "path": '5 vs 5 widget', "index": 5},
    {"title": "${intl.cdm}", "path": '6 vs 6 widget', "index": 6},
    {"title": "${intl.cm}1", "path": '7 vs 7 widget', "index": 7},
    {"title": "${intl.cm}2", "path": '8 vs 8 widget', "index": 8},
    {"title": "${intl.rw}", "path": '8 vs 8 widget', "index": 9},
    {"title": "${intl.lw}", "path": '8 vs 8 widget', "index": 10},
    {"title": "${intl.cam}", "path": '8 vs 8 widget', "index": 11},
    {"title": "${intl.cf}", "path": '8 vs 8 widget', "index": 12},
  ];

  String? langue = "";
  @override
  void initState() {
    ln();
    // TODO: implement initState
    positions = [
      {
        "title": "${intl.gk}",
        "path": PositionsWidget(
          image1: 'https://www.mobile.sportspedagogue.com/34.png',
          controller1: _Gkcontroller1,
          choices: choicesGk,
          input1: input1Gk,
          controller2: _Gkcontroller2,
          controller3: _Gkcontroller3,
          controller4: _Gkcontroller4,
          joueur: _GkJoueur,
        ),
        "index": 1,
      },
      {
        "title": "${intl.rb}",
        "path": PositionsWidget(
          image1: 'https://www.mobile.sportspedagogue.com/38.png',
          controller1: _RBcontroller1,
          choices: choicesRB,
          input1: input1RB,
          controller2: _RBcontroller2,
          controller3: _RBcontroller3,
          controller4: _RBcontroller4,
          joueur: _RBJoueur,
        ),
        "index": 2
      },
      {
        "title": "${intl.cb}1",
        "path": PositionsWidget(
          image1: 'https://www.mobile.sportspedagogue.com/39.png',
          controller1: _CB1controller1,
          choices: choicesCB1,
          input1: input1CB1,
          controller2: _CB1controller2,
          controller3: _CB1controller3,
          controller4: _CB1controller4,
          joueur: _CB1Joueur,
        ),
        "index": 3
      },
      {
        "title": "${intl.cb}2",
        "path": PositionsWidget(
          image1: 'https://www.mobile.sportspedagogue.com/399.png',
          controller1: _CB2controller1,
          choices: choicesCB2,
          input1: input1CB2,
          controller2: _CB2controller2,
          controller3: _CB2controller3,
          controller4: _CB2controller4,
          joueur: _CB2Joueur,
        ),
        "index": 4
      },
      {
        "title": "${intl.lb}",
        "path": PositionsWidget(
          image1: 'https://www.mobile.sportspedagogue.com/40.png',
          controller1: _LBcontroller1,
          choices: choicesLB,
          input1: input1LB,
          controller2: _LBcontroller2,
          controller3: _LBcontroller3,
          controller4: _LBcontroller4,
          joueur: _LBJoueur,
        ),
        "index": 5
      },
      {
        "title": "${intl.cdm}",
        "path": PositionsWidget(
          image1: 'https://www.mobile.sportspedagogue.com/41.png',
          controller1: _CDMcontroller1,
          choices: choicesCDM,
          input1: input1CDM,
          controller2: _CDMcontroller2,
          controller3: _CDMcontroller3,
          controller4: _CDMcontroller4,
          joueur: _CDMJoueur,
        ),
        "index": 6
      },
      {
        "title": "${intl.cm}1",
        "path": PositionsWidget(
          image1: 'https://www.mobile.sportspedagogue.com/42.png',
          controller1: _CM1controller1,
          choices: choicesCM1,
          input1: input1CM1,
          controller2: _CM1controller2,
          controller3: _CM1controller3,
          controller4: _CM1controller4,
          joueur: _CM1Joueur,
        ),
        "index": 7
      },
      {
        "title": "${intl.cm}2",
        "path": PositionsWidget(
          image1: 'https://www.mobile.sportspedagogue.com/422.png',
          controller1: _CM2controller1,
          choices: choicesCM2,
          input1: input1CM2,
          controller2: _CM2controller2,
          controller3: _CM2controller3,
          controller4: _CM2controller4,
          joueur: _CM2Joueur,
        ),
        "index": 8
      },
      {
        "title": "${intl.rw}",
        "path": PositionsWidget(
          image1: 'https://www.mobile.sportspedagogue.com/43.png',
          controller1: _RWcontroller1,
          choices: choicesRW,
          input1: input1RW,
          controller2: _RWcontroller2,
          controller3: _RWcontroller3,
          controller4: _RWcontroller4,
          joueur: _RWJoueur,
        ),
        "index": 9
      },
      {
        "title": "${intl.lw}",
        "path": PositionsWidget(
          image1: 'https://www.mobile.sportspedagogue.com/433.png',
          controller1: _LWcontroller1,
          choices: choicesLW,
          input1: input1LW,
          controller2: _LWcontroller2,
          controller3: _LWcontroller3,
          controller4: _LWcontroller4,
          joueur: _LWJoueur,
        ),
        "index": 10
      },
      {
        "title": "${intl.cam}",
        "path": PositionsWidget(
          image1: 'https://www.mobile.sportspedagogue.com/44.png',
          joueur: _CAMJoueur,
          controller1: _CAMcontroller1,
          choices: choicesCAM,
          input1: input1CAM,
          controller2: _CAMcontroller2,
          controller3: _CAMcontroller3,
          controller4: _CAMcontroller4,
        ),
        "index": 11
      },
      {
        "title": "${intl.cf}",
        "path": PositionsWidget(
          image1: 'https://www.mobile.sportspedagogue.com/45.png',
          controller1: _CFcontroller1,
          choices: choicesCF,
          input1: input1CF,
          controller2: _CFcontroller2,
          controller3: _CFcontroller3,
          controller4: _CFcontroller4,
          joueur: _CFJoueur,
        ),
        "index": 12
      },
    ];
    super.initState();
  }

  Future<void> ln() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    langue = prefs.getString('SAVED_LOCALIZATION');
  }

  bool _isGeneratingPDF = false;
  Future<void> _generatePDF() async {
    final font = await rootBundle.load("assets/JannaLT-Regular.ttf");
    final ttf = p.Font.ttf(font);
    final pdf = p.Document();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langue = prefs.getString('SAVED_LOCALIZATION');
    print(langue);
    final netImage1 =
        await networkImage('https://www.mobile.sportspedagogue.com/34.png');
    final netImage2 =
        await networkImage('https://www.mobile.sportspedagogue.com/38.png');
    final netImage3 =
        await networkImage('https://www.mobile.sportspedagogue.com/39.png');
    final netImage4 =
        await networkImage('https://www.mobile.sportspedagogue.com/399.png');
    final netImage5 =
        await networkImage('https://www.mobile.sportspedagogue.com/40.png');
    final netImage6 =
        await networkImage('https://www.mobile.sportspedagogue.com/41.png');
    final netImage7 =
        await networkImage('https://www.mobile.sportspedagogue.com/42.png');
    final netImage8 =
        await networkImage('https://www.mobile.sportspedagogue.com/422.png');
    final netImage9 =
        await networkImage('https://www.mobile.sportspedagogue.com/43.png');
    final netImage10 =
        await networkImage('https://www.mobile.sportspedagogue.com/433.png');
    final netImage11 =
        await networkImage('https://www.mobile.sportspedagogue.com/44.png');
    final netImage12 =
        await networkImage('https://www.mobile.sportspedagogue.com/45.png');
    final formationImage =
        await networkImage("https://www.mobile.sportspedagogue.com/35.png");
    final instructionImage = await networkImage(
        "https://www.mobile.sportspedagogue.com/28_${intl.imgLang}.png");

    final footImage =
        await networkImage("https://www.mobile.sportspedagogue.com/36.png");
    p.Widget buildTextField(String title, String input1) {
      return p.Column(
        children: [
          p.SizedBox(
            width: 500,
            child: p.Text(title,
                textAlign: p.TextAlign.center,
                textDirection:
                    langue == "ar" ? p.TextDirection.rtl : p.TextDirection.ltr,
                style: p.TextStyle(
                    font: ttf, color: PdfColors.brown400, fontSize: 15)),
          ),
          p.SizedBox(height: 10),
          p.SizedBox(
            width: 500,
            child: p.Text(input1,
                textAlign: p.TextAlign.center,
                textDirection:
                    langue == "ar" ? p.TextDirection.rtl : p.TextDirection.ltr,
                style: p.TextStyle(
                    font: ttf,
                    color: PdfColors.black,
                    fontSize: 15,
                    fontWeight: p.FontWeight.bold)),
          ),
        ],
      );
    }

    p.Widget buildPositionPage(
      String title,
      dynamic positionImage,
      dynamic player,
      List<dynamic> choices,
      List<dynamic> inputPosition,
      String input1,
      String input2,
      String input3,
      String input4,
    ) {
      return p.Column(
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
          p.SizedBox(height: 10),
          p.Image(positionImage, height: 500),
          p.SizedBox(height: 10),
          p.Image(formationImage, height: 500),
          p.SizedBox(height: 10),
          p.Image(instructionImage, height: 500),
          p.SizedBox(
            child: p.Text(
              "${intl.player}  : $player",
              textAlign: p.TextAlign.center,
              textDirection:
                  langue == "ar" ? p.TextDirection.rtl : p.TextDirection.ltr,
              style: p.TextStyle(font: ttf, fontWeight: p.FontWeight.bold),
            ),
          ),
          p.Row(children: <p.Widget>[
            p.SizedBox(
              child: p.Text(
                "${intl.positionalResponsibilities1}",
                textAlign: p.TextAlign.center,
                textDirection:
                    langue == "ar" ? p.TextDirection.rtl : p.TextDirection.ltr,
                style: p.TextStyle(
                    font: ttf,
                    fontWeight: p.FontWeight.bold,
                    color: PdfColors.brown400),
              ),
            ),
            p.SizedBox(height: 10),
            p.Image(footImage, height: 100),
            p.SizedBox(height: 10),
          ]),
          p.SizedBox(
              width: 500,
              height: 200,
              child: p.GridView(
                  crossAxisCount: 4,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.5,
                  children: List.generate(
                    choices.length,
                    (index) => p.Container(
                        decoration: p.BoxDecoration(
                            border: p.Border.all(
                              color: PdfColors.amber,
                            ),
                            borderRadius: p.BorderRadius.circular(30)),
                        child: p.Center(
                            child: p.Text(
                          choices[index]['title'],
                          style: p.TextStyle(fontSize: 10),
                        ))),
                  ))),
          buildTextField(intl.positionalResponsibilities3,
              inputPosition[0]["controller"].text),
          buildTextField(intl.positionalResponsibilities4,
              inputPosition[1]["controller"].text),
          buildTextField(intl.positionalResponsibilities5,
              inputPosition[2]["controller"].text),
          buildTextField(intl.positionalResponsibilities6,
              inputPosition[3]["controller"].text),
          buildTextField(intl.positionalResponsibilities7,
              inputPosition[4]["controller"].text),
          buildTextField(intl.positionalResponsibilities8,
              inputPosition[5]["controller"].text),
          buildTextField(intl.positionalResponsibilities9,
              inputPosition[6]["controller"].text),
          buildTextField(intl.positionalResponsibilities10,
              inputPosition[7]["controller"].text),
          buildTextField(intl.positionalResponsibilities11,
              inputPosition[8]["controller"].text),
          p.Container(
              color: PdfColors.amber,
              height: 50,
              width: 500,
              child: p.Row(
                  mainAxisAlignment: p.MainAxisAlignment.center,
                  children: [
                    p.Padding(
                        padding: const p.EdgeInsets.only(left: 10),
                        child: p.Text("${intl.positionalResponsibilities2}",
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
          p.Image(netImage1, height: 400),
          p.SizedBox(height: 10),
          p.Image(formationImage, height: 400),
          p.SizedBox(height: 10),
          p.Image(instructionImage, height: 400),
          buildTextField("", input1),
          p.SizedBox(height: 10),
          p.SizedBox(
            width: 500,
            child: p.Text("${intl.positionalResponsibilities2}",
                textAlign: p.TextAlign.center,
                textDirection:
                    langue == "ar" ? p.TextDirection.rtl : p.TextDirection.ltr,
                style: p.TextStyle(
                    font: ttf, color: PdfColors.brown400, fontSize: 15)),
          ),
          p.SizedBox(height: 10),
          buildTextField("", input2),
          p.SizedBox(height: 10),
          buildTextField("", input3),
          p.SizedBox(height: 10),
          buildTextField("", input4),
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
              buildPositionPage(
                intl.gk,
                netImage1,
                _GkJoueur,
                choicesGk,
                input1Gk,
                _Gkcontroller1.text,
                _Gkcontroller2.text,
                _Gkcontroller3.text,
                _Gkcontroller4.text,
              ),
              buildPositionPage(
                intl.rb,
                netImage2,
                _RBJoueur,
                choicesRB,
                input1RB,
                _RBcontroller1.text,
                _RBcontroller2.text,
                _RBcontroller3.text,
                _RBcontroller4.text,
              ),
              buildPositionPage(
                "${intl.cb}1",
                netImage3,
                _CB1Joueur,
                choicesCB1,
                input1CB1,
                _CB1controller1.text,
                _CB1controller2.text,
                _CB1controller3.text,
                _CB1controller4.text,
              ),
              buildPositionPage(
                "${intl.cb}2",
                netImage4,
                _CB2Joueur,
                choicesCB2,
                input1CB2,
                _CB2controller1.text,
                _CB2controller2.text,
                _CB2controller3.text,
                _CB2controller4.text,
              ),
              buildPositionPage(
                "${intl.lb}",
                netImage5,
                _LBJoueur,
                choicesLB,
                input1LB,
                _LBcontroller1.text,
                _LBcontroller2.text,
                _LBcontroller3.text,
                _LBcontroller4.text,
              ),
              buildPositionPage(
                "${intl.cdm}",
                netImage6,
                _CDMJoueur,
                choicesCDM,
                input1CDM,
                _CDMcontroller1.text,
                _CDMcontroller2.text,
                _CDMcontroller3.text,
                _CDMcontroller4.text,
              ),
              buildPositionPage(
                "${intl.cm}1",
                netImage7,
                _CM1Joueur,
                choicesCM1,
                input1CM1,
                _CM1controller1.text,
                _CM1controller2.text,
                _CM1controller3.text,
                _CM1controller4.text,
              ),
              buildPositionPage(
                "${intl.cm}2",
                netImage8,
                _CM2Joueur,
                choicesCM2,
                input1CM2,
                _CM2controller1.text,
                _CM2controller2.text,
                _CM2controller3.text,
                _CM2controller4.text,
              ),
              buildPositionPage(
                "${intl.rw}",
                netImage9,
                _RWJoueur,
                choicesRW,
                input1RW,
                _RWcontroller1.text,
                _RWcontroller2.text,
                _RWcontroller3.text,
                _RWcontroller4.text,
              ),
              buildPositionPage(
                "${intl.lw}",
                netImage10,
                _LWJoueur,
                choicesLW,
                input1LW,
                _LWcontroller1.text,
                _LWcontroller2.text,
                _LWcontroller3.text,
                _LWcontroller4.text,
              ),
              buildPositionPage(
                "${intl.cam}",
                netImage11,
                _CAMJoueur,
                choicesCAM,
                input1CAM,
                _CAMcontroller1.text,
                _CAMcontroller2.text,
                _CAMcontroller3.text,
                _CAMcontroller4.text,
              ),
              buildPositionPage(
                "${intl.cf}",
                netImage12,
                _CFJoueur,
                choicesCF,
                input1CF,
                _CFcontroller1.text,
                _CFcontroller2.text,
                _CFcontroller3.text,
                _CFcontroller4.text,
              ),
            ];
          }),
    );

    // Save the PDF
    List<int> bytes = await pdf.save();

    saveAndLaunchFile(
        bytes, "${intl.positionalResponsibilitiesList}(4-2-3-1).pdf");
    setState(() {
      _isGeneratingPDF = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.positionalResponsibilitiesList}"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: _isGeneratingPDF == true
              ? LoadingWidget()
              : Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.sizeOf(context).height * 0.01,
                      ),
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.2,
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        child: GridView.count(
                            crossAxisCount: 4,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio:
                                MediaQuery.sizeOf(context).width * 0.007,
                            children: List.generate(
                              positions.length,
                              (index) => SizedBox(
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                      backgroundColor: colorIndex ==
                                              positions[index]['index']
                                          ? MaterialStatePropertyAll(
                                              Colors.yellow)
                                          : MaterialStatePropertyAll(
                                              Colors.transparent)),
                                  onPressed: () {
                                    setState(() {
                                      colorIndex = positions[index]['index'];
                                      print(colorIndex);
                                    });
                                  },
                                  child: Text(
                                    positions[index]["title"],
                                    style: TextStyle(
                                        fontSize: langue == "ar" ? 18 : 10),
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ),
                    positions[colorIndex - 1]["path"],
                    Dimensions.verticalSpacingExtraLarge,
                    CustomButton(
                        text: intl.print,
                        onPressed: () {
                          setState(() {
                            print("be555555555555555555555555555");
                            _isGeneratingPDF = true;
                          });
                          _generatePDF();
                          /*  for (var item in input1) {
                  print(item['controller'].text);
                } */
                        }),
                    Dimensions.verticalSpacingExtraLarge,
                  ],
                ),
        ),
      ),
    );
  }
}

/////////////////////////////////
///Gk ///Gk ///Gk ///Gk ///Gk ///Gk
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
TextEditingController _GkJoueur = TextEditingController();
TextEditingController _Gkcontroller1 =
    TextEditingController(text: intl.positionalGk20);
TextEditingController _Gkcontroller2 =
    TextEditingController(text: intl.positionalGk21);
TextEditingController _Gkcontroller3 =
    TextEditingController(text: intl.positionalGk22);
TextEditingController _Gkcontroller4 =
    TextEditingController(text: intl.positionalGk23);
List choicesGk = [
  {
    "title": intl.positionalGk1,
  },
  {
    "title": intl.positionalGk2,
  },
  {
    "title": intl.positionalGk3,
  },
  {
    "title": intl.positionalGk4,
  },
  {
    "title": intl.positionalGk5,
  },
  {
    "title": intl.positionalGk6,
  },
  {
    "title": intl.positionalGk7,
  },
  {
    "title": intl.positionalGk8,
  },
  {
    "title": intl.positionalGk9,
  },
  {
    "title": intl.positionalGk10,
  },
];

List input1Gk = [
  {
    "title": intl.positionalResponsibilities3,
    "controller": TextEditingController(text: intl.positionalGk11)
  },
  {
    "title": intl.positionalResponsibilities4,
    "controller": TextEditingController(text: intl.positionalGk12)
  },
  {
    "title": intl.positionalResponsibilities5,
    "controller": TextEditingController(text: intl.positionalGk13)
  },
  {
    "title": intl.positionalResponsibilities6,
    "controller": TextEditingController(text: intl.positionalGk14)
  },
  {
    "title": intl.positionalResponsibilities7,
    "controller": TextEditingController(text: intl.positionalGk15)
  },
  {
    "title": intl.positionalResponsibilities8,
    "controller": TextEditingController(text: intl.positionalGk16)
  },
  {
    "title": intl.positionalResponsibilities9,
    "controller": TextEditingController(text: intl.positionalGk17)
  },
  {
    "title": intl.positionalResponsibilities10,
    "controller": TextEditingController(text: intl.positionalGk18)
  },
  {
    "title": intl.positionalResponsibilities11,
    "controller": TextEditingController(text: intl.positionalGk19)
  },
];
/////////////////////////////////
/////////////////////////////////
/// ///Gk ///Gk ///Gk ///Gk ///Gk ///Gk ///Gk ///Gk ///Gk ///Gk ///Gk ///Gk
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////

////////////////////////////////////
///RB ///RB ///RB ///RB ///RB ///RB
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
TextEditingController _RBJoueur = TextEditingController();
TextEditingController _RBcontroller1 =
    TextEditingController(text: intl.positionalRB20);
TextEditingController _RBcontroller2 =
    TextEditingController(text: intl.positionalRB21);
TextEditingController _RBcontroller3 =
    TextEditingController(text: intl.positionalRB22);
TextEditingController _RBcontroller4 =
    TextEditingController(text: intl.positionalRB23);
List choicesRB = [
  {
    "title": intl.positionalRB1,
  },
  {
    "title": intl.positionalRB2,
  },
  {
    "title": intl.positionalRB3,
  },
  {
    "title": intl.positionalRB4,
  },
  {
    "title": intl.positionalRB5,
  },
  {
    "title": intl.positionalRB6,
  },
  {
    "title": intl.positionalRB7,
  },
  {
    "title": intl.positionalRB8,
  },
  {
    "title": intl.positionalRB9,
  },
  {
    "title": intl.positionalRB10,
  },
];

List input1RB = [
  {
    "title": intl.positionalResponsibilities3,
    "controller": TextEditingController(text: intl.positionalRB11)
  },
  {
    "title": intl.positionalResponsibilities4,
    "controller": TextEditingController(text: intl.positionalRB12)
  },
  {
    "title": intl.positionalResponsibilities5,
    "controller": TextEditingController(text: intl.positionalRB13)
  },
  {
    "title": intl.positionalResponsibilities6,
    "controller": TextEditingController(text: intl.positionalRB14)
  },
  {
    "title": intl.positionalResponsibilities7,
    "controller": TextEditingController(text: intl.positionalRB15)
  },
  {
    "title": intl.positionalResponsibilities8,
    "controller": TextEditingController(text: intl.positionalRB16)
  },
  {
    "title": intl.positionalResponsibilities9,
    "controller": TextEditingController(text: intl.positionalRB17)
  },
  {
    "title": intl.positionalResponsibilities10,
    "controller": TextEditingController(text: intl.positionalRB18)
  },
  {
    "title": intl.positionalResponsibilities11,
    "controller": TextEditingController(text: intl.positionalRB19)
  },
];
/////////////////////////////////
/////////////////////////////////
/// ///RB ///RB ///RB ///RB ///RB ///RB ///RB ///RB ///RB ///RB ///RB ///RB
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
////////////////////////////////////

///CB1 ///CB1 ///CB1 ///CB1 ///CB1 ///CB1
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
TextEditingController _CB1Joueur = TextEditingController();
TextEditingController _CB1controller1 =
    TextEditingController(text: intl.positionalCB120);
TextEditingController _CB1controller2 =
    TextEditingController(text: intl.positionalCB121);
TextEditingController _CB1controller3 =
    TextEditingController(text: intl.positionalCB122);
TextEditingController _CB1controller4 =
    TextEditingController(text: intl.positionalCB123);
List choicesCB1 = [
  {
    "title": intl.positionalCB11,
  },
  {
    "title": intl.positionalCB12,
  },
  {
    "title": intl.positionalCB13,
  },
  {
    "title": intl.positionalCB14,
  },
  {
    "title": intl.positionalCB15,
  },
  {
    "title": intl.positionalCB16,
  },
  {
    "title": intl.positionalCB17,
  },
  {
    "title": intl.positionalCB18,
  },
  {
    "title": intl.positionalCB19,
  },
  {
    "title": intl.positionalCB110,
  },
];

List input1CB1 = [
  {
    "title": intl.positionalResponsibilities3,
    "controller": TextEditingController(text: intl.positionalCB111)
  },
  {
    "title": intl.positionalResponsibilities4,
    "controller": TextEditingController(text: intl.positionalCB112)
  },
  {
    "title": intl.positionalResponsibilities5,
    "controller": TextEditingController(text: intl.positionalCB113)
  },
  {
    "title": intl.positionalResponsibilities6,
    "controller": TextEditingController(text: intl.positionalCB114)
  },
  {
    "title": intl.positionalResponsibilities7,
    "controller": TextEditingController(text: intl.positionalCB115)
  },
  {
    "title": intl.positionalResponsibilities8,
    "controller": TextEditingController(text: intl.positionalCB116)
  },
  {
    "title": intl.positionalResponsibilities9,
    "controller": TextEditingController(text: intl.positionalCB117)
  },
  {
    "title": intl.positionalResponsibilities10,
    "controller": TextEditingController(text: intl.positionalCB118)
  },
  {
    "title": intl.positionalResponsibilities11,
    "controller": TextEditingController(text: intl.positionalCB119)
  },
];
/////////////////////////////////
/////////////////////////////////
/// ///CB1 ///CB1 ///CB1 ///CB1 ///CB1 ///CB1 ///CB1 ///CB1 ///CB1 ///CB1 ///CB1 ///CB1
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
///CB2 ///CB2 ///CB2 ///CB2 ///CB2 ///CB2
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
TextEditingController _CB2Joueur = TextEditingController();
TextEditingController _CB2controller1 =
    TextEditingController(text: intl.positionalCB120);
TextEditingController _CB2controller2 =
    TextEditingController(text: intl.positionalCB121);
TextEditingController _CB2controller3 =
    TextEditingController(text: intl.positionalCB122);
TextEditingController _CB2controller4 =
    TextEditingController(text: intl.positionalCB123);
List choicesCB2 = [
  {
    "title": intl.positionalCB11,
  },
  {
    "title": intl.positionalCB12,
  },
  {
    "title": intl.positionalCB13,
  },
  {
    "title": intl.positionalCB14,
  },
  {
    "title": intl.positionalCB15,
  },
  {
    "title": intl.positionalCB16,
  },
  {
    "title": intl.positionalCB17,
  },
  {
    "title": intl.positionalCB18,
  },
  {
    "title": intl.positionalCB19,
  },
  {
    "title": intl.positionalCB110,
  },
];

List input1CB2 = [
  {
    "title": intl.positionalResponsibilities3,
    "controller": TextEditingController(text: intl.positionalCB111)
  },
  {
    "title": intl.positionalResponsibilities4,
    "controller": TextEditingController(text: intl.positionalCB112)
  },
  {
    "title": intl.positionalResponsibilities5,
    "controller": TextEditingController(text: intl.positionalCB113)
  },
  {
    "title": intl.positionalResponsibilities6,
    "controller": TextEditingController(text: intl.positionalCB114)
  },
  {
    "title": intl.positionalResponsibilities7,
    "controller": TextEditingController(text: intl.positionalCB115)
  },
  {
    "title": intl.positionalResponsibilities8,
    "controller": TextEditingController(text: intl.positionalCB116)
  },
  {
    "title": intl.positionalResponsibilities9,
    "controller": TextEditingController(text: intl.positionalCB117)
  },
  {
    "title": intl.positionalResponsibilities10,
    "controller": TextEditingController(text: intl.positionalCB118)
  },
  {
    "title": intl.positionalResponsibilities11,
    "controller": TextEditingController(text: intl.positionalCB119)
  },
];
/////////////////////////////////
/////////////////////////////////
/// ///CB2 ///CB2 ///CB2 ///CB2 ///CB2 ///CB2 ///CB2 ///CB2 ///CB2 ///CB2 ///CB2 ///CB2
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
///LB ///LB ///LB ///LB ///LB ///LB
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
TextEditingController _LBJoueur = TextEditingController();
TextEditingController _LBcontroller1 =
    TextEditingController(text: intl.positionalLB20);
TextEditingController _LBcontroller2 =
    TextEditingController(text: intl.positionalLB21);
TextEditingController _LBcontroller3 =
    TextEditingController(text: intl.positionalLB22);
TextEditingController _LBcontroller4 =
    TextEditingController(text: intl.positionalLB23);
List choicesLB = [
  {
    "title": intl.positionalLB1,
  },
  {
    "title": intl.positionalLB2,
  },
  {
    "title": intl.positionalLB3,
  },
  {
    "title": intl.positionalLB4,
  },
  {
    "title": intl.positionalLB5,
  },
  {
    "title": intl.positionalLB6,
  },
  {
    "title": intl.positionalLB7,
  },
  {
    "title": intl.positionalLB8,
  },
  {
    "title": intl.positionalLB9,
  },
  {
    "title": intl.positionalLB10,
  },
];

List input1LB = [
  {
    "title": intl.positionalResponsibilities3,
    "controller": TextEditingController(text: intl.positionalLB11)
  },
  {
    "title": intl.positionalResponsibilities4,
    "controller": TextEditingController(text: intl.positionalLB12)
  },
  {
    "title": intl.positionalResponsibilities5,
    "controller": TextEditingController(text: intl.positionalLB13)
  },
  {
    "title": intl.positionalResponsibilities6,
    "controller": TextEditingController(text: intl.positionalLB14)
  },
  {
    "title": intl.positionalResponsibilities7,
    "controller": TextEditingController(text: intl.positionalLB15)
  },
  {
    "title": intl.positionalResponsibilities8,
    "controller": TextEditingController(text: intl.positionalLB16)
  },
  {
    "title": intl.positionalResponsibilities9,
    "controller": TextEditingController(text: intl.positionalLB17)
  },
  {
    "title": intl.positionalResponsibilities10,
    "controller": TextEditingController(text: intl.positionalLB18)
  },
  {
    "title": intl.positionalResponsibilities11,
    "controller": TextEditingController(text: intl.positionalLB19)
  },
];
/////////////////////////////////
/////////////////////////////////
/// ///LB ///LB ///LB ///LB ///LB ///LB ///LB ///LB ///LB ///LB ///LB ///LB
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
///CDM ///CDM ///CDM ///CDM ///CDM ///CDM
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
TextEditingController _CDMJoueur = TextEditingController();
TextEditingController _CDMcontroller1 =
    TextEditingController(text: intl.positionalCDM20);
TextEditingController _CDMcontroller2 =
    TextEditingController(text: intl.positionalCDM21);
TextEditingController _CDMcontroller3 =
    TextEditingController(text: intl.positionalCDM22);
TextEditingController _CDMcontroller4 =
    TextEditingController(text: intl.positionalCDM23);
List choicesCDM = [
  {
    "title": intl.positionalCDM1,
  },
  {
    "title": intl.positionalCDM2,
  },
  {
    "title": intl.positionalCDM3,
  },
  {
    "title": intl.positionalCDM4,
  },
  {
    "title": intl.positionalCDM5,
  },
  {
    "title": intl.positionalCDM6,
  },
  {
    "title": intl.positionalCDM7,
  },
  {
    "title": intl.positionalCDM8,
  },
  {
    "title": intl.positionalCDM9,
  },
  {
    "title": intl.positionalCDM10,
  },
];

List input1CDM = [
  {
    "title": intl.positionalResponsibilities3,
    "controller": TextEditingController(text: intl.positionalCDM11)
  },
  {
    "title": intl.positionalResponsibilities4,
    "controller": TextEditingController(text: intl.positionalCDM12)
  },
  {
    "title": intl.positionalResponsibilities5,
    "controller": TextEditingController(text: intl.positionalCDM13)
  },
  {
    "title": intl.positionalResponsibilities6,
    "controller": TextEditingController(text: intl.positionalCDM14)
  },
  {
    "title": intl.positionalResponsibilities7,
    "controller": TextEditingController(text: intl.positionalCDM15)
  },
  {
    "title": intl.positionalResponsibilities8,
    "controller": TextEditingController(text: intl.positionalCDM16)
  },
  {
    "title": intl.positionalResponsibilities9,
    "controller": TextEditingController(text: intl.positionalCDM17)
  },
  {
    "title": intl.positionalResponsibilities10,
    "controller": TextEditingController(text: intl.positionalCDM18)
  },
  {
    "title": intl.positionalResponsibilities11,
    "controller": TextEditingController(text: intl.positionalCDM19)
  },
];
/////////////////////////////////
/////////////////////////////////
/// ///CDM ///CDM ///CDM ///CDM ///CDM ///CDM ///CDM ///CDM ///CDM ///CDM ///CDM ///CDM
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
///CM1 ///CM1 ///CM1 ///CM1 ///CM1 ///CM1
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
TextEditingController _CM1Joueur = TextEditingController();
TextEditingController _CM1controller1 =
    TextEditingController(text: intl.positionalCM20);
TextEditingController _CM1controller2 =
    TextEditingController(text: intl.positionalCM21);
TextEditingController _CM1controller3 =
    TextEditingController(text: intl.positionalCM22);
TextEditingController _CM1controller4 =
    TextEditingController(text: intl.positionalCM23);
List choicesCM1 = [
  {
    "title": intl.positionalCM1,
  },
  {
    "title": intl.positionalCM2,
  },
  {
    "title": intl.positionalCM3,
  },
  {
    "title": intl.positionalCM4,
  },
  {
    "title": intl.positionalCM5,
  },
  {
    "title": intl.positionalCM6,
  },
  {
    "title": intl.positionalCM7,
  },
  {
    "title": intl.positionalCM8,
  },
  {
    "title": intl.positionalCM9,
  },
  {
    "title": intl.positionalCM10,
  },
];

List input1CM1 = [
  {
    "title": intl.positionalResponsibilities3,
    "controller": TextEditingController(text: intl.positionalCM11)
  },
  {
    "title": intl.positionalResponsibilities4,
    "controller": TextEditingController(text: intl.positionalCM12)
  },
  {
    "title": intl.positionalResponsibilities5,
    "controller": TextEditingController(text: intl.positionalCM13)
  },
  {
    "title": intl.positionalResponsibilities6,
    "controller": TextEditingController(text: intl.positionalCM14)
  },
  {
    "title": intl.positionalResponsibilities7,
    "controller": TextEditingController(text: intl.positionalCM15)
  },
  {
    "title": intl.positionalResponsibilities8,
    "controller": TextEditingController(text: intl.positionalCM16)
  },
  {
    "title": intl.positionalResponsibilities9,
    "controller": TextEditingController(text: intl.positionalCM17)
  },
  {
    "title": intl.positionalResponsibilities10,
    "controller": TextEditingController(text: intl.positionalCM18)
  },
  {
    "title": intl.positionalResponsibilities11,
    "controller": TextEditingController(text: intl.positionalCM19)
  },
];
/////////////////////////////////
/////////////////////////////////
/// ///CM1 ///CM1 ///CM1 ///CM1 ///CM1 ///CM1 ///CM1 ///CM1 ///CM1 ///CM1 ///CM1 ///CM1
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
///CM2 ///CM2 ///CM2 ///CM2 ///CM2 ///CM2
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
TextEditingController _CM2Joueur = TextEditingController();
TextEditingController _CM2controller1 =
    TextEditingController(text: intl.positionalCM20);
TextEditingController _CM2controller2 =
    TextEditingController(text: intl.positionalCM21);
TextEditingController _CM2controller3 =
    TextEditingController(text: intl.positionalCM22);
TextEditingController _CM2controller4 =
    TextEditingController(text: intl.positionalCM23);
List choicesCM2 = [
  {
    "title": intl.positionalCM1,
  },
  {
    "title": intl.positionalCM2,
  },
  {
    "title": intl.positionalCM3,
  },
  {
    "title": intl.positionalCM4,
  },
  {
    "title": intl.positionalCM5,
  },
  {
    "title": intl.positionalCM6,
  },
  {
    "title": intl.positionalCM7,
  },
  {
    "title": intl.positionalCM8,
  },
  {
    "title": intl.positionalCM9,
  },
  {
    "title": intl.positionalCM10,
  },
];

List input1CM2 = [
  {
    "title": intl.positionalResponsibilities3,
    "controller": TextEditingController(text: intl.positionalCM11)
  },
  {
    "title": intl.positionalResponsibilities4,
    "controller": TextEditingController(text: intl.positionalCM12)
  },
  {
    "title": intl.positionalResponsibilities5,
    "controller": TextEditingController(text: intl.positionalCM13)
  },
  {
    "title": intl.positionalResponsibilities6,
    "controller": TextEditingController(text: intl.positionalCM14)
  },
  {
    "title": intl.positionalResponsibilities7,
    "controller": TextEditingController(text: intl.positionalCM15)
  },
  {
    "title": intl.positionalResponsibilities8,
    "controller": TextEditingController(text: intl.positionalCM16)
  },
  {
    "title": intl.positionalResponsibilities9,
    "controller": TextEditingController(text: intl.positionalCM17)
  },
  {
    "title": intl.positionalResponsibilities10,
    "controller": TextEditingController(text: intl.positionalCM18)
  },
  {
    "title": intl.positionalResponsibilities11,
    "controller": TextEditingController(text: intl.positionalCM19)
  },
];
/////////////////////////////////
/////////////////////////////////
/// ///CM2 ///CM2 ///CM2 ///CM2 ///CM2 ///CM2 ///CM2 ///CM2 ///CM2 ///CM2 ///CM2 ///CM2
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
///RW ///RW ///RW ///RW ///RW ///RW
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
TextEditingController _RWJoueur = TextEditingController();
TextEditingController _RWcontroller1 =
    TextEditingController(text: intl.positionalRW20);
TextEditingController _RWcontroller2 =
    TextEditingController(text: intl.positionalRW21);
TextEditingController _RWcontroller3 =
    TextEditingController(text: intl.positionalRW22);
TextEditingController _RWcontroller4 =
    TextEditingController(text: intl.positionalRW23);
List choicesRW = [
  {
    "title": intl.positionalRW1,
  },
  {
    "title": intl.positionalRW2,
  },
  {
    "title": intl.positionalRW3,
  },
  {
    "title": intl.positionalRW4,
  },
  {
    "title": intl.positionalRW5,
  },
  {
    "title": intl.positionalRW6,
  },
  {
    "title": intl.positionalRW7,
  },
  {
    "title": intl.positionalRW8,
  },
  {
    "title": intl.positionalRW9,
  },
  {
    "title": intl.positionalRW10,
  },
];

List input1RW = [
  {
    "title": intl.positionalResponsibilities3,
    "controller": TextEditingController(text: intl.positionalRW11)
  },
  {
    "title": intl.positionalResponsibilities4,
    "controller": TextEditingController(text: intl.positionalRW12)
  },
  {
    "title": intl.positionalResponsibilities5,
    "controller": TextEditingController(text: intl.positionalRW13)
  },
  {
    "title": intl.positionalResponsibilities6,
    "controller": TextEditingController(text: intl.positionalRW14)
  },
  {
    "title": intl.positionalResponsibilities7,
    "controller": TextEditingController(text: intl.positionalRW15)
  },
  {
    "title": intl.positionalResponsibilities8,
    "controller": TextEditingController(text: intl.positionalRW16)
  },
  {
    "title": intl.positionalResponsibilities9,
    "controller": TextEditingController(text: intl.positionalRW17)
  },
  {
    "title": intl.positionalResponsibilities10,
    "controller": TextEditingController(text: intl.positionalRW18)
  },
  {
    "title": intl.positionalResponsibilities11,
    "controller": TextEditingController(text: intl.positionalRW19)
  },
];
/////////////////////////////////
/////////////////////////////////
/// ///RW ///RW ///RW ///RW ///RW ///RW ///RW ///RW ///RW ///RW ///RW ///RW
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
///LW ///LW ///LW ///LW ///LW ///LW
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
TextEditingController _LWJoueur = TextEditingController();
TextEditingController _LWcontroller1 =
    TextEditingController(text: intl.positionalLW20);
TextEditingController _LWcontroller2 =
    TextEditingController(text: intl.positionalLW21);
TextEditingController _LWcontroller3 =
    TextEditingController(text: intl.positionalLW22);
TextEditingController _LWcontroller4 =
    TextEditingController(text: intl.positionalLW23);
List choicesLW = [
  {
    "title": intl.positionalLB1,
  },
  {
    "title": intl.positionalLB2,
  },
  {
    "title": intl.positionalLB3,
  },
  {
    "title": intl.positionalLB4,
  },
  {
    "title": intl.positionalLB5,
  },
  {
    "title": intl.positionalLB6,
  },
  {
    "title": intl.positionalLB7,
  },
  {
    "title": intl.positionalLB8,
  },
  {
    "title": intl.positionalLB9,
  },
  {
    "title": intl.positionalLB10,
  },
];

List input1LW = [
  {
    "title": intl.positionalResponsibilities3,
    "controller": TextEditingController(text: intl.positionalLB11)
  },
  {
    "title": intl.positionalResponsibilities4,
    "controller": TextEditingController(text: intl.positionalLB12)
  },
  {
    "title": intl.positionalResponsibilities5,
    "controller": TextEditingController(text: intl.positionalLB13)
  },
  {
    "title": intl.positionalResponsibilities6,
    "controller": TextEditingController(text: intl.positionalLB14)
  },
  {
    "title": intl.positionalResponsibilities7,
    "controller": TextEditingController(text: intl.positionalLB15)
  },
  {
    "title": intl.positionalResponsibilities8,
    "controller": TextEditingController(text: intl.positionalLB16)
  },
  {
    "title": intl.positionalResponsibilities9,
    "controller": TextEditingController(text: intl.positionalLB17)
  },
  {
    "title": intl.positionalResponsibilities10,
    "controller": TextEditingController(text: intl.positionalLB18)
  },
  {
    "title": intl.positionalResponsibilities11,
    "controller": TextEditingController(text: intl.positionalLB19)
  },
];
/////////////////////////////////
/////////////////////////////////
/// ///LW ///LW ///LW ///LW ///LW ///LW ///LW ///LW ///LW ///LW ///LW ///LW
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
///CAM ///CAM ///CAM ///CAM ///CAM ///CAM
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
TextEditingController _CAMJoueur = TextEditingController();
TextEditingController _CAMcontroller1 =
    TextEditingController(text: intl.positionalCAM20);
TextEditingController _CAMcontroller2 =
    TextEditingController(text: intl.positionalCAM21);
TextEditingController _CAMcontroller3 =
    TextEditingController(text: intl.positionalCAM22);
TextEditingController _CAMcontroller4 =
    TextEditingController(text: intl.positionalCAM23);
List choicesCAM = [
  {
    "title": intl.positionalCAM1,
  },
  {
    "title": intl.positionalCAM2,
  },
  {
    "title": intl.positionalCAM3,
  },
  {
    "title": intl.positionalCAM4,
  },
  {
    "title": intl.positionalCAM5,
  },
  {
    "title": intl.positionalCAM6,
  },
  {
    "title": intl.positionalCAM7,
  },
  {
    "title": intl.positionalCAM8,
  },
  {
    "title": intl.positionalCAM9,
  },
  {
    "title": intl.positionalCAM10,
  },
];

List input1CAM = [
  {
    "title": intl.positionalResponsibilities3,
    "controller": TextEditingController(text: intl.positionalCAM11)
  },
  {
    "title": intl.positionalResponsibilities4,
    "controller": TextEditingController(text: intl.positionalCAM12)
  },
  {
    "title": intl.positionalResponsibilities5,
    "controller": TextEditingController(text: intl.positionalCAM13)
  },
  {
    "title": intl.positionalResponsibilities6,
    "controller": TextEditingController(text: intl.positionalCAM14)
  },
  {
    "title": intl.positionalResponsibilities7,
    "controller": TextEditingController(text: intl.positionalCAM15)
  },
  {
    "title": intl.positionalResponsibilities8,
    "controller": TextEditingController(text: intl.positionalCAM16)
  },
  {
    "title": intl.positionalResponsibilities9,
    "controller": TextEditingController(text: intl.positionalCAM17)
  },
  {
    "title": intl.positionalResponsibilities10,
    "controller": TextEditingController(text: intl.positionalCAM18)
  },
  {
    "title": intl.positionalResponsibilities11,
    "controller": TextEditingController(text: intl.positionalCAM19)
  },
];
/////////////////////////////////
/////////////////////////////////
/// ///CAM ///CAM ///CAM ///CAM ///CAM ///CAM ///CAM ///CAM ///CAM ///CAM ///CAM ///CAM
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
///CF ///CF ///CF ///CF ///CF ///CF
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
TextEditingController _CFJoueur = TextEditingController();
TextEditingController _CFcontroller1 =
    TextEditingController(text: intl.positionalCF20);
TextEditingController _CFcontroller2 =
    TextEditingController(text: intl.positionalCF21);
TextEditingController _CFcontroller3 =
    TextEditingController(text: intl.positionalCF22);
TextEditingController _CFcontroller4 =
    TextEditingController(text: intl.positionalCF23);
List choicesCF = [
  {
    "title": intl.positionalCF1,
  },
  {
    "title": intl.positionalCF2,
  },
  {
    "title": intl.positionalCF3,
  },
  {
    "title": intl.positionalCF4,
  },
  {
    "title": intl.positionalCF5,
  },
  {
    "title": intl.positionalCF6,
  },
  {
    "title": intl.positionalCF7,
  },
  {
    "title": intl.positionalCF8,
  },
  {
    "title": intl.positionalCF9,
  },
  {
    "title": intl.positionalCF10,
  },
];

List input1CF = [
  {
    "title": intl.positionalResponsibilities3,
    "controller": TextEditingController(text: intl.positionalCF11)
  },
  {
    "title": intl.positionalResponsibilities4,
    "controller": TextEditingController(text: intl.positionalCF12)
  },
  {
    "title": intl.positionalResponsibilities5,
    "controller": TextEditingController(text: intl.positionalCF13)
  },
  {
    "title": intl.positionalResponsibilities6,
    "controller": TextEditingController(text: intl.positionalCF14)
  },
  {
    "title": intl.positionalResponsibilities7,
    "controller": TextEditingController(text: intl.positionalCF15)
  },
  {
    "title": intl.positionalResponsibilities8,
    "controller": TextEditingController(text: intl.positionalCF16)
  },
  {
    "title": intl.positionalResponsibilities9,
    "controller": TextEditingController(text: intl.positionalCF17)
  },
  {
    "title": intl.positionalResponsibilities10,
    "controller": TextEditingController(text: intl.positionalCF18)
  },
  {
    "title": intl.positionalResponsibilities11,
    "controller": TextEditingController(text: intl.positionalCF19)
  },
];
/////////////////////////////////
/////////////////////////////////
/// ///CF ///CF ///CF ///CF ///CF ///CF ///CF ///CF ///CF ///CF ///CF ///CF
/////////////////////////////////
/////////////////////////////////
/////////////////////////////////