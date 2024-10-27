import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';

class CalculatingIMG extends StatefulWidget {
  const CalculatingIMG({super.key});

  @override
  State<CalculatingIMG> createState() => _CalculatingIMGState();
}

class _CalculatingIMGState extends State<CalculatingIMG> {
  TextEditingController height = TextEditingController(text: "0");
  TextEditingController weight = TextEditingController(text: "0");
  TextEditingController sexController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  double result = 0;
  double imgresult = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.imgTitle1),
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
                  child: Text(intl.imgTitle2,
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
                          text: "${intl.calculate} ${intl.img}",
                          onPressed: () {
                            setState(() {
                              var x = int.parse(height.text) / 100;
                              var sexe =
                                  sexController.text == intl.sexValue3 ? 1 : 0;
                              result = int.parse(weight.text) / (x * x);
                              imgresult = (1.20 * result) +
                                  (0.23 * int.parse(ageController.text)) -
                                  (10.8 * sexe) -
                                  5.4;
                            });
                            print(imgresult);
                          })
                    ],
                  )),
                ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imgParag1}\n\n${intl.imgParag2}"),
                ),
                Dimensions.verticalSpacingSmall,
                Text(
                  "${intl.yOURRESULTS}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
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
                ),
                Dimensions.verticalSpacingSmall,
                Text("${intl.imgTitle4}",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imgParag4}"),
                ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imgTableWomen}"),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Table(
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              color: AppColors.primaryColor,
                              child: Text('${intl.imgTable1Key1}',
                                  textAlign: TextAlign.center)),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            color: AppColors.primaryColor,
                            child: Text('${intl.imgTable1Value1}',
                                textAlign: TextAlign.center),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              child: Text('${intl.imgTable1Key2}',
                                  textAlign: TextAlign.center)),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text('${intl.imgTable1Value2}',
                                textAlign: TextAlign.center),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              child: Text('${intl.imgTable1Key3}',
                                  textAlign: TextAlign.center)),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text('${intl.imgTable1Value3}',
                                textAlign: TextAlign.center),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              child: Text('${intl.imgTable1Key4}',
                                  textAlign: TextAlign.center)),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text('${intl.imgTable1Value4}',
                                textAlign: TextAlign.center),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                    ],
                  ),
                ),
                Dimensions.verticalSpacingHuge,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imgTableMen}"),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Table(
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              color: AppColors.primaryColor,
                              child: Text('${intl.imgTable2Key1}',
                                  textAlign: TextAlign.center)),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            color: AppColors.primaryColor,
                            child: Text('${intl.imgTable2Value1}',
                                textAlign: TextAlign.center),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              child: Text('${intl.imgTable2Key2}',
                                  textAlign: TextAlign.center)),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text('${intl.imgTable2Value2}',
                                textAlign: TextAlign.center),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              child: Text('${intl.imgTable2Key3}',
                                  textAlign: TextAlign.center)),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text('${intl.imgTable2Value3}',
                                textAlign: TextAlign.center),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              child: Text('${intl.imgTable2Key4}',
                                  textAlign: TextAlign.center)),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                        TableCell(
                          child: Container(
                            child: Text('${intl.imgTable2Value4}',
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
                      "${intl.imgParag5}\n\n${intl.imgParag6}\n\n${intl.imgParag7}"),
                ),
                Dimensions.verticalSpacingSmall,
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  imageUrl:
                      "https://www.calculersonimc.fr/wp-content/uploads/2018/04/docteur-mesurant-masse-graisseuse.jpg",
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
                Text("${intl.imgTitle5}",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imgParag8}"),
                ),
                Dimensions.verticalSpacingMedium,
                Text("${intl.imgTitle6}",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                      "${intl.img} (%) = (1.20∗${intl.imc}) + (0.23∗${intl.age}) − (10.8∗${intl.sex}) − 5.4"),
                ),
                Dimensions.verticalSpacingMedium,
                Text("${intl.imgTitle7}",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                      "${intl.img} (%) = (1.29∗${intl.imc}) + (0.20∗${intl.age}) − (11.4∗${intl.sex}) − 8.0"),
                ),
                Dimensions.verticalSpacingMedium,
                Text("${intl.imgTitle8}",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                      "${intl.img} (%) = (1.46∗${intl.imc}) + (0.14∗${intl.age}) − (11.6∗${intl.sex}) − 10.0"),
                ),
                Dimensions.verticalSpacingMedium,
                Text("${intl.imgTitle9}",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                      "${intl.img} (%) = (1.61∗${intl.imc}) + (0.13∗${intl.age}) − (12.1∗${intl.sex}) − 13.9"),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imgParag9}"),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                      "${intl.img} (%) = (1.51∗${intl.imc}) + (0.70∗${intl.age}) − (3.6∗${intl.sex}) + 1.4"),
                ),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imgParag10}"),
                ),
                Dimensions.verticalSpacingSmall,
                Text("${intl.imgTitle10}",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Dimensions.verticalSpacingMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("${intl.imgParag11}"),
                ),
                Dimensions.verticalSpacingSmall,
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  imageUrl:
                      "https://www.calculersonimc.fr/wp-content/uploads/2018/04/femme-en-surpoids.jpg",
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
                  child: Text("${intl.imgParag12}"),
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
