import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pedagogue/shared/style/app_color.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';
import '../../../utils/resources/api/token_manager.dart';

class TargetHeartRate extends StatefulWidget {
  const TargetHeartRate({super.key});

  @override
  State<TargetHeartRate> createState() => _TargetHeartRateState();
}

class _TargetHeartRateState extends State<TargetHeartRate> {
  Future<void> getResult(dynamic age, BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url = Uri.parse(
        'https://www.mobile.sportspedagogue.com/api/target_heart_rate');
    final response = await http.post(url, headers: headers, body: {"age": age});
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        maxRate = data['maxRate'].toString();
        rate90 = data['rate90'].toString();
        rate80 = data['rate80'].toString();
        rate70 = data['rate70'].toString();
        rate60 = data['rate60'].toString();
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
  String maxRate = "0";
  String rate90 = "0";
  String rate80 = "0";
  String rate70 = "0";
  String rate60 = "0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.targetHeartRateList}"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Text(
                  "${intl.targetHeartRateTitle1}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  imageUrl:
                      "https://app.sportspedagogue.com/_nuxt/img/target.c1da828.jpg",
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
                  "${intl.targetHeartRateTitle2}",
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "${intl.targetHeartRateTitle3}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(child: Text("${intl.age} :")),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: CustomInput(
                          controller: ageController,
                          inputType: InputType.text,
                        )),
                    SizedBox(child: Text("${intl.targetHeartRateTitle4}")),
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
                  color: AppColors.primaryColor,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text("${intl.targetHeartRateTitle44}")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text("${intl.targetHeartRateTitle5}")),
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
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text("${intl.targetHeartRateTitle6}")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("$maxRate")),
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
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text("${intl.targetHeartRateTitle7}")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("$rate90")),
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
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text("${intl.targetHeartRateTitle8}")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("$rate80")),
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
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text("${intl.targetHeartRateTitle9}")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("$rate70")),
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
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text("${intl.targetHeartRateTitle10}")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("$rate60")),
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
