import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../utils/resources/api/token_manager.dart';

class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {
  Future<void> getResult(dynamic Time_min, dynamic distance, dynamic Time_sec,
      BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url = Uri.parse('https://www.mobile.sportspedagogue.com/api/CAT');
    final response = await http.post(url, headers: headers, body: {
      "Time_min": Time_min,
      "distance": distance,
      "Time_sec": Time_sec,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        VMA = data['VMA'].toString();
        Either = data['Either'].toString();
        VO2max = data['VO2max'].toString();
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

  TextEditingController distanceController = TextEditingController();
  TextEditingController Time_minController = TextEditingController();
  TextEditingController Time_secController = TextEditingController();
  String VMA = "";
  String Either = "";
  String VO2max = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            "${intl.cat}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Dimensions.verticalSpacingSmall,
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            "${intl.catDesc}",
            textAlign: TextAlign.center,
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
                  SizedBox(child: Text("${intl.catTitle1}")),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomInput(
                        controller: distanceController,
                        inputType: InputType.dropdown,
                        dropdownItems: [
                          "3000${intl.m}",
                          "2000${intl.m}",
                          "1500${intl.m}",
                          "1000${intl.m}"
                        ],
                      )),
                ],
              ),
              Dimensions.verticalSpacingMedium,
              Column(
                children: [
                  SizedBox(child: Text("${intl.catTitle2}")),
                  Dimensions.verticalSpacingMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: CustomInput(
                              controller: Time_minController,
                              inputType: InputType.text)),
                      SizedBox(child: Text("${intl.minutes1}")),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: CustomInput(
                              controller: Time_secController,
                              inputType: InputType.text)),
                      SizedBox(child: Text("${intl.seconds1}")),
                    ],
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
                      getResult(
                          Time_minController.text,
                          distanceController.text.replaceAll("m", ""),
                          Time_secController.text,
                          context);
                    },
                    child: Text("${intl.calcul}")),
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                children: [
                  SizedBox(child: Text("${intl.catTitle3} ${VMA}")),
                ],
              ),
              Row(
                children: [
                  SizedBox(child: Text("${intl.catTitle4} ${Either}")),
                ],
              ),
              Row(
                children: [
                  SizedBox(child: Text("${intl.catTitle5} ${VO2max}")),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
