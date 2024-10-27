import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/shared/widget/custom_button.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';

import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/loading_widget.dart';

class ImcCalculator extends StatefulWidget {
  const ImcCalculator({super.key});

  @override
  State<ImcCalculator> createState() => _ImcCalculatorState();
}

String paragraph = "";
String imcTitle = "";
Color imcColor = Colors.white;
bool visible = false;

class _ImcCalculatorState extends State<ImcCalculator> {
  TextEditingController height = TextEditingController(text: "0");
  TextEditingController weight = TextEditingController(text: "0");
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.iMCcalculation),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Dimensions.verticalSpacingSmall,
                Text(intl.pERFORMYOURIMCCALCULATION,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
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
                          controller: weight,
                          title: "${intl.weigth} :",
                          inputType: InputType.text,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: CustomInput(
                          controller: height,
                          title: "${intl.height} :",
                          inputType: InputType.text,
                        ),
                      ),
                      CustomButton(
                          text: "${intl.calculate} ${intl.imc}",
                          onPressed: () {
                            setState(() {
                              var x = int.parse(height.text) / 100;
                              result = int.parse(weight.text) / (x * x);
                              switch (result) {
                                case < 16:
                                  imcColor = Colors.cyanAccent;
                                  imcTitle = "Undernutrition";
                                  paragraph =
                                      "Watch your build, this IMC is low; try to stay above 18.5 because otherwise your health is at risk. Your body does not have the energy supply it needs to function well, which can cause serious health problems The most notable are :an overall weakening of the body, leading to immune weakness and greater susceptibility to infections of any kind.sarcopenia (decrease in muscle mass), which can cause falls.a deficiency in vitamins and minerals, leading to associated disorders, ranging from bone fragility to generalized fatigue, from the absence of menstruation in women to cognitive disorders.a general deterioration in quality of life.To gain weightdiscover our tips and tricks for gaining weight.We advise you to make an appointment with a nutritionist, dietitian or psychologist so that he can help you gain weight .";
                                case < 18.5:
                                  imcColor = Color.fromARGB(255, 24, 143, 255);
                                  imcTitle = "Skinny";
                                  paragraph =
                                      "Watch your build, this IMC is low; try to stay above 18.5 because otherwise your health is at risk. Your body does not have the energy supply it needs to function well, which can cause serious health problems The most notable are :an overall weakening of the body, leading to immune weakness and greater susceptibility to infections of any kind.sarcopenia (decrease in muscle mass), which can cause falls.a deficiency in vitamins and minerals, leading to associated disorders, ranging from bone fragility to generalized fatigue, from the absence of menstruation in women to cognitive disorders.a general deterioration in quality of life.To gain weightdiscover our tips and tricks for gaining weight.We advise you to make an appointment with a nutritionist, dietitian or psychologist so that he can help you gain weight .";
                                case < 25:
                                  imcColor = Colors.green;
                                  imcTitle = "Normal Body";
                                  paragraph =
                                      "Your build is in the norm, that's great! If you're here, it's probably because you follow your build closely, and you're right. Try to keep a IMC above 18.5. To do this, be sure to adopt a healthy and balanced diet, providing all the nutrients necessary for the proper functioning of your body. It must be based on current nutritional recommendations: 50-55% low GI complex carbohydrates, 30 -35% of quality lipids, 10-15% of lean proteins (animal or vegetable). It must be supplemented by regular physical activity, which contributes to the maintenance of a healthy weight. To gain weigh";
                                case < 30:
                                  imcColor = Colors.orange;
                                  imcTitle = "Overweight";
                                  paragraph =
                                      "Your IMC is between 26 and 27. This means that you are overweight. At this stage, your extra pounds are already having an impact; your health. This is why we strongly advise you to lose weight. In order to disturb the body as little as possible, it is recommended to opt for a rebalancing of food rather than a draconian diet.";
                                case < 35:
                                  imcColor = Colors.red.shade500;
                                  imcTitle = "Moderate obesity (Class 1)";
                                  paragraph =
                                      "Your IMC is between 32 and 35. This means that you suffer from moderate class 1 obesity. At this stage, your extra pounds represent a risk to your health. This is why we strongly advise you to lose weight to regain an “overweight” IMC first and then “normal” IMC later. Returning to a healthy weight will not happen in a few days It seems imperative to favora slimming program that respects your body and your eating rhythm.";
                                case < 40:
                                  imcColor = Colors.red.shade700;
                                  imcTitle = "Severe obesity (Class 2)";
                                  paragraph =
                                      "Your IMC is over 35, This is the stage of severe obesity (Class 2). You should try to lose weight by avoiding restrictive (unhealthy) diets. Have you ever thought about consult your doctor to help you in your decisions? We recommend that you make an appointment with a nutritionist very quickly so that he can help you get out of obesity.";
                                case > 40:
                                  imcColor = Colors.red.shade900;
                                  imcTitle =
                                      "Morbid or massive obesity (Class 3)";
                                  paragraph =
                                      "Your IMC is over 40, This is the stage of morbid obesity (Class 3). You should try to lose weight by avoiding restricted (unhealthy) diets. Have you ever thought about consult your doctor to help you in your decisions? We recommend that you make an appointment with a nutritionist very quickly so that he can help you get out of obesity.";
                              }
                              visible = true;
                            });
                            print(result);
                          })
                    ],
                  )),
                ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(intl.imcpar1),
                ),
                Dimensions.verticalSpacingSmall,
                Column(
                  children: [
                    Dimensions.verticalSpacingSmall,
                    Text(
                      intl.yOURRESULTS,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: RichText(
                              text: TextSpan(
                                  text: intl.imcpar2,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  children: [
                                TextSpan(
                                  text: "${result.toPrecision(2)}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      backgroundColor: Colors.amber),
                                ),
                                TextSpan(
                                  text: ':',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ])),
                        ),
                      ],
                    ),
                    Dimensions.verticalSpacingSmall,
                    Visibility(
                      visible: visible,
                      child: Text(
                        "$imcTitle\nOur recommendation for your build",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 15, backgroundColor: imcColor),
                      ),
                    )
                  ],
                ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: SizedBox(child: Text(paragraph)),
                ),
                Dimensions.verticalSpacingSmall,
                Text(intl.imctitle1,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Table(
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      TableRow(children: [
                        TableCell(
                          child: Text('${intl.imcTableCol1}',
                              textAlign: TextAlign.center),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Text('${intl.imcTableRow1}',
                              textAlign: TextAlign.center),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                            child: Text(
                          '${intl.imcTableCol2}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.cyanAccent),
                        )),
                        TableCell(
                            child: Text(
                          '${intl.imcTableRow2}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.cyanAccent),
                        )),
                      ]),
                      TableRow(children: [
                        TableCell(
                            child: Text('${intl.imcTableCol3}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 24, 143, 255)))),
                        TableCell(
                            child: Text('${intl.imcTableRow3}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 24, 143, 255)))),
                      ]),
                      TableRow(children: [
                        TableCell(
                            child: Text('${intl.imcTableCol4}',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.green))),
                        TableCell(
                            child: Text('${intl.imcTableRow4}',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.green))),
                      ]),
                      TableRow(children: [
                        TableCell(
                            child: Text('${intl.imcTableCol5}',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.orange))),
                        TableCell(
                            child: Text('${intl.imcTableRow5}',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.orange))),
                      ]),
                      TableRow(children: [
                        TableCell(
                            child: Text('${intl.imcTableCol6}',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.red.shade500))),
                        TableCell(
                            child: Text('${intl.imcTableRow6}',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.red.shade500))),
                      ]),
                      TableRow(children: [
                        TableCell(
                            child: Text('${intl.imcTableCol7}',
                                style: TextStyle(color: Colors.red.shade700),
                                textAlign: TextAlign.center)),
                        TableCell(
                            child: Text('${intl.imcTableRow7}',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.red.shade700))),
                      ]),
                      TableRow(children: [
                        TableCell(
                            child: Text('${intl.imcTableCol8}',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.red.shade900))),
                        TableCell(
                            child: Text('${intl.imcTableRow8}',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.red.shade900))),
                      ]),
                    ],
                  ),
                ),
                Dimensions.verticalSpacingSmall,
                Text(intl.imctitle2,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(intl.imcpar3),
                ),
                Dimensions.verticalSpacingSmall,
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  imageUrl:
                      "https://www.calculersonimc.fr/wp-content/uploads/2018/04/balance-poids-imc.jpg",
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
                Text(intl.imctitle3,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(intl.imcpar4)),
                Dimensions.verticalSpacingSmall,
                Text(intl.imctitle4,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(intl.imcpar5)),
                Dimensions.verticalSpacingSmall,
                Text(intl.imctitle5,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingSmall,
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  imageUrl:
                      "https://www.calculersonimc.fr/wp-content/uploads/2018/04/poids-imc.jpg",
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
                  child: Text(intl.imcpar6),
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
