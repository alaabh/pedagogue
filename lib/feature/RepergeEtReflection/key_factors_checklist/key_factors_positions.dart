import 'package:flutter/material.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/shimmer/radio_widget_list.dart';
import 'key_factors_passing.dart';

class KeyFactorsChecklistPositions extends StatefulWidget {
  final TextEditingController joueurController;
  final TextEditingController dateController;
  final TextEditingController team1Controller;
  final TextEditingController ageController;
  final TextEditingController coachController;
  final TextEditingController footController;
  const KeyFactorsChecklistPositions(
      {super.key,
      required this.joueurController,
      required this.dateController,
      required this.team1Controller,
      required this.ageController,
      required this.coachController,
      required this.footController});

  @override
  State<KeyFactorsChecklistPositions> createState() =>
      _KeyFactorsChecklistPositionsState();
}

class _KeyFactorsChecklistPositionsState
    extends State<KeyFactorsChecklistPositions> {
  Map<String, String> titleList = {
    "${intl.keyfactorsPositions1}": "",
    "${intl.keyfactorsPositions2}": "",
    "${intl.keyfactorsPositions3}": "",
    "${intl.keyfactorsPositions4}": "",
    "${intl.keyfactorsPositions5}": "",
    "${intl.keyfactorsPositions6}": "",
    "${intl.keyfactorsPositions7}": "",
    "${intl.keyfactorsPositions8}": "",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${intl.keyfactorsPositionsList}")),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              Dimensions.verticalSpacingExtraLarge,
              Text(
                "1:${intl.keyfactorsPositions9}",
                style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: [
                  Text(
                    "1:${intl.keyfactorsPositions10}",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "2:${intl.keyfactorsPositions11}",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "3:${intl.keyfactorsPositions12}",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              Column(
                children: titleList.entries.map((entry) {
                  return Column(
                    children: [
                      Dimensions.verticalSpacingExtraLarge,
                      RadioWidgetList(
                        title: entry.key,
                        onChanged: (value) {
                          setState(() {
                            titleList[entry.key] = value!;
                          });
                        },
                        selectedValue: entry.value,
                        orientation: Axis.horizontal,
                        values: [
                          "1",
                          "2",
                          "3",
                        ],
                      ),
                    ],
                  );
                }).toList(),
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomButton(
                  text: intl.next,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => KeyFactorsPassing(
                          titleListPositions: titleList,
                          joueurController: widget.joueurController,
                          dateController: widget.dateController,
                          team1Controller: widget.team1Controller,
                          ageController: widget.ageController,
                          coachController: widget.coachController,
                          footController: widget.footController,
                        ),
                      ),
                    );
                  }),
              Dimensions.verticalSpacingExtraLarge,
            ],
          ),
        ))));
  }
}
