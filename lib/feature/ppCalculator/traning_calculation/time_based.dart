import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../utils/resources/api/token_manager.dart';

class TimeBased extends StatefulWidget {
  const TimeBased({super.key});

  @override
  State<TimeBased> createState() => _TimeBasedState();
}

class _TimeBasedState extends State<TimeBased> {
  Future<void> getResult(dynamic VMA, dynamic Time_min, dynamic Time_sec,
      dynamic percentage, BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};
    print(VMA);
    print(Time_min);
    print(Time_sec);
    print(percentage);
    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url =
        Uri.parse('https://www.mobile.sportspedagogue.com/api/time_based');
    final response = await http.post(url, headers: headers, body: {
      "VMA": VMA,
      "time_min": Time_min,
      "time_sec": Time_sec,
      "percentage": percentage,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        resultDSTTPS = data['resultDSTTPS'].toString();
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

  TextEditingController VMAController = TextEditingController();
  TextEditingController Time_minController = TextEditingController();
  TextEditingController Time_secController = TextEditingController();
  TextEditingController percentageController = TextEditingController();
  String resultDSTTPS = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            "${intl.timeBased}",
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
                  SizedBox(child: Text("${intl.timeBasedTitle1}")),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomInput(
                        controller: VMAController,
                        inputType: InputType.text,
                      )),
                ],
              ),
              Dimensions.verticalSpacingMedium,
              Column(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text("${intl.timeBasedTitle2}")),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(child: Text("${intl.timeBasedTitle3}")),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: CustomInput(
                          controller: percentageController,
                          inputType: InputType.text)),
                  SizedBox(child: Text("%")),
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
                          VMAController.text,
                          Time_minController.text,
                          Time_secController.text,
                          percentageController.text,
                          context);
                    },
                    child: Text("${intl.calcul}")),
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                children: [
                  SizedBox(
                      child: Text("${intl.timeBasedTitle4} ${resultDSTTPS}")),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
