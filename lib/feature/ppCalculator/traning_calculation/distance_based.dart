import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../utils/resources/api/token_manager.dart';

class DistanceBased extends StatefulWidget {
  const DistanceBased({super.key});

  @override
  State<DistanceBased> createState() => _DistanceBasedState();
}

class _DistanceBasedState extends State<DistanceBased> {
  Future<void> getResult(dynamic VMA, dynamic distance, dynamic percentage,
      BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url =
        Uri.parse('https://www.mobile.sportspedagogue.com/api/distance_based');
    final response = await http.post(url, headers: headers, body: {
      "VMA": VMA,
      "distance": distance,
      "percentage": percentage,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        Time_min = data['Time_min'].toString();
        Time_sec = data['Time_sec'].toString();
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
  TextEditingController distanceController = TextEditingController();
  TextEditingController percentageController = TextEditingController();
  String Time_min = "";
  String Time_sec = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            "${intl.distanceBased}",
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
                  SizedBox(child: Text("${intl.distanceBasedTitle1}")),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomInput(
                        controller: VMAController,
                        inputType: InputType.text,
                      )),
                ],
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text("${intl.distanceBasedTitle2}")),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: CustomInput(
                          controller: distanceController,
                          inputType: InputType.text)),
                  SizedBox(child: Text("m")),
                ],
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(child: Text("${intl.distanceBasedTitle3}")),
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
                      getResult(VMAController.text, distanceController.text,
                          percentageController.text, context);
                    },
                    child: Text("${intl.calcul}")),
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text("${intl.distanceBasedTitle4}")),
                  SizedBox(child: Text("${Time_min} ${intl.minutes1}")),
                  SizedBox(child: Text("${Time_sec} ${intl.seconds1}")),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
