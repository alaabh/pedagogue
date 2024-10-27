import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../utils/resources/api/token_manager.dart';

class Ruffer extends StatefulWidget {
  const Ruffer({super.key});

  @override
  State<Ruffer> createState() => _RufferState();
}

class _RufferState extends State<Ruffer> {
  Future<void> getResult(dynamic heart, dynamic flexes, dynamic recovery,
      BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url = Uri.parse('https://www.mobile.sportspedagogue.com/api/ruffier');
    final response = await http.post(url, headers: headers, body: {
      "heart": heart,
      "flexes": flexes,
      "recovery": recovery,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        Ruffier = data['Ruffier'].toString();
        Dickson = data['Dickson'].toString();
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

  TextEditingController heartController = TextEditingController();
  TextEditingController flexesController = TextEditingController();
  TextEditingController recoveryController = TextEditingController();

  String Ruffier = "";
  String Dickson = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            "${intl.ruffier}",
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text("${intl.ruffierTitle1}")),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomInput(
                        controller: heartController,
                        inputType: InputType.text,
                      )),
                ],
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text("${intl.ruffierTitle2}")),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomInput(
                        controller: flexesController,
                        inputType: InputType.text,
                      )),
                ],
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text("${intl.ruffierTitle3}")),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: TextField(
                      controller: recoveryController,
                      decoration: InputDecoration(),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Dimensions.verticalSpacingMedium,
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.25,
                child: FilledButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.amber.shade400)),
                    onPressed: () {
                      getResult(heartController.text, flexesController.text,
                          recoveryController.text, context);
                    },
                    child: Text("${intl.calcul}")),
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(child: Text("${intl.ruffierTitle4} ${Ruffier}")),
                ],
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(child: Text("${intl.ruffierTitle5} ${Dickson}")),
                ],
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
                  child: Text('${intl.ruffierColumn1Title1}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('${intl.ruffierColumn2Title1}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('${intl.ruffierColumn3Title1}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text('< 0', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('${intl.ruffierColumn2Title2}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('< 0', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text('0 ${intl.and}} 5	', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('${intl.ruffierColumn2Title3}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('0 ${intl.at} 3', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text('5 ${intl.and} 10	', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('${intl.ruffierColumn2Title4}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('3 ${intl.at} 6', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child:
                      Text('10 ${intl.and} 15	', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('${intl.ruffierColumn2Title5}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('6 ${intl.at} 8', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text('> 15	', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('${intl.ruffierColumn2Title6}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('> 8', textAlign: TextAlign.center),
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
