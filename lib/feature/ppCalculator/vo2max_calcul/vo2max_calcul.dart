import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pedagogue/shared/style/app_color.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../utils/resources/api/token_manager.dart';

class vo2maxCalcul extends StatefulWidget {
  const vo2maxCalcul({super.key});

  @override
  State<vo2maxCalcul> createState() => _vo2maxCalculState();
}

class _vo2maxCalculState extends State<vo2maxCalcul> {
  Future<void> getResult(dynamic units, dynamic hrs, dynamic mins, dynamic secs,
      dynamic dist, BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url =
        Uri.parse('https://www.mobile.sportspedagogue.com/api/vo2maxcalculate');
    final response = await http.post(url, headers: headers, body: {
      "units": units,
      "hrs": hrs,
      "mins": mins,
      "secs": secs,
      "dist": dist,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        vo2 = data['vo2'].toString();
      });

      print(data);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // Return an AlertDialog with success message
          return AlertDialog(
            title: Text('failed'),
            content: Text('Check your internet connection or your input'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  TextEditingController unitsController = TextEditingController();
  TextEditingController hrsController = TextEditingController();
  TextEditingController minsController = TextEditingController();
  TextEditingController secsController = TextEditingController();
  TextEditingController distController = TextEditingController();
  String vo2 = "0";
  List<Map<String, String>> femaleTable = [
    {
      "Age": intl.age,
      "Very insufficient": intl.veryinsUfficient,
      "Insufficient": intl.insufficient,
      "Satisfactory": intl.satisfactory,
      "Good": intl.good,
      "Very good": intl.veryGood,
      "Excellent": intl.excellent,
    },
    {
      "Age": "13-19",
      "Very insufficient": "<25.0",
      "Insufficient": "25.0 - 30.9",
      "Satisfactory": "25.0 - 30.9",
      "Good": "35.0 - 38.9",
      "Very good": "39.0 - 41.9",
      "Excellent": ">41.9",
    },
    {
      "Age": "20-29",
      "Very insufficient": "<23.6",
      "Insufficient": "23.6 - 28.9",
      "Satisfactory": "29.0 - 32.9",
      "Good": "33.0 - 36.9",
      "Very good": "37.0 - 41.0",
      "Excellent": ">41.0",
    },
    {
      "Age": "30-39",
      "Very insufficient": "<22.8",
      "Insufficient": "22.8 - 26.9",
      "Satisfactory": "27.0 - 31.4",
      "Good": "31.5 - 35.6",
      "Very good": "35.7 - 40.0",
      "Excellent": ">40.0",
    },
    {
      "Age": "40-49",
      "Very insufficient": "<21.0",
      "Insufficient": "21.0 - 24.4",
      "Satisfactory": "24.5 - 28.9",
      "Good": "29.0 - 32.8",
      "Very good": "32.9 - 36.9",
      "Excellent": ">36.9",
    },
    {
      "Age": "50-59",
      "Very insufficient": "<20.2",
      "Insufficient": "20.2 - 22.7",
      "Satisfactory": "22.8 - 26.9",
      "Good": "27.0 - 31.4",
      "Very good": "31.5 - 35.7",
      "Excellent": ">35.7",
    },
    {
      "Age": "60+",
      "Very insufficient": "<17.5",
      "Insufficient": "17.5 - 20.1",
      "Satisfactory": "20.2 - 24.4",
      "Good": "24.5 - 30.2",
      "Very good": "30.3 - 31.4",
      "Excellent": ">31.4",
    },
  ];
  List<Map<String, String>> maleTable = [
    {
      "Age": intl.age,
      "Very insufficient": intl.veryinsUfficient,
      "Insufficient": intl.insufficient,
      "Satisfactory": intl.satisfactory,
      "Good": intl.good,
      "Very good": intl.veryGood,
      "Excellent": intl.excellent,
    },
    {
      "Age": "13-19",
      "Very insufficient": "<35.0",
      "Insufficient": "35.0 - 38.3",
      "Satisfactory": "38.4 - 45.1",
      "Good": "45.2 - 50.9",
      "Very good": "51.0 - 55.9",
      "Excellent": ">55.9",
    },
    {
      "Age": "20-29",
      "Very insufficient": "<33.0",
      "Insufficient": "33.0 - 36.4",
      "Satisfactory": "36.5 - 42.4",
      "Good": "42.5 - 46.4",
      "Very good": "46.5 - 52.4",
      "Excellent": ">52.4",
    },
    {
      "Age": "30-39",
      "Very insufficient": "<31.5",
      "Insufficient": "31.5 - 35.4",
      "Satisfactory": "35.5 - 40.9",
      "Good": "41.0 - 44.9",
      "Very good": "45.0 - 49.4",
      "Excellent": ">49.4",
    },
    {
      "Age": "40-49",
      "Very insufficient": "<30.2",
      "Insufficient": "30.2 - 33.5",
      "Satisfactory": "33.6 - 38.9",
      "Good": "39.0 - 43.7",
      "Very good": "43.8 - 48.0",
      "Excellent": ">48.0",
    },
    {
      "Age": "50-59",
      "Very insufficient": "<26.1",
      "Insufficient": "26.1 - 30.9",
      "Satisfactory": "31.0 - 35.7",
      "Good": "35.8 - 40.9",
      "Very good": "41.0 - 45.3",
      "Excellent": ">45.3",
    },
    {
      "Age": "60+",
      "Very insufficient": "<20.5",
      "Insufficient": "20.5 - 26.0",
      "Satisfactory": "26.1 - 32.2",
      "Good": "32.3 - 36.4",
      "Very good": "36.5 - 44.2",
      "Excellent": ">44.2",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.vO2MaxTitle1),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Text(intl.vO2MaxTitle2),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  intl.vO2MaxTitle3,
                  style: TextStyle(fontSize: 20),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  intl.vO2MaxTitle4,
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Text("${intl.disatance1} :")),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: CustomInput(
                            controller: distController,
                            inputType: InputType.text)),
                    Dimensions.horizontalSpacingLarge,
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: CustomInput(
                          controller: unitsController,
                          inputType: InputType.dropdown,
                          dropdownItems: [intl.kilometers1, intl.miles1],
                        )),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Text("${intl.time1}:")),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: TextField(
                          controller: hrsController,
                          decoration: InputDecoration(labelText: intl.hours1),
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: TextField(
                          controller: minsController,
                          decoration: InputDecoration(labelText: intl.minutes1),
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: TextField(
                          controller: secsController,
                          decoration: InputDecoration(labelText: intl.seconds1),
                        )),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.25,
                  child: FilledButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.amber.shade400)),
                      onPressed: () {
                        getResult(
                            unitsController.text,
                            hrsController.text,
                            minsController.text,
                            secsController.text,
                            distController.text,
                            context);
                      },
                      child: Text("${intl.calcul}")),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(child: Text("${intl.vO2Max}")),
                    SizedBox(child: Text("$vo2")),
                    SizedBox(child: Text("${intl.ml}/${intl.min}/${intl.kg}")),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  intl.vO2MaxTitle5,
                  style: TextStyle(fontSize: 20, color: AppColors.primaryColor),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  intl.vO2MaxTitle6,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Dimensions.verticalSpacingExtraLarge,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 2,
                    child: Table(
                      columnWidths: {
                        0: FlexColumnWidth(3),
                        1: FlexColumnWidth(8),
                        2: FlexColumnWidth(8),
                        3: FlexColumnWidth(8),
                        4: FlexColumnWidth(8),
                        5: FlexColumnWidth(8),
                        6: FlexColumnWidth(8),
                      },
                      border: TableBorder.all(color: Colors.grey),
                      children: femaleTable.map((row) {
                        return TableRow(
                          children: [
                            TableCell(
                              child: Text(row["Age"]!,
                                  textAlign: TextAlign.center),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                            TableCell(
                              child: Text(row["Very insufficient"]!,
                                  textAlign: TextAlign.center),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                            TableCell(
                              child: Text(row["Insufficient"]!,
                                  textAlign: TextAlign.center),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                            TableCell(
                              child: Text(row["Satisfactory"]!,
                                  textAlign: TextAlign.center),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                            TableCell(
                              child: Text(row["Good"]!,
                                  textAlign: TextAlign.center),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                            TableCell(
                              child: Text(row["Very good"]!,
                                  textAlign: TextAlign.center),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                            TableCell(
                              child: Text(row["Excellent"]!,
                                  textAlign: TextAlign.center),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  intl.vO2MaxTitle7,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Dimensions.verticalSpacingExtraLarge,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 2,
                    child: Table(
                      columnWidths: {
                        0: FlexColumnWidth(3),
                        1: FlexColumnWidth(8),
                        2: FlexColumnWidth(8),
                        3: FlexColumnWidth(8),
                        4: FlexColumnWidth(8),
                        5: FlexColumnWidth(8),
                        6: FlexColumnWidth(8),
                      },
                      border: TableBorder.all(color: Colors.grey),
                      children: maleTable.map((row) {
                        return TableRow(
                          children: [
                            TableCell(
                              child: Text(row["Age"]!,
                                  textAlign: TextAlign.center),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                            TableCell(
                              child: Text(row["Very insufficient"]!,
                                  textAlign: TextAlign.center),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                            TableCell(
                              child: Text(row["Insufficient"]!,
                                  textAlign: TextAlign.center),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                            TableCell(
                              child: Text(row["Satisfactory"]!,
                                  textAlign: TextAlign.center),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                            TableCell(
                              child: Text(row["Good"]!,
                                  textAlign: TextAlign.center),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                            TableCell(
                              child: Text(row["Very good"]!,
                                  textAlign: TextAlign.center),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                            TableCell(
                              child: Text(row["Excellent"]!,
                                  textAlign: TextAlign.center),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Dimensions.verticalSpacingExtraLarge,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
