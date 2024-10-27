import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';

class IndexMassAdiposeView extends StatefulWidget {
  const IndexMassAdiposeView({super.key});

  @override
  State<IndexMassAdiposeView> createState() => _IndexMassAdiposeViewState();
}

class _IndexMassAdiposeViewState extends State<IndexMassAdiposeView> {
  TextEditingController height = TextEditingController(text: "0");
  TextEditingController hip = TextEditingController(text: "0");

  double imaresult = 0;
  double mBresult = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.imaTitle1}"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imaTitle2}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Card(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: CustomInput(
                          controller: height,
                          title: "${intl.height} :",
                          inputType: InputType.text,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: CustomInput(
                          controller: hip,
                          title: "${intl.hip} :",
                          inputType: InputType.text,
                        ),
                      ),
                      CustomButton(
                          text: "${intl.calculate}",
                          onPressed: () {
                            setState(() {
                              var taillem = int.parse(height.text) / 100;
                              var taillesqrt = sqrt(taillem);
                              imaresult = (int.parse(hip.text) /
                                      (taillem * taillesqrt)) -
                                  18;
                            });
                          })
                    ],
                  )),
                ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                      "${intl.imaParag1}\n\n${intl.imaParag2}\n\n${intl.imaParag3}"),
                ),
                Dimensions.verticalSpacingSmall,
                Text(
                  "${intl.yOURRESULTS}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingSmall,
                imaresult == 0
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                            "${intl.imaParag4}\n${intl.imaParag5}\n${intl.imaParag55}"),
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          children: [
                            Text(
                              "${imaresult.toPrecision(2)}%adipose mass (fat mass)\nRefer to the table below to check the status of your build according to your gender and age.",
                              textAlign: TextAlign.center,
                              style: TextStyle(backgroundColor: Colors.cyan),
                            ),
                            Dimensions.verticalSpacingSmall,
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                "Is your IMC too high? You should lose weight to maintain your health, our healthy recipes or ask the community for advice.\nWe also offer other “theoretical ideal weight” calculations.\n(which allow you to use other formulas)",
                              ),
                            ),
                          ],
                        ),
                      ),
                Dimensions.verticalSpacingSmall,
                Text("${intl.imaTitle4}",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    "${intl.imaParag6}\n\n${intl.imaParag7}\n\n${intl.imaParag8}",
                  ),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imaParag9}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    "${intl.imaTitle1} = (H/(T∗T‾‾√2))−18",
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    "${intl.imaParag10}\n\n${intl.imaParag11}",
                  ),
                ),
                Dimensions.verticalSpacingMedium,
                Dimensions.verticalSpacingSmall,
                Text("${intl.imaTitle5}",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imaTableKey1value1}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ),
                Dimensions.verticalSpacingMedium,
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Table(
                    border: TableBorder.symmetric(
                        inside: BorderSide(color: Colors.black)),
                    children: [
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              child: Text(
                            '${intl.imaTableKey2}',
                            textAlign: TextAlign.center,
                          )),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text(
                              '	${intl.imaTableKey3}',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text(
                              '${intl.imaTableKey4}',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              child: Text(
                            '	${intl.imaTableKey2value1}',
                            textAlign: TextAlign.center,
                          )),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Column(
                            children: [
                              Text(
                                '< 21%',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '${intl.imaTableKey3value2}',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '${intl.imaTableKey3value3}',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '> 39%',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                color: Colors.yellow.shade500,
                                child: Text(
                                  '${intl.imaTableKey4value1}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Colors.green.shade500,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '	${intl.imaTableKey4value2}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Colors.orange.shade500,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '${intl.imaTableKey4value3}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Colors.red.shade500,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '	${intl.imaTableKey4value4}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              child: Text(
                            '	${intl.imaTableKey2value2}',
                            textAlign: TextAlign.center,
                          )),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Column(
                            children: [
                              Text(
                                '	< 23%',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '${intl.imaTableKey3value6}',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '${intl.imaTableKey3value7}',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '> 40%',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                color: Colors.yellow.shade500,
                                child: Text(
                                  '${intl.imaTableKey4value1}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Colors.green.shade500,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '	${intl.imaTableKey4value2}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Colors.orange.shade500,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '${intl.imaTableKey4value3}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Colors.red.shade500,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '	${intl.imaTableKey4value4}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              child: Text(
                            '${intl.imaTableKey2value3}',
                            textAlign: TextAlign.center,
                          )),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Column(
                            children: [
                              Text(
                                '< 24%',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '${intl.imaTableKey3value10}',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '${intl.imaTableKey3value11}',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '> 42%',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                color: Colors.yellow.shade500,
                                child: Text(
                                  '${intl.imaTableKey4value1}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Colors.green.shade500,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '	${intl.imaTableKey4value2}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Colors.orange.shade500,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '${intl.imaTableKey4value3}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Colors.red.shade500,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '	${intl.imaTableKey4value4}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                    ],
                  ),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imaTableKey1value2}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ),
                Dimensions.verticalSpacingMedium,
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Table(
                    border: TableBorder.symmetric(
                        inside: BorderSide(color: Colors.black)),
                    children: [
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              child: Text(
                            '${intl.imaTableKey2}',
                            textAlign: TextAlign.center,
                          )),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text(
                              '	${intl.imaTableKey3}',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text(
                              '${intl.imaTableKey4}',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              child: Text(
                            '	${intl.imaTableKey2value1}',
                            textAlign: TextAlign.center,
                          )),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Column(
                            children: [
                              Text(
                                '	< 8%',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '${intl.imaTableKey3value14}',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '${intl.imaTableKey3value15}',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '> 25%',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                color: Colors.yellow.shade500,
                                child: Text(
                                  '${intl.imaTableKey4value1}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Colors.green.shade500,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '	${intl.imaTableKey4value2}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Colors.orange.shade500,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '${intl.imaTableKey4value3}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Colors.red.shade500,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '	${intl.imaTableKey4value4}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              child: Text(
                            '	${intl.imaTableKey2value2}',
                            textAlign: TextAlign.center,
                          )),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Column(
                            children: [
                              Text(
                                '< 11%',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '${intl.imaTableKey3value18}',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '${intl.imaTableKey3value19}',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '> 27%',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                color: Colors.yellow.shade500,
                                child: Text(
                                  '${intl.imaTableKey4value1}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Colors.green.shade500,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '	${intl.imaTableKey4value2}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Colors.orange.shade500,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '${intl.imaTableKey4value3}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Colors.red.shade500,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '	${intl.imaTableKey4value4}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              child: Text(
                            '${intl.imaTableKey2value3}',
                            textAlign: TextAlign.center,
                          )),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Column(
                            children: [
                              Text(
                                '<13%',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '${intl.imaTableKey3value22}',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '${intl.imaTableKey3value23}',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '> 30%',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                color: Colors.yellow.shade500,
                                child: Text(
                                  '${intl.imaTableKey4value1}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Colors.green.shade500,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '	${intl.imaTableKey4value2}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Colors.orange.shade500,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '${intl.imaTableKey4value3}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Colors.red.shade500,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '	${intl.imaTableKey4value4}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                    ],
                  ),
                ),
                Dimensions.verticalSpacingMedium,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
