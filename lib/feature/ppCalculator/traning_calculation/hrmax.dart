import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pedagogue/l10n/localization.dart';

import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../utils/resources/api/token_manager.dart';

class Hrmax extends StatefulWidget {
  const Hrmax({super.key});

  @override
  State<Hrmax> createState() => _HrmaxState();
}

class _HrmaxState extends State<Hrmax> {
  Future<void> getResult(dynamic age, BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url = Uri.parse('https://www.mobile.sportspedagogue.com/api/HRMax');
    final response = await http.post(url, headers: headers, body: {"age": age});
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        HRmax = data['HRmax'].toString();
        margin = data['margin'].toString();
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

  TextEditingController ageController = TextEditingController();
  String HRmax = "";
  String margin = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            intl.hrmaxBigTitle,
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
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Text(intl.hrmaxTitle1)),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomInput(
                          controller: ageController,
                          inputType: InputType.text)),
                          SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.25,
                child: FilledButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.amber.shade400)),
                    onPressed: () {
                    getResult(ageController.text, context);
                    },
                    child: Text("${intl.calcul}")),
              ),
                 
                ],
              ),
              Dimensions.verticalSpacingSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text("${intl.hrmaxTitle2} ${HRmax}")),
                ],
              ),
              Dimensions.verticalSpacingSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text("${intl.hrmaxTitle3} ${margin}")),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
