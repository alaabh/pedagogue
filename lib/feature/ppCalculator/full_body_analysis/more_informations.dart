import 'package:flutter/material.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';

class MoreInformations extends StatefulWidget {
  const MoreInformations({super.key});

  @override
  State<MoreInformations> createState() => _MoreInformationsState();
}

class _MoreInformationsState extends State<MoreInformations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.moreInformaations}"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Text("${intl.moreInformaations1}"),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.moreInformaations2}"),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "1.${intl.moreInformaationsTitle1}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.moreInformaationsParag1}"),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "2.${intl.moreInformaationsTitle2}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.moreInformaationsParag2}"),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "3.${intl.moreInformaationsTitle3}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.moreInformaationsParag3}"),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "4.${intl.moreInformaationsTitle4}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.moreInformaationsParag4}"),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "5.${intl.moreInformaationsTitle5}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.moreInformaationsParag5}"),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "6.${intl.moreInformaationsTitle6}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.moreInformaationsParag6}"),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "7.${intl.moreInformaationsTitle7}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.moreInformaationsParag7}"),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "8.${intl.moreInformaationsTitle8}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.moreInformaationsParag8}"),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "9.${intl.moreInformaationsTitle9}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.moreInformaationsParag9}"),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "10.${intl.moreInformaationsTitle10}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.moreInformaationsParag10}"),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "11.${intl.moreInformaationsTitle11}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.moreInformaationsParag11}"),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "12.${intl.moreInformaationsTitle12}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.moreInformaationsParag12}"),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "13.${intl.moreInformaationsTitle13}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.moreInformaationsParag13}"),
                Dimensions.verticalSpacingExtraLarge,
                Text("${intl.moreInformaations3}"),
                Dimensions.verticalSpacingExtraLarge,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
