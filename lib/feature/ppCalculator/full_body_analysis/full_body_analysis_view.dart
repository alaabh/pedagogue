import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pedagogue/shared/widget/custom_input.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/loading_widget.dart';
import '../../../utils/resources/api/token_manager.dart';
import 'more_informations.dart';

class FullBodyAnalysisView extends StatefulWidget {
  const FullBodyAnalysisView({super.key});

  @override
  State<FullBodyAnalysisView> createState() => _FullBodyAnalysisViewState();
}

class _FullBodyAnalysisViewState extends State<FullBodyAnalysisView> {
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
  TextEditingController unitsController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    unitsController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Step 4: Dispose the controller
    unitsController.removeListener(_printLatestValue);
    unitsController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    setState(() {
      unitState = unitsController.text;
    });
  }

  String unitState = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.fullBodyList}"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Text(
                  "${intl.fullBody1}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  imageUrl:
                      "https://app.sportspedagogue.com/_nuxt/img/analysis.4ac9ea5.jpg",
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
                  "${intl.fullBody2}",
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "${intl.fullBody3}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        //width: MediaQuery.of(context).size.width * 0.25,
                        child: Text("${intl.fullBody4}:")),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: CustomInput(
                          controller: unitsController,
                          inputType: InputType.dropdown,
                          dropdownItems: ["${intl.us}", "${intl.metric}"],
                        )),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(child: Text("${intl.fullBody5}:")),
                        //SizedBox(child: Text("$vma")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: CustomInput(
                              inputType: InputType.dropdown,
                              dropdownItems: ["${intl.male}", "${intl.female}"],
                            )),
                      ],
                    ),
                    Dimensions.verticalSpacingExtraLarge,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(child: Text("${intl.fullBody6}:")),
                        Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: CustomInput(
                                  inputType: InputType.text,
                                )),
                            SizedBox(child: Text(" ${intl.kg}")),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                unitState == "Metric"
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(child: Text("${intl.fullBody7}:")),
                          //SizedBox(child: Text("$vma")),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: CustomInput(
                                inputType: InputType.text,
                              )),
                          SizedBox(child: Text("cm")),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(child: Text("${intl.fullBody7}:")),
                          //SizedBox(child: Text("$vma")),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: CustomInput(
                                inputType: InputType.text,
                              )),
                          SizedBox(child: Text("${intl.feet}")),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: CustomInput(
                                inputType: InputType.text,
                              )),
                          SizedBox(child: Text("${intl.inches}")),
                        ],
                      ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(child: Text("${intl.fullBody8}:")),
                        //SizedBox(child: Text("$vma")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: CustomInput(
                              inputType: InputType.text,
                            )),
                      ],
                    ),
                    Dimensions.verticalSpacingExtraLarge,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text("${intl.fullBody9}:")),
                        //SizedBox(child: Text("$vma")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: CustomInput(
                              inputType: InputType.text,
                            )),
                      ],
                    ),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "${intl.fullBody10}:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(child: Text("${intl.fullBody11}:")),
                        //SizedBox(child: Text("$vma")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: CustomInput(
                              inputType: InputType.text,
                            )),
                      ],
                    ),
                    Dimensions.verticalSpacingExtraLarge,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(child: Text("${intl.fullBody12}:")),
                        //SizedBox(child: Text("$vma")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: CustomInput(
                              inputType: InputType.text,
                            )),
                      ],
                    ),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(child: Text("${intl.fullBody13}:")),
                    //SizedBox(child: Text("$vma")),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: CustomInput(
                          inputType: InputType.text,
                        )),
                  ],
                ),
                Dimensions.verticalSpacingExtraLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(child: Text("${intl.fullBody14}:")),
                        //SizedBox(child: Text("$vma")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: CustomInput(
                              inputType: InputType.dropdown,
                              dropdownItems: [
                                "${intl.fullBody29}",
                                "${intl.fullBody30}",
                                "${intl.fullBody31}",
                                "${intl.fullBody32}",
                                "${intl.fullBody33}",
                              ],
                            )),
                      ],
                    ),
                    Dimensions.verticalSpacingExtraLarge,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(child: Text("${intl.fullBody15}:")),
                        //SizedBox(child: Text("$vma")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: CustomInput(
                                inputType: InputType.dropdown,
                                dropdownItems: [
                                  "${intl.fullBody34}",
                                  "${intl.fullBody35}",
                                  "${intl.fullBody36}",
                                  "${intl.fullBody37}",
                                  "${intl.fullBody38}",
                                ])),
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
                        //  getResult(VOController.text, context);
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
                  color: Colors.white,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text("${intl.fullBody16}:")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("0")),
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
                            child: Text("${intl.fullBody17}:")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("0")),
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
                            child: Text("${intl.fullBody18}:")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("0")),
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
                            child: Text("${intl.fullBody19}:")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("0")),
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
                            child: Text("${intl.fullBody20}:")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("0")),
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
                            child: Text("${intl.fullBody21}:")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("0")),
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
                            child: Text("${intl.fullBody22}:")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("0")),
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
                            child: Text("${intl.fullBody23}:")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("0")),
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
                            child: Text("${intl.fullBody24}:")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("0")),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white70,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      children: [
                        SizedBox(child: Text("${intl.fullBody25}:")),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(child: Text("0 cal/day")),
                            SizedBox(child: Text("0 cal/hour")),
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
                      children: [
                        SizedBox(child: Text("${intl.fullBody26}:")),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(child: Text("0 cal/day")),
                            SizedBox(child: Text("0 cal/hour")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white70,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      children: [
                        SizedBox(child: Text("${intl.fullBody27}:")),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(child: Text("0 bpm")),
                            SizedBox(child: Text("0 b/10s")),
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
                      children: [
                        SizedBox(child: Text("${intl.fullBody28}:")),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(child: Text("0 bpm")),
                            SizedBox(child: Text("0 b/10s")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Dimensions.verticalSpacingExtraLarge,
                SizedBox(
                  child: FilledButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.amber.shade400)),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MoreInformations(),
                          ),
                        );
                      },
                      child: Text("${intl.moreInformaations}")),
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
