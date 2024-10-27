import 'package:flutter/material.dart';

import '../../../l10n/localization.dart';
import '../../../shared/widget/custom_input.dart';
import 'PsychologicalQualities.dart';

class Strategy extends StatefulWidget {
  final List<String> controllerIndividualTacticList;
  final List<String> controllerTechnicalList;
  final List<String> controllerPreparationPhysiqueList;
  const Strategy(
      {super.key,
      required this.controllerIndividualTacticList,
      required this.controllerTechnicalList,
      required this.controllerPreparationPhysiqueList});

  @override
  State<Strategy> createState() => _StrategyState();
}

class _StrategyState extends State<Strategy> {
  final List<String> titleList = [
    intl.strategy1,
  ];
  List<TextEditingController> controllerList = [];
  final TextEditingController _GamePlan = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    controllerList = [
      _GamePlan,
    ];

    super.initState();
  }

  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          intl.strategy,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: GridView.count(
                      crossAxisCount: 2,

                      childAspectRatio: MediaQuery.of(context).size.width *
                          0.0035, // Adjust based on your needs
                      children: List.generate(
                        controllerList.length,
                        (index) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: CustomInput(
                                controller: controllerList[index],
                                hint: intl.selectThetype,
                                title: titleList[index],
                                inputType: InputType.dropdown,
                                dropdownItems:  [
                                   intl.mAJ,
                                 intl.iMP,
                                 intl.mOD,
                                 intl.lOW,
                                 intl.nA,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.06,
                          width: MediaQuery.sizeOf(context).width * 0.3,
                          child: FilledButton(
                            onPressed: () => Navigator.of(context)..pop(),
                            child: isRtl
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.keyboard_arrow_right),
                                      Text(intl.back),
                                    ],
                                  )
                                : Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Add space between icon and text
                                      Icon(Icons.keyboard_arrow_left),

                                      Text(intl.back),
                                    ],
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.06,
                          width: MediaQuery.sizeOf(context).width * 0.3,
                          child: FilledButton(
                            onPressed: () {
                              //print(widget.controllerIndividualTacticList);
                              // widget.controllerIndividualTacticList.toString();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PsychologicalQualites(
                                    controllerStrategyList: [_GamePlan.text],
                                    controllerTechnicalList:
                                        widget.controllerTechnicalList,
                                    controllerPreparationPhysiqueList: widget
                                        .controllerPreparationPhysiqueList,
                                    controllerIndividualTacticList:
                                        widget.controllerIndividualTacticList,
                                  ),
                                ),
                              );
                            },
                            child: isRtl
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.keyboard_arrow_left),
                                      Text(intl.next),
                                    ],
                                  )
                                : Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Add space between icon and text
                                      Icon(Icons.keyboard_arrow_right),

                                      Text(intl.next),
                                    ],
                                  ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
