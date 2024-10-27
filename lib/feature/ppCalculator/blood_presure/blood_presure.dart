import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';
import '../../../utils/resources/api/token_manager.dart';

class BloodPresure extends StatefulWidget {
  const BloodPresure({super.key});

  @override
  State<BloodPresure> createState() => _BloodPresureState();
}

class _BloodPresureState extends State<BloodPresure> {
  Future<void> getResult(String age, BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }

    String age1 = "1";
    switch (age) {
      case '15-20':
        age1 = "1";
        break;
      case '20-24':
        age1 = "2";
        break;
      case '25-29':
        age1 = "3";
        break;
      case '30-34':
        age1 = "4";
        break;
      case '35-39':
        age1 = "5";
        break;
      case '40-44':
        age1 = "6";
        break;
      case '45-49':
        age1 = "7";
        break;

      case '50-54':
        age1 = "8";
        break;

      case '55-59':
        age1 = "9";
        break;

      case '60-64':
        age1 = "10";
        break;
    }
    final url =
        Uri.parse('https://www.mobile.sportspedagogue.com/api/blood_pressure');
    final response =
        await http.post(url, headers: headers, body: {"age": age1});
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        systolicMin = data['systolic']["min"].toString();
        systolicAvg = data['systolic']["avg"].toString();
        systolicMax = data['systolic']["max"].toString();
        diastolicMin = data['diastolic']["min"].toString();
        diastolicAvg = data['diastolic']["avg"].toString();
        diastolicMax = data['diastolic']["max"].toString();
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

  String systolicMin = "0";
  String systolicAvg = "0";
  String systolicMax = "0";
  String diastolicMin = "0";
  String diastolicAvg = "0";
  String diastolicMax = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.bloodPressureList}"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Text(
                  "${intl.bloodPressure1}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  imageUrl:
                      "https://app.sportspedagogue.com/_nuxt/img/blood.e30cc2e.jpg",
                  imageBuilder: (context, imageProvioder) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvioder, fit: BoxFit.fill),
                      ),
                    );
                  },
                  placeholder: (context, url) => const SizedBox(
                    height: 250,
                    width: 164,
                    child: Center(child: LoadingWidget()),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "${intl.bloodPressure2}",
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "${intl.bloodPressure3}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Center(child: Text("${intl.bloodPressure4}:"))),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: CustomInput(
                          controller: ageController,
                          inputType: InputType.dropdown,
                          dropdownItems: [
                            "15-19",
                            "20-24",
                            "25-29",
                            "30-34",
                            "35-39",
                            "40-44",
                            "45-49",
                            "50-54",
                            "55-59",
                            "60-64",
                          ],
                        )),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
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
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "${intl.yOURRESULTS}:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Card(
                  color: Colors.white70,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text("${intl.bloodPressure5}(${intl.mmHg}):")),
                        Dimensions.verticalSpacingMedium,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Center(
                                    child:
                                        Text("$systolicMin ${intl.minutes1}"))),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Center(
                                    child: Text("$systolicAvg ${intl.avg}"))),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Center(
                                    child: Text("$systolicMax ${intl.max}"))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text("${intl.bloodPressure6}(${intl.mmHg}):")),
                        Dimensions.verticalSpacingMedium,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Center(
                                    child: Text(
                                        "$diastolicMin ${intl.minutes1}"))),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Center(
                                    child: Text("$diastolicAvg ${intl.avg}"))),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Center(
                                    child: Text("$diastolicMax ${intl.max}"))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Dimensions.verticalSpacingExtraLarge,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
