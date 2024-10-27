import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';
import '../../../utils/resources/api/token_manager.dart';

class AverageRestingHeartRate extends StatefulWidget {
  const AverageRestingHeartRate({super.key});

  @override
  State<AverageRestingHeartRate> createState() =>
      _AverageRestingHeartRateState();
}

class _AverageRestingHeartRateState extends State<AverageRestingHeartRate> {
  Future<void> getResult(
      dynamic Day1,
      dynamic Day1Min,
      dynamic Day2,
      dynamic Day2Min,
      dynamic Day3,
      dynamic Day3Min,
      dynamic Day4,
      dynamic Day4Min,
      dynamic Day5,
      dynamic Day5Min,
      BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url = Uri.parse(
        'https://www.mobile.sportspedagogue.com/api/average_resting_heart_rate');
    final response = await http.post(url, headers: headers, body: {
      "Day1": Day1,
      "Day1Min": Day1Min,
      "Day2": Day2,
      "Day2Min": Day2Min,
      "Day3": Day3,
      "Day3Min": Day3Min,
      "Day4": Day4,
      "Day4Min": Day4Min,
      "Day5": Day5,
      "Day5Min": Day5Min,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        Average10sec = data['Average 10 sec RHR'].toString();
        Average1min = data['Average 1 min RHR'].toString();
        Interpretation = data['Interpretation'].toString();
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

  TextEditingController Day1Controller = TextEditingController();
  TextEditingController Day1MinController = TextEditingController();
  TextEditingController Day2Controller = TextEditingController();
  TextEditingController Day2MinController = TextEditingController();
  TextEditingController Day3Controller = TextEditingController();
  TextEditingController Day3MinController = TextEditingController();
  TextEditingController Day4Controller = TextEditingController();
  TextEditingController Day4MinController = TextEditingController();
  TextEditingController Day5Controller = TextEditingController();
  TextEditingController Day5MinController = TextEditingController();
  String Average10sec = "0";
  String Average1min = "0";
  String Interpretation = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.averageRestingHeartRateList}"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Text(
                  "${intl.averageRestingHeartRateTitle1}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  imageUrl:
                      "https://app.sportspedagogue.com/_nuxt/img/average.496229b.jpg",
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
                  "${intl.averageRestingHeartRateTitle2}",
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "${intl.averageRestingHeartRateTitle3}",
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
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Center(child: Text("${intl.rhr}"))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Center(child: Text("10 ${intl.seconds1}"))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Center(child: Text("1 ${intl.minutes1}"))),
                      ],
                    ),
                  ),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Center(
                            child: Text(
                                "${intl.averageRestingHeartRateTitle5} 1:"))),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: CustomInput(
                          controller: Day1Controller,
                          inputType: InputType.text,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: CustomInput(
                          controller: Day1MinController,
                          inputType: InputType.text,
                        )),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Center(
                            child: Text(
                                "${intl.averageRestingHeartRateTitle5} 2:"))),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: CustomInput(
                          controller: Day2Controller,
                          inputType: InputType.text,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: CustomInput(
                          controller: Day2MinController,
                          inputType: InputType.text,
                        )),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Center(
                            child: Text(
                                "${intl.averageRestingHeartRateTitle5} 3:"))),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: CustomInput(
                          controller: Day3Controller,
                          inputType: InputType.text,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: CustomInput(
                          controller: Day3MinController,
                          inputType: InputType.text,
                        )),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Center(
                            child: Text(
                                "${intl.averageRestingHeartRateTitle5} 4:"))),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: CustomInput(
                          controller: Day4Controller,
                          inputType: InputType.text,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: CustomInput(
                          controller: Day4MinController,
                          inputType: InputType.text,
                        )),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Center(
                            child: Text(
                                "${intl.averageRestingHeartRateTitle5} 5:"))),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: CustomInput(
                          controller: Day5Controller,
                          inputType: InputType.text,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: CustomInput(
                          controller: Day5MinController,
                          inputType: InputType.text,
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
                        getResult(
                            Day1Controller.text,
                            Day1MinController.text,
                            Day2Controller.text,
                            Day2MinController.text,
                            Day3Controller.text,
                            Day3MinController.text,
                            Day4Controller.text,
                            Day4MinController.text,
                            Day5Controller.text,
                            Day5MinController.text,
                            context);
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
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text("${intl.average10secRHR}:")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("$Average10sec")),
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
                            child: Text("${intl.average1minRHR} :")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("$Average1min")),
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
                            child: Text("${intl.interpritation} :")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("$Interpretation")),
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
