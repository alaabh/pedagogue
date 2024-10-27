import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';

class BasalMetabolismView extends StatefulWidget {
  const BasalMetabolismView({super.key});

  @override
  State<BasalMetabolismView> createState() => _BasalMetabolismViewState();
}

class _BasalMetabolismViewState extends State<BasalMetabolismView> {
  TextEditingController height = TextEditingController(text: "0");
  TextEditingController weight = TextEditingController(text: "0");
  TextEditingController sexController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  double imcresult = 0;
  double mBresult = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.mbTitle1}"),
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
                  child: Text("${intl.mbTitle2}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.6,
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: CustomInput(
                          controller: ageController,
                          title: "${intl.age} :",
                          inputType: InputType.text,
                        ),
                      ),
                      CustomButton(
                          text: "${intl.calculate}",
                          onPressed: () {
                            setState(() {
                              var x = int.parse(height.text) / 100;
                              var sexe =
                                  sexController.text == intl.sexValue3 ? 1 : 0;
                              imcresult = int.parse(weight.text) / (x * x);
                              if (int.parse(ageController.text) <= 60 &&
                                  int.parse(weight.text) < 25) {
                                if (sexe == 0) {
                                  mBresult = 9.74 * int.parse(weight.text) +
                                      172.9 * (int.parse(height.text) / 100) -
                                      4.737 * int.parse(ageController.text) +
                                      667.051;
                                } else {
                                  mBresult = 13.707 * int.parse(weight.text) +
                                      492.3 * (int.parse(height.text) / 100) -
                                      6.673 * int.parse(ageController.text) +
                                      77.607;
                                }
                              } else {
                                if (sexe == 0) {
                                  mBresult = 230.0 *
                                      pow(double.parse(weight.text), 0.48) *
                                      pow(double.parse(height.text) / 100,
                                          0.5) *
                                      pow(double.parse(ageController.text),
                                          -0.13);
                                } else {
                                  mBresult = 259.0 *
                                      pow(double.parse(weight.text), 0.48) *
                                      pow(double.parse(height.text) / 100,
                                          0.5) *
                                      pow(double.parse(ageController.text),
                                          -0.13);
                                }
                              }
                            });
                            print(mBresult);
                          })
                    ],
                  )),
                ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.mbParag1}"),
                ),
                Dimensions.verticalSpacingSmall,
                Text(
                  "${intl.yOURRESULTS}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                /*  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Your IMG (Fat Mass Index) is',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "${imgresult.toPrecision(2)}%",
                                  style: TextStyle(
                                      fontSize: 15,
                                      backgroundColor: Colors.amber),
                                ),
                                TextSpan(
                                  text: '\nm489',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                TextSpan(
                                  text: "Not enough fat",
                                  style: TextStyle(
                                      fontSize: 15,
                                      backgroundColor: Colors.amber),
                                ),
                              ])),
                    ),
                  ],
                ), */

                Dimensions.verticalSpacingSmall,
                Text("${intl.mbTitle4}",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.mbParag5}\n\n${intl.mbParag6}"),
                ),
                Dimensions.verticalSpacingMedium,
                Container(
                  color: AppColors.primaryColor,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Table(
                    border: TableBorder.symmetric(
                        inside: BorderSide(color: Colors.black)),
                    children: [
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              color: AppColors.primaryColor,
                              child: Text('${intl.mbTableKey1}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white))),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text('${intl.mbTableKey2}',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white)),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text(
                              '${intl.mbTableKey3}',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              child: Text('${intl.mbTableKey1Value1}',
                                  textAlign: TextAlign.center)),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text('${intl.mbTableKey2Value1}',
                                textAlign: TextAlign.center),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text('${intl.mb} \nx 1,2',
                                textAlign: TextAlign.center),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              child: Text('${intl.mbTableKey1Value2}',
                                  textAlign: TextAlign.center)),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text('${intl.mbTableKey2Value2}',
                                textAlign: TextAlign.center),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text('${intl.mb}\n x 1,375',
                                textAlign: TextAlign.center),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              child: Text('${intl.mbTableKey1Value3}',
                                  textAlign: TextAlign.center)),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text('${intl.mbTableKey2Value3}',
                                textAlign: TextAlign.center),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text('${intl.mb} \nx 1,55',
                                textAlign: TextAlign.center),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              child: Text('${intl.mbTableKey1Value4}',
                                  textAlign: TextAlign.center)),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text('${intl.mbTableKey2Value4}',
                                textAlign: TextAlign.center),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text('${intl.mb}\n x 1,725',
                                textAlign: TextAlign.center),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              child: Text('${intl.mbTableKey1Value5}',
                                  textAlign: TextAlign.center)),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text('${intl.mbTableKey2Value5}',
                                textAlign: TextAlign.center),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text('${intl.mb} \nx 1,9',
                                textAlign: TextAlign.center),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                    ],
                  ),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                      "${intl.mbParag7}\n\n${intl.mbParag8}\n\n${intl.mbParag9}"),
                ),
                Dimensions.verticalSpacingSmall,
                Text("${intl.mbTitle5}",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.mbParag10}\n\n${intl.mbParag11}"),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.mbParag12}",
                      style: TextStyle(color: Colors.orangeAccent)),
                ),
                Dimensions.verticalSpacingMedium,
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  imageUrl:
                      "https://www.calculersonimc.fr/images/balance-energetique-gain-poids.png",
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
                  child: Text("${intl.mbParag13}",
                      style: TextStyle(color: Colors.orangeAccent)),
                ),
                Dimensions.verticalSpacingMedium,
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  imageUrl:
                      "https://www.calculersonimc.fr/images/balance-energetique-perte-poids.png",
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
                  child: Text("${intl.mbParag14}"),
                ),
                Dimensions.verticalSpacingSmall,
                Text("${intl.mbTitle6}",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.mbParag15}\n\n${intl.mbParag16}"),
                ),
                Dimensions.verticalSpacingMedium,
                Text("${intl.mbTitle7}",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                      "MB (${intl.male}) = 13,7516∗${intl.weigth} (${intl.kg}) + 500,33∗${intl.height} (${intl.m}) −6,7550∗${intl.age} (an) + 66,473\nMB (${intl.women}) = 9,5634∗${intl.weigth} (${intl.kg}) + 184,96∗${intl.height} (${intl.m}) − 4,6756∗${intl.age} (an) + 655,0955"),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.mbParag17}"),
                ),
                Dimensions.verticalSpacingMedium,
                Text("${intl.mbTitle8}",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                      "MB (${intl.male}) = 13,707∗${intl.weigth} (${intl.kg}) + 492,3∗${intl.height} (${intl.m})−6,673∗${intl.age} (an) + 77,607\n\nMB (${intl.women}) = 9,740∗${intl.weigth} (${intl.kg}) + 172,9∗${intl.height} (${intl.m}) − 4,737∗${intl.age} (an) + 667,051"),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.mbParag18}"),
                ),
                Dimensions.verticalSpacingMedium,
                Text("${intl.mbParag22}",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                      "MB (${intl.male}) = 259∗${intl.weigth} (${intl.kg})\^0.48∗${intl.height} (${intl.m})\^0.50∗${intl.age} (an)\^−0.13\n\nMB (${intl.women}) = 230∗${intl.weigth} (${intl.kg})\^0.48∗${intl.height} (${intl.m})\^0.50∗${intl.age} (an)\^−0.13"),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.mbParag19}"),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("- ${intl.mbParag20}\n- ${intl.mbParag21}"),
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
