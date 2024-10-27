import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pedagogue/utils/resources/api/token_manager.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';

class Cooper extends StatefulWidget {
  const Cooper({super.key});

  @override
  State<Cooper> createState() => _CooperState();
}

class _CooperState extends State<Cooper> {
  Future<void> getResult(
      dynamic age, dynamic Distance, dynamic sex, BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url = Uri.parse('https://www.mobile.sportspedagogue.com/api/cooper');
    final response = await http.post(url, headers: headers, body: {
      "age": age,
      "Distance": Distance,
      "sex": sex == "Male" ? "0" : "1",
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        VMA = data['VMA'].toString();
        Either = data['Either'].toString();
        VO2max = data['VO2max'].toString();
        Result = data['Result'].toString();
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

  TextEditingController DistanceController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  String VMA = "";
  String Either = "";
  String VO2max = "";
  String Result = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            "${intl.cooper}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Dimensions.verticalSpacingSmall,
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            "${intl.cooperDesc}",
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
                  SizedBox(child: Text("${intl.cooperTitle1}")),
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
                  SizedBox(child: Text("${intl.cooperTitle2}")),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomInput(
                          controller: ageController,
                          inputType: InputType.text)),
                ],
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text("${intl.cooperTitle3}")),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomInput(
                          controller: DistanceController,
                          inputType: InputType.text)),
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
                      getResult(ageController.text, DistanceController.text,
                          sexController.text, context);
                    },
                    child: Text("${intl.calcul}")),
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                children: [
                  SizedBox(child: Text("${intl.cooperTitle4} ${VMA}")),
                ],
              ),
              Row(
                children: [
                  SizedBox(child: Text("${intl.cooperTitle5} ${Either}")),
                ],
              ),
              Row(
                children: [
                  SizedBox(child: Text("${intl.cooperTitle6} ${VO2max}")),
                ],
              ),
              Row(
                children: [
                  SizedBox(child: Text("${intl.cooperTitle7} ${Result}")),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
