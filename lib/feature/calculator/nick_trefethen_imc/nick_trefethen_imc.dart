import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';

class NickTrefethenImcView extends StatefulWidget {
  const NickTrefethenImcView({super.key});

  @override
  State<NickTrefethenImcView> createState() => _NickTrefethenImcViewState();
}

class _NickTrefethenImcViewState extends State<NickTrefethenImcView> {
  TextEditingController height = TextEditingController(text: "0");
  TextEditingController weight = TextEditingController(text: "0");

  double idealweightresult = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.nickTitle1}"),
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
                  child: Text("${intl.nickTitle2}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.4,
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
                          controller: weight,
                          title: "${intl.weigth} :",
                          inputType: InputType.text,
                        ),
                      ),
                      CustomButton(
                          text: "${intl.calculate}",
                          onPressed: () {
                            setState(() {
                              idealweightresult = (1.3 *
                                      int.parse(weight.text)) /
                                  (pow((int.parse(height.text) / 100), 2.5));
                            });
                          })
                    ],
                  )),
                ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.nickParag1}\n\n${intl.nickParag2}"),
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
                            "${intl.nickParag3}\n\n${intl.nickParag4}\n\n${intl.nickParag5}"),
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                "According to WHO classification, interpretation of your IMC (${idealweightresult.toPrecision(2)} kg/m²) is :",
                              ),
                            ),
                            Dimensions.verticalSpacingSmall,
                            Text(
                              "Normal Body\nOur recommendation for your build",
                              textAlign: TextAlign.center,
                              style: TextStyle(backgroundColor: Colors.cyan),
                            ),
                            Dimensions.verticalSpacingSmall,
                            Text(
                              "Watch your build, this IMC (according to Nick Trefethen) seems low, try to stay above 18.5.",
                              textAlign: TextAlign.center,
                            ),
                            Dimensions.verticalSpacingSmall,
                            Text(
                              "We also offer other <<theoretical ideal weight>> calculations.(which will allow you to use other formulas)",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.nickTitle3}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                Dimensions.verticalSpacingSmall,
                Text(
                  "${intl.nickParag6}\n\n${intl.nickParag7}",
                  textAlign: TextAlign.center,
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    "1.3 ∗ ${intl.weigth} (${intl.kg}) / (${intl.height} (${intl.m}) 2.5) 1.${intl.weigth} (${intl.kg}) / (${intl.height} (${intl.m}) 2.5)",
                  ),
                ),
                Dimensions.verticalSpacingMedium,
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  imageUrl:
                      "https://www.calculersonimc.fr/wp-content/uploads/2018/04/femme-balance-dans-les-mains.jpg",
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
                  child: Text(
                    "${intl.nickParag8}",
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
