import 'package:flutter/material.dart';
import 'package:pedagogue/controller/evaluation_by_position_controller/deffense_controller.dart';
import 'package:pedagogue/feature/evaluationByPosition/EvaluationByPositionMain.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/model/evaluation_by_program_model/defense_model.dart';

import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class EvaluationDeffense extends StatefulWidget {
  final DeffenseModel? deffenseModel;
  final String player;
  final String team;
  final String season;
  final String month;
  const EvaluationDeffense(
      {super.key,
      required this.player,
      required this.team,
      required this.season,
      required this.month,
      this.deffenseModel});

  @override
  State<EvaluationDeffense> createState() => _EvaluationDeffenseState();
}

class _EvaluationDeffenseState extends State<EvaluationDeffense> {
  final List<String> titleList = [
    intl.evaluationByPosition1,
    intl.evaluationByPosition2,
    intl.evaluationByPosition3,
    intl.evaluationByPosition4,
    intl.evaluationByPosition5,
    intl.evaluationByPosition6,
    intl.evaluationByPosition7,
    intl.evaluationByPosition8,
    intl.evaluationByPosition9,
    intl.evaluationByPosition10,
    intl.evaluationByPosition11,
    intl.evaluationByPosition12,
    intl.evaluationByPosition13,
    intl.evaluationByPosition14,
    intl.evaluationByPosition15,
    intl.evaluationByPosition16,
    intl.evaluationByPosition17,
    intl.evaluationByPosition18,
    intl.evaluationByPosition19,
    intl.evaluationByPosition20,
    intl.evaluationByPosition21,
    intl.evaluationByPosition22,
    intl.evaluationByPosition23,
    intl.evaluationByPosition24,
    intl.evaluationByPosition25,
    intl.evaluationByPosition26,
    intl.evaluationByPosition27,
    intl.evaluationByPosition28,
  ];
  List<TextEditingController> controllerList = [];

  DeffenseController deffenseController = DeffenseController();
  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    //if (!(_formKey.currentState?.validate() ?? false)) return;

    DeffenseModel deffenseModel = DeffenseModel(
      team: widget.team,
      player: widget.player,
      season: widget.season,
      month: widget.month,
      L1: _L1.text,
      L2: _L2.text,
      L3: _L3.text,
      L4: _L4.text,
      L5: _L5.text,
      L6: _L6.text,
      L7: _L7.text,
      L8: _L8.text,
      L9: _L9.text,
      L10: _L10.text,
      L11: _L11.text,
      L12: _L12.text,
      L13: _L13.text,
      L14: _L14.text,
      L15: _L15.text,
      L16: _L16.text,
      L17: _L17.text,
      L18: _L18.text,
      L19: _L19.text,
      L20: _L20.text,
      L21: _L21.text,
      L22: _L22.text,
      L23: _L23.text,
      L24: _L24.text,
      L25: _L25.text,
      L26: _L26.text,
      L27: _L27.text,
      L28: _L28.text,
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.deffenseModel != null
          ? deffenseController.update(deffenseModel)
          : deffenseController.add(deffenseModel),
      successFunction: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EvaluationByPositionMAin(),
        ),
      ),
    );
  }

  TextEditingController _L1 = TextEditingController();
  TextEditingController _L2 = TextEditingController();
  TextEditingController _L3 = TextEditingController();
  TextEditingController _L4 = TextEditingController();
  TextEditingController _L5 = TextEditingController();
  TextEditingController _L6 = TextEditingController();
  TextEditingController _L7 = TextEditingController();
  TextEditingController _L8 = TextEditingController();
  TextEditingController _L9 = TextEditingController();
  TextEditingController _L10 = TextEditingController();
  TextEditingController _L11 = TextEditingController();
  TextEditingController _L12 = TextEditingController();
  TextEditingController _L13 = TextEditingController();
  TextEditingController _L14 = TextEditingController();
  TextEditingController _L15 = TextEditingController();
  TextEditingController _L16 = TextEditingController();
  TextEditingController _L17 = TextEditingController();
  TextEditingController _L18 = TextEditingController();
  TextEditingController _L19 = TextEditingController();
  TextEditingController _L20 = TextEditingController();
  TextEditingController _L21 = TextEditingController();
  TextEditingController _L22 = TextEditingController();
  TextEditingController _L23 = TextEditingController();
  TextEditingController _L24 = TextEditingController();
  TextEditingController _L25 = TextEditingController();
  TextEditingController _L26 = TextEditingController();
  TextEditingController _L27 = TextEditingController();
  TextEditingController _L28 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.deffenseModel != null) {
      _L1.text = widget.deffenseModel!.L1 ?? '';
      _L2.text = widget.deffenseModel!.L2 ?? '';
      _L3.text = widget.deffenseModel!.L3 ?? '';
      _L4.text = widget.deffenseModel!.L4 ?? '';
      _L5.text = widget.deffenseModel!.L5 ?? '';
      _L6.text = widget.deffenseModel!.L6 ?? '';
      _L7.text = widget.deffenseModel!.L7 ?? '';
      _L8.text = widget.deffenseModel!.L8 ?? '';
      _L9.text = widget.deffenseModel!.L9 ?? '';
      _L10.text = widget.deffenseModel!.L10 ?? '';
      _L11.text = widget.deffenseModel!.L11 ?? '';
      _L12.text = widget.deffenseModel!.L12 ?? '';
      _L13.text = widget.deffenseModel!.L13 ?? '';
      _L14.text = widget.deffenseModel!.L14 ?? '';
      _L15.text = widget.deffenseModel!.L15 ?? '';
      _L16.text = widget.deffenseModel!.L16 ?? '';
      _L17.text = widget.deffenseModel!.L17 ?? '';
      _L18.text = widget.deffenseModel!.L18 ?? '';
      _L19.text = widget.deffenseModel!.L19 ?? '';
      _L20.text = widget.deffenseModel!.L20 ?? '';
      _L21.text = widget.deffenseModel!.L21 ?? '';
      _L22.text = widget.deffenseModel!.L22 ?? '';
      _L23.text = widget.deffenseModel!.L23 ?? '';
      _L24.text = widget.deffenseModel!.L24 ?? '';
      _L25.text = widget.deffenseModel!.L25 ?? '';
      _L26.text = widget.deffenseModel!.L26 ?? '';
      _L27.text = widget.deffenseModel!.L27 ?? '';
      _L28.text = widget.deffenseModel!.L28 ?? '';
    }
    controllerList = [
      _L1,
      _L2,
      _L3,
      _L4,
      _L5,
      _L6,
      _L7,
      _L8,
      _L9,
      _L10,
      _L11,
      _L12,
      _L13,
      _L14,
      _L15,
      _L16,
      _L17,
      _L18,
      _L19,
      _L20,
      _L21,
      _L22,
      _L23,
      _L24,
      _L25,
      _L26,
      _L27,
      _L28
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.defender),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: GridView.count(
                        crossAxisCount: 1,

                        childAspectRatio: MediaQuery.of(context).size.height *
                            0.003, // Adjust based on your needs
                        children: List.generate(
                          titleList.length,
                          (index) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: CustomInput(
                                  controller: controllerList[index],
                                  hint: "${intl.evaluation}",
                                  title: titleList[index],
                                  inputType: InputType.dropdown,
                                  dropdownItems: const [
                                    "1",
                                    "2",
                                    "3",
                                    "4",
                                    "5",
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
                          CustomButton(
                            onPressed: () {},
                            text: '${intl.print}',
                            width: MediaQuery.of(context).size.width * 0.18,
                            height: MediaQuery.sizeOf(context).height * 0.06,
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.06,
                            width: MediaQuery.sizeOf(context).width * 0.29,
                            child: FilledButton.icon(
                              onPressed: () => Navigator.of(context)..pop(),
                              label: Text("${intl.back}"),
                              icon: const Icon(Icons.keyboard_arrow_left),
                            ),
                          ),
                          CustomButton(
                            onPressed: () {
                              submit();
                            },
                            text: '${intl.save}',
                            width: MediaQuery.of(context).size.width * 0.18,
                            height: MediaQuery.sizeOf(context).height * 0.06,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
