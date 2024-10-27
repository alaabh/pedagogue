import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';

class IdealWeigthCreffView extends StatefulWidget {
  const IdealWeigthCreffView({super.key});

  @override
  State<IdealWeigthCreffView> createState() => _IdealWeigthCreffViewState();
}

class _IdealWeigthCreffViewState extends State<IdealWeigthCreffView> {
  TextEditingController height = TextEditingController(text: "0");
  TextEditingController age = TextEditingController(text: "0");

  TextEditingController morphologieController = TextEditingController();

  double idealweightresult = 0;
  double poidsideal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.creffTitle1}"),
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
                  child: Text("${intl.creffTitle2}",
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
                          controller: morphologieController,
                          title: "${intl.morphologie} :",
                          inputType: InputType.dropdown,
                          dropdownItems: [
                            "${intl.morphologie1}",
                            "${intl.morphologie2}",
                            "${intl.morphologie3}",
                            
                          ],
                        ),
                      ),
                      CustomButton(
                          text: "${intl.calculate}",
                          onPressed: () {
                            setState(() {
                              poidsideal = (int.parse(height.text) -
                                      100 +
                                      int.parse(age.text) / 10) *
                                  0.9;

                              if (morphologieController.text ==
                                  "Gracile Morphologie (fine)") {
                                idealweightresult = poidsideal * 0.9;
                              } else if (morphologieController.text ==
                                  "Large Morphologie") {
                                idealweightresult = poidsideal * 1.1;
                              } else {
                                idealweightresult = poidsideal;
                              }
                            });
                          })
                    ],
                  )),
                ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.creffParag1}\n\n${intl.creffParag2}"),
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
                        child: Text("${intl.creffParag3}"),
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                "Your ideal weight (according to Creff's formula) is as follows :",
                              ),
                            ),
                            Dimensions.verticalSpacingSmall,
                            Text(
                              "${idealweightresult.toPrecision(2)}kg (kilogrammes)",
                              textAlign: TextAlign.center,
                              style: TextStyle(backgroundColor: Colors.cyan),
                            ),
                          ],
                        ),
                      ),
                Dimensions.verticalSpacingMedium,
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  imageUrl:
                      "https://www.calculersonimc.fr/wp-content/uploads/2018/04/poids-ide%CC%81al-atteint.jpg",
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
                  child: Text("${intl.creffParag4}\n${intl.creffParag5}"),
                ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.creffTitle3}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.creffParag6}"),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    "${intl.creffParag7}\n\n${intl.creffParag8}",
                  ),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.creffParag9}",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.idealweight} = (T−100+(A/10))∗0,9"),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.creffParag10}",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.idealweight} = (T−100+(A/10))∗0,9∗0,9"),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.creffParag11}",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.idealweight} = (T−100+(A/10))∗0,9∗1,1"),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.creffParag12}\n\n${intl.creffParag13}"),
                ),
                Dimensions.verticalSpacingSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
