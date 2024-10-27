import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';

class IdealWeigthDevineView extends StatefulWidget {
  const IdealWeigthDevineView({super.key});

  @override
  State<IdealWeigthDevineView> createState() => _IdealWeigthDevineViewState();
}

class _IdealWeigthDevineViewState extends State<IdealWeigthDevineView> {
  TextEditingController height = TextEditingController(text: "0");

  TextEditingController sexe = TextEditingController();

  double idealweightresult = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.devinTitle1}"),
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
                  child: Text("${intl.devinTitle2}",
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
                              var taillesupplementaire = 0.0;
                              var tailleeninches =
                                  0.3937008 * int.parse(height.text);
                              if (tailleeninches > 60) {
                                taillesupplementaire = tailleeninches - 60;
                              } else {
                                taillesupplementaire = 0;
                              }

                              if (sexe.text == intl.sexValue3) {
                                idealweightresult =
                                    50 + 2.3 * taillesupplementaire;
                              } else {
                                idealweightresult =
                                    45.5 + 2.3 * taillesupplementaire;
                              }
                            });
                          })
                    ],
                  )),
                ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.devinParag1}\n\n${intl.devinParag2}"),
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
                        child: Text("${intl.devinParag3}"),
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                "Your ideal weight (according to Devine's formula) is as follows :",
                              ),
                            ),
                            Dimensions.verticalSpacingSmall,
                            Text(
                              "${idealweightresult.toPrecision(2)}kg (kilogrammes)",
                              textAlign: TextAlign.center,
                              style: TextStyle(backgroundColor: Colors.cyan),
                            ),
                            Dimensions.verticalSpacingSmall,
                            Text(
                              "${intl.devinParag4}\n${intl.devinParag5}\n${intl.devinParag6}",
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
                      "https://www.calculersonimc.fr/wp-content/uploads/2018/04/perte-de-poids-poids-ide%CC%81al-.jpg",
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
                  child: Text("${intl.devinTitle3}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.devinParag6}\n\n${intl.devinParag7}"),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    "${intl.formuleDevin}",
                  ),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.devinParag8}\n\n${intl.devinParag9}"),
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
