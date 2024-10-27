import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pedagogue/utils/resources/api/token_manager.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';

class YoyoEndurance12 extends StatefulWidget {
  const YoyoEndurance12({super.key});

  @override
  State<YoyoEndurance12> createState() => _YoyoEndurance12State();
}

class _YoyoEndurance12State extends State<YoyoEndurance12> {
  Future<void> getResult(dynamic level, dynamic shuttles, dynamic version,
      BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url =
        Uri.parse('https://www.mobile.sportspedagogue.com/api/Yo_Yo_1_2');
    final response = await http.post(url, headers: headers, body: {
      "level": level,
      "shuttles": shuttles,
      "version": version == "1" ? "0" : "1180",
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        distance_result = data['distance_result'].toString();
        totalshuttles_result = data['totalshuttles_result'].toString();
        calcval_result = data['calcval_result'].toString();
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

  TextEditingController levelController = TextEditingController();
  TextEditingController shuttlesController = TextEditingController();
  TextEditingController versionController = TextEditingController();
  String distance_result = "0";
  String totalshuttles_result = "0";
  String calcval_result = "0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.yoyoEnduranceTitle1),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Text("${intl.yoyoEnduranceTitle2}"),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.yoyoEnduranceTitle3}"),
                Dimensions.verticalSpacingExtraLarge,
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text("${intl.yoyoEnduranceTitle4}:")),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text("${intl.yoyoEnduranceTitle5}")),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: CustomInput(
                          controller: versionController,
                          inputType: InputType.dropdown,
                          dropdownItems: ["1", "2"],
                        )),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text("${intl.yoyoEnduranceTitle6}: ")),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: CustomInput(
                            controller: levelController,
                            inputType: InputType.text)),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text("${intl.yoyoEnduranceTitle7}:")),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: CustomInput(
                            controller: shuttlesController,
                            inputType: InputType.text)),
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
                        getResult(levelController.text, shuttlesController.text,
                            versionController.text, context);
                      },
                      child: Text("${intl.calcul}")),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "${intl.yOURRESULTS}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Column(
                  children: [
                    Text("${intl.yoyoEnduranceTitle8}: $distance_result"),
                    Text(
                        "${intl.yoyoEnduranceTitle9}:  $totalshuttles_result "),
                    Text(
                        "${intl.vO2Max}: $calcval_result ${intl.ml}/${intl.kg}/${intl.min}"),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.yoyoEnduranceTitle10}"),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.yoyoEnduranceTitle11}"),
                Dimensions.verticalSpacingExtraLarge,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
