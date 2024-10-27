import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../utils/resources/api/token_manager.dart';

class VVo2Max extends StatefulWidget {
  const VVo2Max({super.key});

  @override
  State<VVo2Max> createState() => _VVo2MaxState();
}

class _VVo2MaxState extends State<VVo2Max> {
  Future<void> getResult(dynamic dist, BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url = Uri.parse('https://www.mobile.sportspedagogue.com/api/vVo2max');
    final response =
        await http.post(url, headers: headers, body: {"dist": dist});
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        vVO2max = data['vVO2max'].toString();
        times = data['times'].toString();
        mins = data['mins'].toString();
        secs = data['secs'].toString();
        short_meters = data['short_meters'].toString();
        Approximately = data['Approximately'].toString();
        short_second = data['short_second'].toString();
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

  TextEditingController distController = TextEditingController();
  String vVO2max = "0";
  String times = "0";
  String mins = "0";
  String secs = "0";
  String short_meters = "0";
  String Approximately = "0";
  String short_second = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.vVO2maxMax),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Text(intl.vVO2maxMaxTitle1),
                Dimensions.verticalSpacingExtraLarge,
                Text(intl.vVO2maxMaxTitle),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(child: Text("${intl.vVO2maxMaxTitle2} :")),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: CustomInput(
                            controller: distController,
                            inputType: InputType.text)),
                    Dimensions.horizontalSpacingLarge,
                    SizedBox(child: Text(intl.meters1)),
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
                        getResult(distController.text, context);
                      },
                      child: Text("${intl.calcul}")),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(child: Text("${intl.vVO2max}")),
                    SizedBox(child: Text("$vVO2max")),
                    SizedBox(child: Text(intl.vVO2maxMaxTitle3)),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  intl.vVO2maxMaxTitle4,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  intl.vVO2maxMaxTitle5,
                ),
                Dimensions.verticalSpacingExtraLarge,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        child: Text("${intl.vVO2maxMaxTitle6} $short_meters")),
                    SizedBox(
                        child: Text("${intl.vVO2maxMaxTitle7} $short_second")),
                    SizedBox(child: Text(intl.vVO2maxMaxTitle8)),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  intl.vVO2maxMaxTitle9,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                            "${intl.vVO2maxMaxTitle10} $times ${intl.vVO2maxMaxTitle11} $mins ${intl.minutes1} $secs ${intl.vVO2maxMaxTitle12} ")),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                            "${intl.vVO2maxMaxTitle13}  $Approximately ${intl.vVO2maxMaxTitle14}")),
                  ],
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
