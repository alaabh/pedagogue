import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';
import '../../../utils/resources/api/token_manager.dart';

class WaterLoss extends StatefulWidget {
  const WaterLoss({super.key});

  @override
  State<WaterLoss> createState() => _WaterLossState();
}

class _WaterLossState extends State<WaterLoss> {
  Future<void> getResult(
      dynamic weightb, dynamic weighta, BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url =
        Uri.parse('https://www.mobile.sportspedagogue.com/api/water_loss');
    final response = await http.post(url, headers: headers, body: {
      "weightb": weightb,
      "weighta": weighta,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        losswt = data['losswt'].toString();
        lossh2o = data['lossh2o'].toString();
        losspct = data['losspct'].toString();
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

  TextEditingController weightbController = TextEditingController();
  TextEditingController weightaController = TextEditingController();
  String losswt = "0";
  String lossh2o = "0";
  String losspct = "0";
  String rate70 = "0";
  String rate60 = "0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.waterLossList}"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Text(
                  "${intl.waterLoss1}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  imageUrl:
                      "https://app.sportspedagogue.com/_nuxt/img/loss.1ad22ff.jpg",
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
                  "${intl.waterLoss2}",
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "${intl.waterLoss3}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Column(
                  children: [
                    SizedBox(child: Text("${intl.waterLoss4}:")),
                    Dimensions.verticalSpacingExtraLarge,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: CustomInput(
                              controller: weightbController,
                              inputType: InputType.text,
                            )),
                        SizedBox(child: Text("${intl.pounds}")),
                      ],
                    ),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Column(
                  children: [
                    SizedBox(child: Text("${intl.waterLoss5}:")),
                    Dimensions.verticalSpacingExtraLarge,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: CustomInput(
                              controller: weightaController,
                              inputType: InputType.text,
                            )),
                        SizedBox(child: Text("${intl.pounds}")),
                      ],
                    ),
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
                        getResult(weightbController.text,
                            weightaController.text, context);
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
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text("${intl.waterLoss6}")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text("$losswt")),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text("${intl.waterLoss7}")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text("$lossh2o")),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white70,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text("${intl.waterLoss8}")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text("$losspct")),
                      ],
                    ),
                  ),
                ),
                Dimensions.verticalSpacingExtraLarge,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text("${intl.waterLoss9}")),
                    ],
                  ),
                ),
                Dimensions.verticalSpacingExtraLarge,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text("${intl.waterLoss10}")),
                    ],
                  ),
                ),
                Dimensions.verticalSpacingExtraLarge,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text("${intl.waterLoss11}")),
                    ],
                  ),
                ),
                Dimensions.verticalSpacingExtraLarge,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text("${intl.waterLoss12}")),
                    ],
                  ),
                ),
                Dimensions.verticalSpacingExtraLarge,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text("${intl.waterLoss13}")),
                    ],
                  ),
                ),
                Dimensions.verticalSpacingExtraLarge,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text("${intl.waterLoss14}")),
                    ],
                  ),
                ),
                Dimensions.verticalSpacingExtraLarge,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text("${intl.waterLoss15}")),
                    ],
                  ),
                ),
                Dimensions.verticalSpacingExtraLarge,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text("${intl.waterLoss16}")),
                    ],
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
