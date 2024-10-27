import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../utils/resources/api/token_manager.dart';

class KilometerBased extends StatefulWidget {
  const KilometerBased({super.key});

  @override
  State<KilometerBased> createState() => _KilometerBasedState();
}

class _KilometerBasedState extends State<KilometerBased> {
  Future<void> getResult(dynamic distance, dynamic time_se, dynamic time_min,
      dynamic time_her, BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url =
        Uri.parse('https://www.mobile.sportspedagogue.com/api/kilometer_based');
    final response = await http.post(url, headers: headers, body: {
      "distance": distance,
      "time_se": time_se,
      "time_min": time_min,
      "time_her": time_her,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        speed = data['speed'].toString();
        vmainf = data['vma inf'].toString();
        vmasup = data['vma sup'].toString();
        pacemin = data['pace min'].toString();
        pacesec = data['pace sec'].toString();
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
  TextEditingController time_seController = TextEditingController();
  TextEditingController time_minController = TextEditingController();
  TextEditingController time_herController = TextEditingController();
  String speed = "";
  String vmainf = "";
  String vmasup = "";
  String pacemin = "";
  String pacesec = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            "${intl.kilometerBased}",
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
                  SizedBox(child: Text("${intl.kilometerBasedTitle1}")),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomInput(
                        controller: distanceController,
                        inputType: InputType.text,
                      )),
                ],
              ),
              Dimensions.verticalSpacingMedium,
              Column(
                children: [
                  SizedBox(child: Text("${intl.kilometerBasedTitle2}")),
                  Dimensions.verticalSpacingMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: TextField(
                          controller: time_herController,
                          decoration:
                              InputDecoration(label: Text("${intl.hours1}")),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: TextField(
                          controller: time_minController,
                          decoration:
                              InputDecoration(label: Text("${intl.minutes1}")),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: TextField(
                          controller: time_seController,
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
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.25,
                child: FilledButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.amber.shade400)),
                    onPressed: () {
                      getResult(
                          distanceController.text,
                          time_herController.text,
                          time_minController.text,
                          time_herController.text,
                          context);
                    },
                    child: Text("${intl.calcul}")),
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(child: Text("${intl.kilometerBasedTitle3}")),
                  SizedBox(child: Text("$speed")),
                ],
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text("${intl.kilometerBasedTitle4}")),
                  SizedBox(
                      child:
                          Text("$vmainf ${intl.between} $vmasup ${intl.and} ")),
                ],
              ),
              Dimensions.verticalSpacingMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text("${intl.kilometerBasedTitle5}")),
                  SizedBox(
                      child: Text(
                          "$pacemin  ${intl.minutes1} $pacesec ${intl.seconds1}")),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
