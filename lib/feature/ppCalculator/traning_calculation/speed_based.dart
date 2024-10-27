import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../utils/resources/api/token_manager.dart';

class SpeedBased extends StatefulWidget {
  const SpeedBased({super.key});

  @override
  State<SpeedBased> createState() => _SpeedBasedState();
}

class _SpeedBasedState extends State<SpeedBased> {
  Future<void> getResult(
      dynamic reference_distance,
      dynamic planned_distance,
      dynamic Time_sec,
      dynamic Time_min,
      dynamic Time_her,
      BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url =
        Uri.parse('https://www.mobile.sportspedagogue.com/api/speed_based');
    final response = await http.post(url, headers: headers, body: {
      "reference_distance": reference_distance,
      "planned_distance": planned_distance,
      "Time_sec": Time_sec,
      "Time_min": Time_min,
      "Time_her": Time_her,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        Timeher = data['time her'].toString();
        Timemin = data['time min'].toString();
        Timesec = data['time sec'].toString();
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

  TextEditingController reference_distanceController = TextEditingController();
  TextEditingController Time_herController = TextEditingController();
  TextEditingController Time_minController = TextEditingController();
  TextEditingController Time_secController = TextEditingController();
  TextEditingController planned_distanceController = TextEditingController();
  String Timemin = "";
  String Timesec = "";
  String Timeher = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            "${intl.speedBased}",
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
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text("${intl.speedBasedTitle1}")),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomInput(
                        controller: reference_distanceController,
                        inputType: InputType.text,
                      )),
                ],
              ),
              Dimensions.verticalSpacingMedium,
              Column(
                children: [
                  SizedBox(child: Text("${intl.speedBasedTitle2}")),
                  Dimensions.verticalSpacingMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: TextField(
                          controller: Time_herController,
                          decoration:
                              InputDecoration(label: Text("${intl.hours1}")),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: TextField(
                          controller: Time_minController,
                          decoration:
                              InputDecoration(label: Text("${intl.minutes1}")),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: TextField(
                          controller: Time_secController,
                          decoration:
                              InputDecoration(label: Text("${intl.seconds1}")),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(child: Text("${intl.speedBasedTitle3}")),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: CustomInput(
                          controller: planned_distanceController,
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
                      getResult(
                          reference_distanceController.text,
                          planned_distanceController.text,
                          Time_minController.text,
                          Time_secController.text,
                          Time_herController.text,
                          context);
                    },
                    child: Text("${intl.calcul}")),
              ),
              Dimensions.verticalSpacingMedium,
              Column(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Text("${intl.speedBasedTitle4}")),
                  Dimensions.verticalSpacingMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text("$Timeher ${intl.hours1}")),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text("$Timemin ${intl.minutes1}")),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text("$Timesec ${intl.seconds1}")),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
