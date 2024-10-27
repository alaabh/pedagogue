import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../utils/resources/api/token_manager.dart';

class WeightHeight extends StatefulWidget {
  const WeightHeight({super.key});

  @override
  State<WeightHeight> createState() => _WeightHeightState();
}

class _WeightHeightState extends State<WeightHeight> {
  Future<void> getResult(
      dynamic weight, dynamic height, BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url =
        Uri.parse('https://www.mobile.sportspedagogue.com/api/weight_height');
    final response = await http.post(url, headers: headers, body: {
      "weight": weight,
      "height": height,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        BMI = data['BMI'].toString();
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
  TextEditingController heightController = TextEditingController();

  String BMI = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            "${intl.weightHeight}",
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
                  SizedBox(child: Text("${intl.weightHeightTitle1}")),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomInput(
                        controller: weightController,
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
                      child: Text("${intl.weightHeightTitle2}")),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: TextField(
                      controller: heightController,
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
                      getResult(weightController.text, heightController.text,
                          context);
                    },
                    child: Text("${intl.calcul}")),
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(child: Text("${intl.weightHeightTitle3} $BMI")),
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
                  child: Text('${intl.weightHeightColumn1Title1}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('${intl.weightHeightColumn2Title1}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text('${intl.weightHeightColumn1Title2}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('< 18,5', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text('${intl.weightHeightColumn1Title3}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('18,5 at 24,9', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text('${intl.weightHeightColumn1Title4}	',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('25 at 29,9', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text('${intl.weightHeightColumn1Title5}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('> 30', textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text('${intl.weightHeightColumn1Title6}',
                      textAlign: TextAlign.center),
                  verticalAlignment: TableCellVerticalAlignment.middle,
                ),
                TableCell(
                  child: Text('> 40', textAlign: TextAlign.center),
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
