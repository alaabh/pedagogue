import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';
import '../../../utils/resources/api/token_manager.dart';

class HumanWaterRequirement extends StatefulWidget {
  const HumanWaterRequirement({super.key});

  @override
  State<HumanWaterRequirement> createState() => _HumanWaterRequirementState();
}

class _HumanWaterRequirementState extends State<HumanWaterRequirement> {
  Future<void> getResult(
      dynamic kg, dynamic min, dynamic env, BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    String env1 = "1";
    switch (env) {
      case 'Extreme Heat - Arid Or Desert Conditions':
        env1 = "1";
        break;
      case 'Normally Warm Environment':
        env1 = ".85";
        break;
      case 'Normally Cool Environment':
        env1 = ".68";
        break;
      case 'Extreme Cold - At, Near or Below Freezing':
        env1 = ".88";
        break;
    }
    final url = Uri.parse(
        'https://www.mobile.sportspedagogue.com/api/human_water_requirement');
    final response = await http.post(url, headers: headers, body: {
      "kg": kg,
      "min": min,
      "env": env1,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        ml = data['ml'].toString();
        oz = data['oz'].toString();
        ozi = data['ozi'].toString();
        gl = data['gl'].toString();
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

  TextEditingController kgController = TextEditingController();
  TextEditingController minController = TextEditingController();
  TextEditingController envController = TextEditingController();
  String ml = "0";
  String oz = "0";
  String ozi = "0";
  String gl = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.humanWaterRequirementList}"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Text(
                  "${intl.humanWaterRequirement1}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  imageUrl:
                      "https://app.sportspedagogue.com/_nuxt/img/human_water.b291ea0.jpg",
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
                  "${intl.humanWaterRequirement2}",
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "${intl.humanWaterRequirement3}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Column(
                  children: [
                    SizedBox(child: Text("${intl.humanWaterRequirement4}:")),
                    Dimensions.verticalSpacingExtraLarge,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: CustomInput(
                              controller: kgController,
                              inputType: InputType.text,
                            )),
                        SizedBox(child: Text("${intl.kilogram}")),
                      ],
                    ),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Column(
                  children: [
                    SizedBox(child: Text("${intl.humanWaterRequirement5}:")),
                    Dimensions.verticalSpacingExtraLarge,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: CustomInput(
                              controller: minController,
                              inputType: InputType.dropdown,
                              dropdownItems: [
                                "0",
                                "20",
                                "40",
                                "60",
                              ],
                            )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text("${intl.humanWaterRequirement6}")),
                      ],
                    ),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Column(
                  children: [
                    SizedBox(child: Text("${intl.humanWaterRequirement7}:")),
                    Dimensions.verticalSpacingExtraLarge,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: CustomInput(
                              controller: envController,
                              inputType: InputType.dropdown,
                              dropdownItems: [
                                "${intl.humanWaterRequirement22}",
                                "${intl.humanWaterRequirement23}",
                                "${intl.humanWaterRequirement24}",
                                "${intl.humanWaterRequirement25}",
                              ],
                            )),
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
                        getResult(kgController.text, minController.text,
                            envController.text, context);
                      },
                      child: Text("${intl.calcul}")),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "${intl.humanWaterRequirement8}",
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
                            child: Text("${intl.humanWaterRequirement9}:")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("$ml")),
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
                            child: Text("${intl.humanWaterRequirement10}:")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("$oz")),
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
                            child: Text("${intl.humanWaterRequirement11}:")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("$ozi")),
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
                            child: Text("${intl.humanWaterRequirement12}:")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("$gl")),
                      ],
                    ),
                  ),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "${intl.humanWaterRequirement13}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text("1.${intl.humanWaterRequirement14}")),
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
                          child: Text("2.${intl.humanWaterRequirement15}")),
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
                          child: Text("3.${intl.humanWaterRequirement16}")),
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
                          child: Text("4.${intl.humanWaterRequirement17}")),
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
                          child: Text("5.${intl.humanWaterRequirement18}")),
                    ],
                  ),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Dimensions.verticalSpacingExtraLarge,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text("${intl.humanWaterRequirement19}")),
                    ],
                  ),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Dimensions.verticalSpacingExtraLarge,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text("${intl.humanWaterRequirement20}")),
                    ],
                  ),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Dimensions.verticalSpacingExtraLarge,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text("${intl.humanWaterRequirement21}")),
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
