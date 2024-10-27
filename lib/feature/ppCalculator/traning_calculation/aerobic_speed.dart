import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../utils/resources/api/token_manager.dart';

class AerobicSpeed extends StatefulWidget {
  const AerobicSpeed({super.key});

  @override
  State<AerobicSpeed> createState() => _AerobicSpeedState();
}

class _AerobicSpeedState extends State<AerobicSpeed> {
  Future<void> getResult(dynamic VMA, BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url =
        Uri.parse('https://www.mobile.sportspedagogue.com/api/aerobic_speed');
    final response = await http.post(url, headers: headers, body: {
      "VMA": VMA,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        zone1recupinf = data['Zone1recupinf'].toString();
        zone1recupsup = data['Zone1recupsup'].toString();
        zone2endinf = data['Zone2endinf'].toString();
        zone2endsup = data['Zone2endsup'].toString();
        zone3emainf = data['Zone3emainf'].toString();
        zone3emasup = data['Zone3emasup'].toString();
        zone4pmainf = data['Zone4pmainf'].toString();
        zone4pmasup = data['Zone4pmasup'].toString();
        zone5vmainf = data['Zone5vmainf'].toString();
        zone5vmasup = data['Zone5vmasup'].toString();
        zone1tpskmmnrecupinf = data['Zone1tpskmmnrecupinf'].toString();
        zone1tpskmmnrecupsup = data['Zone1tpskmmnrecupsup'].toString();
        zone2tpskmmnendinf = data['Zone2tpskmmnendinf'].toString();
        zone2pskmmnendsup = data['Zone2pskmmnendsup'].toString();
        zone3tpskmmnemainf = data['Zone3tpskmmnemainf'].toString();
        zone3tpskmmnemasup = data['Zone3tpskmmnemasup'].toString();
        zone4tpskmmnpmainf = data['Zone4tpskmmnpmainf'].toString();
        zone4tpskmmnpmasup = data['Zone4tpskmmnpmasup'].toString();
        zone5tpskmmnvmainf = data['Zone5tpskmmnvmainf'].toString();
        zone5tpskmmnvmasup = data['Zone5tpskmmnvmasup'].toString();
        zone1tpskmsecrecupinf = data['Zone1tpskmsecrecupinf'].toString();
        zone1tpskmsecrecupsup = data['Zone1tpskmsecrecupsup'].toString();
        zone2tpskmsecendinf = data['Zone2tpskmsecendsup'].toString();
        zone2tpskmsecendsup = data['Zone3tpskmsecemainf'].toString();
        zone3tpskmsecemainf = data['Zone3tpskmsecemasup'].toString();
        zone3tpskmsecemasup = data['Zone4tpskmsecpmainf'].toString();
        zone4tpskmsecpmainf = data['Zone4tpskmsecpmasup'].toString();
        zone4tpskmsecpmasup = data['Zone5tpskmsecvmainf'].toString();
        zone5tpskmsecvmainf = data['Zone5tpskmsecvmasup'].toString();
        zone5tpskmsecvmasup = data['Zone1recupinf'].toString();
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

  TextEditingController vMAController = TextEditingController();

  String zone1recupinf = "";
  String zone1recupsup = "";
  String zone2endinf = "";
  String zone2endsup = "";
  String zone3emainf = "";
  String zone3emasup = "";
  String zone4pmainf = "";
  String zone4pmasup = "";
  String zone5vmainf = "";
  String zone5vmasup = "";
  String zone1tpskmmnrecupinf = "";
  String zone1tpskmmnrecupsup = "";
  String zone2tpskmmnendinf = "";
  String zone2pskmmnendsup = "";
  String zone3tpskmmnemainf = "";
  String zone3tpskmmnemasup = "";
  String zone4tpskmmnpmainf = "";
  String zone4tpskmmnpmasup = "";
  String zone5tpskmmnvmainf = "";
  String zone5tpskmmnvmasup = "";
  String zone1tpskmsecrecupinf = "";
  String zone1tpskmsecrecupsup = "";
  String zone2tpskmsecendinf = "";
  String zone2tpskmsecendsup = "";
  String zone3tpskmsecemainf = "";
  String zone3tpskmsecemasup = "";
  String zone4tpskmsecpmainf = "";
  String zone4tpskmsecpmasup = "";
  String zone5tpskmsecvmainf = "";
  String zone5tpskmsecvmasup = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            "${intl.aerobicSpeed}",
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
              Dimensions.verticalSpacingSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text("${intl.aerobicSpeedTitle1}")),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomInput(inputType: InputType.text)),
                ],
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.25,
                child: FilledButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.amber.shade400)),
                    onPressed: () {
                      getResult(vMAController.text, context);
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
                  child: Text('${intl.aerobicSpeedColumn1Title1}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('${intl.aerobicSpeedColumn2Title1}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('${intl.aerobicSpeedColumn3Title1}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text('${intl.aerobicSpeedColumn1Title2}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text(
                      '${intl.between} ${zone1recupinf}\n${intl.and} ${zone1recupsup} \n ${intl.between}\n ${zone1tpskmmnrecupinf} ${intl.minutes1} ${zone1tpskmmnrecupsup} ${intl.seconds1}\n${intl.and}\n ${zone1tpskmsecrecupinf} ${intl.minutes1} ${zone1tpskmsecrecupsup} ${intl.seconds1} ',
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
                  child: Text('${intl.aerobicSpeedColumn1Title3}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text(
                      '${intl.between} ${zone2endinf}\n${intl.and} ${zone2endsup} \n ${intl.between}\n ${zone2tpskmmnendinf} ${intl.minutes1} ${zone2pskmmnendsup} ${intl.seconds1}\n${intl.and}\n ${zone2tpskmsecendinf} ${intl.minutes1} ${zone2tpskmsecendsup} ${intl.seconds1} ',
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
                  child: Text('${intl.aerobicSpeedColumn1Title4}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text(
                      '${intl.between} ${zone2endinf}\n${intl.and} ${zone2endinf} \n ${intl.between}\n ${zone2endinf} ${intl.minutes1} ${zone2endinf} ${intl.seconds1}\n${intl.and}\n ${zone2endinf} ${intl.minutes1} ${zone2endinf} ${intl.seconds1} ',
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
                  child: Text('${intl.aerobicSpeedColumn1Title5}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text(
                      '${intl.between} \n${intl.and}  \n ${intl.between}\n  ${intl.minutes1}  ${intl.seconds}\n${intl.and}\n  ${intl.minutes1}  ${intl.seconds} ',
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
                  child: Text('${intl.aerobicSpeedColumn1Title6}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text(
                      '${intl.between} \n${intl.and}  \n ${intl.between}\n  ${intl.minutes1}  ${intl.seconds1}\n${intl.and}\n  ${intl.minutes1}  ${intl.seconds1} ',
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
