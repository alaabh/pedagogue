import 'package:flutter/material.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';

class CharacteristicView extends StatefulWidget {
  const CharacteristicView({super.key});

  @override
  State<CharacteristicView> createState() => _CharacteristicViewState();
}

class _CharacteristicViewState extends State<CharacteristicView> {
  int colorIndex = 1;
  List choices = [
    {
      "title": intl.ch1v1,
      "path": '1 vs 1 widget',
      "index": 1,
    },
    {"title": intl.ch2v2, "path": '2 vs 2 widget', "index": 2},
    {"title": intl.ch3v3, "path": '3 vs 3 widget', "index": 3},
    {"title": intl.ch4v4, "path": '4 vs 4 widget', "index": 4},
    {"title": intl.ch5v5, "path": '5 vs 5 widget', "index": 5},
    {"title": intl.ch6v6, "path": '6 vs 6 widget', "index": 6},
    {"title": intl.ch7v7, "path": '7 vs 7 widget', "index": 7},
    {"title": intl.ch8v8, "path": '8 vs 8 widget', "index": 8},
  ];
  List title = [
    intl.sEQUENCEDURATION,
    intl.sEQUENCENUMBER,
    intl.rECOVERYBETWEENSEQUENCES,
    intl.tERRAINSIZE,
    intl.aTHLETICINTERESTS,
    intl.tECHNICALTACTICINTERESTS
  ];
  List tableInformations = [
    {
      "title": intl.ch1v1,
      "index": 1,
      intl.sEQUENCEDURATION: intl.sEQUENCEDURATION1,
      intl.sEQUENCENUMBER: intl.sEQUENCENUMBER1,
      intl.rECOVERYBETWEENSEQUENCES: intl.rECOVERYBETWEENSEQUENCES1,
      intl.tERRAINSIZE: intl.tERRAINSIZE1,
      intl.aTHLETICINTERESTS: intl.aTHLETICINTERESTS1,
      intl.tECHNICALTACTICINTERESTS: intl.tECHNICALTACTICINTERESTS1
    },
    {
      "title": intl.ch2v2,
      "index": 2,
      intl.sEQUENCEDURATION: intl.sEQUENCEDURATION2,
      intl.sEQUENCENUMBER: intl.sEQUENCENUMBER2,
      intl.rECOVERYBETWEENSEQUENCES: intl.rECOVERYBETWEENSEQUENCES2,
      intl.tERRAINSIZE: intl.tERRAINSIZE2,
      intl.aTHLETICINTERESTS: intl.aTHLETICINTERESTS2,
      intl.tECHNICALTACTICINTERESTS: intl.tECHNICALTACTICINTERESTS2
    },
    {
      "title": intl.ch3v3,
      "index": 3,
      intl.sEQUENCEDURATION: intl.sEQUENCEDURATION3,
      intl.sEQUENCENUMBER: intl.sEQUENCENUMBER3,
      intl.rECOVERYBETWEENSEQUENCES: intl.rECOVERYBETWEENSEQUENCES3,
      intl.tERRAINSIZE: intl.tERRAINSIZE3,
      intl.aTHLETICINTERESTS: intl.aTHLETICINTERESTS3,
      intl.tECHNICALTACTICINTERESTS: intl.tECHNICALTACTICINTERESTS3
    },
    {
      "title": intl.ch4v4,
      "index": 4,
      intl.sEQUENCEDURATION: intl.sEQUENCEDURATION4,
      intl.sEQUENCENUMBER: intl.sEQUENCENUMBER4,
      intl.rECOVERYBETWEENSEQUENCES: intl.rECOVERYBETWEENSEQUENCES4,
      intl.tERRAINSIZE: intl.tERRAINSIZE4,
      intl.aTHLETICINTERESTS: intl.aTHLETICINTERESTS4,
      intl.tECHNICALTACTICINTERESTS: intl.tECHNICALTACTICINTERESTS4
    },
    {
      "title": intl.ch5v5,
      "index": 5,
      intl.sEQUENCEDURATION: intl.sEQUENCEDURATION5,
      intl.sEQUENCENUMBER: intl.sEQUENCENUMBER5,
      intl.rECOVERYBETWEENSEQUENCES: intl.rECOVERYBETWEENSEQUENCES5,
      intl.tERRAINSIZE: intl.tERRAINSIZE5,
      intl.aTHLETICINTERESTS: intl.aTHLETICINTERESTS5,
      intl.tECHNICALTACTICINTERESTS: intl.tECHNICALTACTICINTERESTS5
    },
    {
      "title": intl.ch6v6,
      "index": 6,
      intl.sEQUENCEDURATION: intl.sEQUENCEDURATION6,
      intl.sEQUENCENUMBER: intl.sEQUENCENUMBER6,
      intl.rECOVERYBETWEENSEQUENCES: intl.rECOVERYBETWEENSEQUENCES6,
      intl.tERRAINSIZE: intl.tERRAINSIZE6,
      intl.aTHLETICINTERESTS: intl.aTHLETICINTERESTS6,
      intl.tECHNICALTACTICINTERESTS: intl.tECHNICALTACTICINTERESTS6
    },
    {
      "title": intl.ch7v7,
      "index": 7,
      intl.sEQUENCEDURATION: intl.sEQUENCEDURATION7,
      intl.sEQUENCENUMBER: intl.sEQUENCENUMBER7,
      intl.rECOVERYBETWEENSEQUENCES: intl.rECOVERYBETWEENSEQUENCES7,
      intl.tERRAINSIZE: intl.tERRAINSIZE7,
      intl.aTHLETICINTERESTS: intl.aTHLETICINTERESTS7,
      intl.tECHNICALTACTICINTERESTS: intl.tECHNICALTACTICINTERESTS7
    },
    {
      "title": intl.ch8v8,
      "index": 8,
      intl.sEQUENCEDURATION: intl.sEQUENCEDURATION8,
      intl.sEQUENCENUMBER: intl.sEQUENCENUMBER8,
      intl.rECOVERYBETWEENSEQUENCES: intl.rECOVERYBETWEENSEQUENCES8,
      intl.tERRAINSIZE: intl.tERRAINSIZE8,
      intl.aTHLETICINTERESTS: intl.aTHLETICINTERESTS8,
      intl.tECHNICALTACTICINTERESTS: intl.tECHNICALTACTICINTERESTS8
    },
  ];

  String? langue = "";
  @override
  void initState() {
    ln();
    // TODO: implement initState

    super.initState();
  }

  Future<void> ln() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    langue = prefs.getString('SAVED_LOCALIZATION');
  }

/* langue == "ar" ? titleSize = 18 : titleSize = 10;
    langue == "ar" ? dataSize = 15 : dataSize = 10;
  double titleSize = 18;
  double dataSize = 15; */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.characteristic),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.sizeOf(context).height * 0.01,
                ),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.37,
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio:
                          MediaQuery.sizeOf(context).width * 0.007,
                      children: List.generate(
                        choices.length,
                        (index) => SizedBox(
                          child: OutlinedButton(
                            style: ButtonStyle(
                                backgroundColor: colorIndex ==
                                        choices[index]['index']
                                    ? MaterialStatePropertyAll(Colors.yellow)
                                    : MaterialStatePropertyAll(
                                        Colors.transparent)),
                            onPressed: () {
                              setState(() {
                                colorIndex = choices[index]['index'];
                                print(colorIndex);
                              });
                            },
                            child: Text(
                              choices[index]["title"],
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                        ),
                      )),
                ),
              ),
              Center(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  child: SingleChildScrollView(
                    child: Column(
                      children: title
                          .map(
                            (item) => Column(
                              children: [
                                Dimensions.verticalSpacingExtraLarge,
                                Column(
                                  children: [
                                    Card(
                                      color: AppColors.primaryColor,
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                                child: Center(
                                              child: Text(
                                                "${item} :",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Text(
                                      tableInformations[colorIndex - 1][item]
                                          .toString(),
                                      style: TextStyle(fontSize: 16),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
