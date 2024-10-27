import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../utils/resources/api/token_manager.dart';

class Karnoven extends StatefulWidget {
  const Karnoven({super.key});

  @override
  State<Karnoven> createState() => _KarnovenState();
}

class _KarnovenState extends State<Karnoven> {
  Future<void> getResult(
      dynamic HRmax, dynamic HR, BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url =
        Uri.parse('https://www.mobile.sportspedagogue.com/api/Karnoven');
    final response = await http.post(url, headers: headers, body: {
      "HRmax": HRmax,
      "HR": HR,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        zone1inf = data['Zone 1\tinf'].toString();
        zone1sup = data['Zone 1\tsup'].toString();
        zone2inf = data['Zone 2 inf'].toString();
        zone2sup = data['Zone 2 sup'].toString();
        zone3inf = data['Zone 3 inf'].toString();
        zone3sup = data['Zone 3 sup'].toString();
        zone4inf = data['Zone 4 inf'].toString();
        zone4sup = data['Zone 4 sup'].toString();
        zone5inf = data['Zone 5 inf'].toString();
        zone5sup = data['Zone 5 sup'].toString();
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

  TextEditingController hRmaxController = TextEditingController();
  TextEditingController hRController = TextEditingController();

  String zone1inf = "";
  String zone1sup = "";
  String zone2inf = "";
  String zone2sup = "";
  String zone3inf = "";
  String zone3sup = "";
  String zone4inf = "";
  String zone4sup = "";
  String zone5inf = "";
  String zone5sup = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            intl.karnoven,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Dimensions.verticalSpacingSmall,
        Container(
          padding: Dimensions.paddingMedium,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration:
              BoxDecoration(border: Border.all(color: AppColors.primaryColor)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(intl.karnovenTitle1)),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomInput(
                          controller: hRmaxController,
                          inputType: InputType.text)),
                ],
              ),
              Dimensions.verticalSpacingSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(intl.karnovenTitle2)),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomInput(
                          controller: hRController, inputType: InputType.text)),
                ],
              ),
                SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.25,
                child: FilledButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.amber.shade400)),
                    onPressed: () {
                   getResult(
                            hRmaxController.text, hRController.text, context);
                    },
                    child: Text("${intl.calcul}")),
              ),
              
            ],
          ),
        ),
        Dimensions.verticalSpacingMedium,
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Table(
            border: TableBorder.all(color: Colors.grey),
            children: [
              TableRow(children: [
                TableCell(
                  child: Text(intl.karnovenColumn1Title1,
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text(intl.karnovenColumn2Title1,
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text(intl.karnovenColumn3Title1,
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text(intl.karnovenColumn1Title2,
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text(
                      '${intl.between} ${zone1inf}\n${intl.and} ${zone1sup}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('40 - 60', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text(intl.karnovenColumn1Title3,
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text(
                      '${intl.between} ${zone2inf}\n${intl.and}${zone2sup}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('60 - 70', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text(intl.karnovenColumn1Title4,
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text(
                      '${intl.between} ${zone3inf}\n${intl.and}${zone3sup}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('70 - 85', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text(intl.karnovenColumn1Title5,
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text(
                      '${intl.between} ${zone4inf}\n${intl.and}${zone4sup}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('85 - 95', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text(intl.karnovenColumn1Title6,
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text(
                      '${intl.between} ${zone5inf}\n${intl.and}${zone5sup}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('95 - 100', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
