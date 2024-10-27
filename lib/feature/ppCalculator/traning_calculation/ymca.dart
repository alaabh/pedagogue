import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../utils/resources/api/token_manager.dart';

class Ymca extends StatefulWidget {
  const Ymca({super.key});

  @override
  State<Ymca> createState() => _YmcaState();
}

class _YmcaState extends State<Ymca> {
  Future<void> getResult(
      dynamic weight, dynamic waist, dynamic sex, BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url = Uri.parse('https://www.mobile.sportspedagogue.com/api/YMCA');
    final response = await http.post(url, headers: headers, body: {
      "weight": weight,
      "waist": waist,
      "sex": sex == intl.male ? "0" : "1",
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        percentage = data['percentage'].toString();
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

  TextEditingController weightController = TextEditingController();
  TextEditingController waistController = TextEditingController();
  TextEditingController sexController = TextEditingController();

  String percentage = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            "${intl.ymca}",
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
                  SizedBox(child: Text("${intl.ymcaTitle1}")),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomInput(
                        controller: sexController,
                        inputType: InputType.dropdown,
                        dropdownItems: ["${intl.male}", "${intl.female}"],
                      )),
                ],
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text("${intl.ymcaTitle2}")),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: TextField(
                      controller: weightController,
                      decoration: InputDecoration(),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text("${intl.ymcaTitle3}")),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: TextField(
                      controller: waistController,
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
                      getResult(weightController.text, waistController.text,
                          sexController.text, context);
                    },
                    child: Text("${intl.calcul}")),
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(child: Text("${intl.ymcaTitle4} $percentage")),
                ],
              ),
            ],
          ),
        ),
        Dimensions.verticalSpacingMedium,
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            "${intl.ymcaTitle5}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Dimensions.verticalSpacingSmall,
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Table(
            border: TableBorder.all(color: Colors.grey),
            children: [
              TableRow(children: [
                TableCell(
                  child: Text('${intl.ymcaColumn1Title1}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('${intl.ymcaColumn2Title1}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('${intl.ymcaColumn3Title1}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text('${intl.ymcaColumn1Title2}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('15%	', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('25%', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text('${intl.ymcaColumn1Title3}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('17.5%	', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('27.5%', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text('${intl.ymcaColumn1Title4}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('20%	', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('30%', textAlign: TextAlign.center),
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
