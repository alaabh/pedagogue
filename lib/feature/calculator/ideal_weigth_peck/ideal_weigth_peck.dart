import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';

class IdealWeigthPeckView extends StatefulWidget {
  const IdealWeigthPeckView({super.key});

  @override
  State<IdealWeigthPeckView> createState() => _IdealWeigthPeckViewState();
}

class _IdealWeigthPeckViewState extends State<IdealWeigthPeckView> {
  TextEditingController height = TextEditingController(text: "0");
  TextEditingController age = TextEditingController(text: "0");

  TextEditingController sexe = TextEditingController();

  double idealweightresult = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.peckTitle1}"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.peckTitle2}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Card(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: CustomInput(
                          controller: height,
                          title: "${intl.height} :",
                          inputType: InputType.text,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: CustomInput(
                          controller: age,
                          title: "${intl.age} :",
                          inputType: InputType.text,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: CustomInput(
                          controller: sexe,
                          title: "${intl.sex} :",
                          inputType: InputType.dropdown,
                          dropdownItems: [
                            "${intl.sexValue2}",
                            "${intl.sexValue3}",
                          ],
                        ),
                      ),
                      CustomButton(
                          text: "${intl.calculate}",
                          onPressed: () {
                            setState(() {
                              var tailleeninches =
                                  0.3937008 * int.parse(height.text);
                              var poidsideal = 0.0;

                              if (int.parse(age.text) > 18) {
                                if (sexe.text == intl.sexValue3) {
                                  poidsideal =
                                      -130.736 + (4.064 * tailleeninches);
                                } else {
                                  poidsideal =
                                      -111.621 + (3.636 * tailleeninches);
                                }
                              } else {
                                if (sexe.text == intl.sexValue3) {
                                  poidsideal = -59.6035 +
                                      (5.2878 * tailleeninches) -
                                      (0.123939 * pow(tailleeninches, 2)) +
                                      (0.00128936 * pow(tailleeninches, 3));
                                } else {
                                  poidsideal = -77.55796 +
                                      (6.93728 * tailleeninches) -
                                      (0.171703 * pow(tailleeninches, 2)) +
                                      (0.001726 * pow(tailleeninches, 3));
                                }
                              }

                              idealweightresult = poidsideal * 0.45359237;
                            });
                          })
                    ],
                  )),
                ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.peckParag1}"),
                ),
                Dimensions.verticalSpacingSmall,
                Text(
                  "${intl.yOURRESULTS}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingSmall,
                idealweightresult == 0
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                            "${intl.peckParag2}\n${intl.peckParag3}\n${intl.peckParag4}"),
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                "Your ideal weight (according to Peck's formula) is as follows :",
                              ),
                            ),
                            Dimensions.verticalSpacingSmall,
                            Text(
                              "${idealweightresult.toPrecision(2)}kg (kilogrammes)\nYou want to reach your ideal weight ?",
                              textAlign: TextAlign.center,
                              style: TextStyle(backgroundColor: Colors.cyan),
                            ),
                            Dimensions.verticalSpacingSmall,
                            Text(
                              "We also offer other <<theoretical ideal weight>> calculations(which will allow you to use other formulas)",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.peckTitle3}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                Dimensions.verticalSpacingMedium,
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  imageUrl:
                      "https://www.calculersonimc.fr/wp-content/uploads/2018/02/me%CC%81decin-mesurant-tour-du-ventre.jpg",
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
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.peckParag5}\n\n${intl.peckParag6}"),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    "${intl.idealweight} (${intl.male}) = -130.736 + (4.064 x T)\n${intl.idealweight} (${intl.female}) = -111.621 + (3.636 x T)",
                  ),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.peckParag7}"),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    "${intl.idealweight} (${intl.male}) = -59.6035 + (5.2878 x T) – (0.123939 * T2) + (0.00128936 * T3)\n${intl.idealweight} (${intl.female}) = -77.55796 + (6.93728 x T) – (0.171703 * T2)+ (0.001726 * T3)",
                  ),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    "${intl.peckParag8}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Dimensions.verticalSpacingMedium,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
