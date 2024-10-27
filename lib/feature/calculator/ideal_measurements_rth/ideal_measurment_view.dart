import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';

class IdealMeasurementsView extends StatefulWidget {
  const IdealMeasurementsView({super.key});

  @override
  State<IdealMeasurementsView> createState() => _IdealMeasurementsViewState();
}

class _IdealMeasurementsViewState extends State<IdealMeasurementsView> {
  TextEditingController waistController = TextEditingController(text: "0");
  TextEditingController hipController = TextEditingController(text: "0");
  TextEditingController sexController = TextEditingController();

  double result = 0;
  String stringResultat = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.imTitle1}"),
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
                  child: Text("${intl.imTitle2}",
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
                          controller: sexController,
                          title: "${intl.sex} :",
                          inputType: InputType.dropdown,
                          dropdownItems: [
                            "${intl.sexValue2}",
                            "${intl.sexValue3}"
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: CustomInput(
                          controller: waistController,
                          title: "${intl.waist}",
                          inputType: InputType.text,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: CustomInput(
                          controller: hipController,
                          title: "${intl.hip}",
                          inputType: InputType.text,
                        ),
                      ),
                      CustomButton(
                          text: "${intl.calculate}",
                          onPressed: () {
                            setState(() {
                              result = int.parse(waistController.text) /
                                  int.parse(hipController.text);
                              if (sexController.text == 1) {
                                if (result > 0.95) {
                                  stringResultat = "${intl.imParag1}";
                                } else {
                                  stringResultat =
                                      "This RTH is correct for a male because it is less than 0.95";
                                  if (result < 0.9) {
                                    stringResultat =
                                        "You have a «Gynoid» (low risk of cardiovascular disease). If you are still planning to lose weight, avoid exclusive (unhealthy) diets.";
                                  } else {
                                    stringResultat =
                                        " However, you have an «Androidide» and a «Gynoide» (moderate to severe high against cardiovascular disease). If you want to lose some fat, we advise you";
                                  }
                                }
                              } else {
                                if (result > 0.8) {
                                  stringResultat =
                                      "This RTH is too high for a woman, it should be less than 0.8. You have an «Android» (your excess fat is mainly in the belly area). Try to lose fat by avoiding starvation (unhealthy) diets";
                                } else {
                                  stringResultat =
                                      " This RTH is correct for a female because it is less than 0.8";
                                  if (result < 0.75) {
                                    stringResultat =
                                        " You have a «Gynoid» (low risk of cardiovascular disease). If you are still planning to lose weight, avoid exclusive (unhealthy) diets";
                                  } else {
                                    stringResultat =
                                        "However, you have an «Androidide» and a «Gynoide» (moderate to severe high against cardiovascular disease). If you want to lose some fat, we advise you";
                                  }
                                }
                              }
                            });

                            print(result);
                          })
                    ],
                  )),
                ),

                //////////
                ///Dimensions.verticalSpacingSmall,
                result == 0
                    ? Text(
                        "${intl.imTitle2}",
                        style: TextStyle(),
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          children: [
                            Text(
                              "Your RTH is:",
                            ),
                            Dimensions.verticalSpacingSmall,
                            Text(
                              "${result}\nOur interpretation and recommendation for your measurements",
                              textAlign: TextAlign.center,
                              style: TextStyle(backgroundColor: Colors.cyan),
                            ),
                            Dimensions.verticalSpacingSmall,
                            Text(
                              stringResultat,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                Dimensions.verticalSpacingSmall,

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imParag2}"),
                ),

                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imParag3}",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ),
                Dimensions.verticalSpacingMedium,

                Text("${intl.imTitle3}",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingSmall,

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imParag4}\n\n${intl.imParag5}"),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imParag6}",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imParag7}"),
                ),
                Dimensions.verticalSpacingMedium,

                Text("${intl.imTitle4}",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingSmall,
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  imageUrl:
                      "https://www.calculersonimc.fr/wp-content/uploads/2018/03/androide-gynoide.jpg",
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
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imParag8}"),
                ),
                Dimensions.verticalSpacingSmall,
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  imageUrl:
                      "https://www.calculersonimc.fr/wp-content/uploads/2018/03/premiS%CC%8Cre-image-mika-1.jpg",
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
                Text("${intl.imTitle5}",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imParag9}"),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imParag10}",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imTitle6}",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),

                Dimensions.verticalSpacingMedium,

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imParag11}\n\n${intl.imParag12}"),
                ),
                Dimensions.verticalSpacingMedium,
                Text("${intl.imTitle7}",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingMedium,

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imParag13}"),
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
