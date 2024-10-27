import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../utils/resources/api/token_manager.dart';

class Vma extends StatefulWidget {
  const Vma({super.key});

  @override
  State<Vma> createState() => _VmaState();
}

class _VmaState extends State<Vma> {
  Future<void> getResult(dynamic VO, BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url =
        Uri.parse('https://www.mobile.sportspedagogue.com/api/vmakmcalculate');
    final response = await http.post(url, headers: headers, body: {"VO": VO});
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        vma = data['vma'].toString();
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

  TextEditingController VOController = TextEditingController();
  String vma = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.vmaTitle1),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Text(intl.vmaTitle1),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Text("${intl.vO2Max} :")),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: CustomInput(
                            controller: VOController,
                            inputType: InputType.text)),
                    Dimensions.horizontalSpacingLarge,
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Text("${intl.ml}/${intl.kg}/${intl.min}")),
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
                        getResult(VOController.text, context);
                      },
                      child: Text("${intl.calcul}")),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(child: Text("${intl.vMA} :")),
                    SizedBox(child: Text("$vma")),
                    SizedBox(child: Text("${intl.km}/${intl.hours1}")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
