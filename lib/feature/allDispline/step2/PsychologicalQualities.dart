import 'package:flutter/material.dart';

import '../../../controller/displineController/step2_controller.dart';
import '../../../l10n/localization.dart';
import '../../../model/displineModel/step2_model.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import '../allDisplineMain.dart';

class PsychologicalQualites extends StatefulWidget {
  final List<String> controllerTechnicalList;
  final List<String> controllerPreparationPhysiqueList;
  final List<String> controllerIndividualTacticList;

  final List<String> controllerStrategyList;
  const PsychologicalQualites(
      {super.key,
      required this.controllerStrategyList,
      required this.controllerTechnicalList,
      required this.controllerPreparationPhysiqueList,
      required this.controllerIndividualTacticList});

  @override
  State<PsychologicalQualites> createState() => _PsychologicalQualitesState();
}

class _PsychologicalQualitesState extends State<PsychologicalQualites> {
  final List<String> titleList = [
    intl.psychologicalQualities1,
    intl.psychologicalQualities2,
    intl.psychologicalQualities3,
    intl.psychologicalQualities4,
    intl.psychologicalQualities5,
    intl.psychologicalQualities6,
    intl.psychologicalQualities7,
    intl.psychologicalQualities8,
    intl.psychologicalQualities9,
    intl.psychologicalQualities10,
    intl.psychologicalQualities11,
    intl.psychologicalQualities12,
  ];
  List<TextEditingController> controllerList = [];
  final TextEditingController _IdentifyObjectives = TextEditingController();
  final TextEditingController _Visualization = TextEditingController();
  final TextEditingController _ControlDistractions = TextEditingController();
  final TextEditingController _Emotionalcontrol = TextEditingController();
  final TextEditingController _Relaxation = TextEditingController();
  final TextEditingController _Activation = TextEditingController();
  final TextEditingController _TeamCohesion = TextEditingController();
  final TextEditingController _StressControl = TextEditingController();
  final TextEditingController _Concentration = TextEditingController();
  final TextEditingController _InternalDialogue = TextEditingController();
  final TextEditingController _OptimumPsychoPerfo = TextEditingController();
  final TextEditingController _PsychoFundamentalSkills =
      TextEditingController();

  Step2Controller step2Controller = Step2Controller();
  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    //if (!(_formKey.currentState?.validate() ?? false)) return;

    Step2Model step2Model = Step2Model(
      L1: widget.controllerPreparationPhysiqueList[0],
      L2: widget.controllerPreparationPhysiqueList[1],
      L3: widget.controllerPreparationPhysiqueList[2],
      L4: widget.controllerPreparationPhysiqueList[3],
      L5: widget.controllerPreparationPhysiqueList[4],
      L6: widget.controllerPreparationPhysiqueList[5],
      L7: widget.controllerPreparationPhysiqueList[6],
      L8: widget.controllerPreparationPhysiqueList[7],
      L9: widget.controllerPreparationPhysiqueList[8],
      L10: widget.controllerPreparationPhysiqueList[9],
      L11: widget.controllerPreparationPhysiqueList[10],
      L12: widget.controllerPreparationPhysiqueList[11],
      L13: widget.controllerPreparationPhysiqueList[12],
      L14: widget.controllerPreparationPhysiqueList[13],
      L15: widget.controllerPreparationPhysiqueList[14],
      L16: widget.controllerPreparationPhysiqueList[15],
      L17: widget.controllerPreparationPhysiqueList[16],
      L18: widget.controllerTechnicalList[0],
      L19: widget.controllerTechnicalList[1],
      L20: widget.controllerTechnicalList[2],
      L21: widget.controllerTechnicalList[3],
      L22: widget.controllerTechnicalList[4],
      L23: widget.controllerTechnicalList[5],
      L24: widget.controllerIndividualTacticList[0],
      L25: widget.controllerIndividualTacticList[1],
      L26: widget.controllerIndividualTacticList[2],
      L27: widget.controllerStrategyList[0],
      L28: _IdentifyObjectives.text,
      L29: _Visualization.text,
      L30: _ControlDistractions.text,
      L31: _Emotionalcontrol.text,
      L32: _Relaxation.text,
      L33: _Activation.text,
      L34: _TeamCohesion.text,
      L35: _StressControl.text,
      L36: _Concentration.text,
      L37: _InternalDialogue.text,
      L38: _OptimumPsychoPerfo.text,
      L39: _PsychoFundamentalSkills.text,
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: step2Controller.add(step2Model),
      successFunction: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AllDisplineMain(),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    controllerList = [
      _IdentifyObjectives,
      _Visualization,
      _ControlDistractions,
      _Emotionalcontrol,
      _Relaxation,
      _Activation,
      _TeamCohesion,
      _StressControl,
      _Concentration,
      _InternalDialogue,
      _OptimumPsychoPerfo,
      _PsychoFundamentalSkills,
    ];

    super.initState();
  }

  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.psychologicalQualities),
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
                        CustomButton(
                          onPressed: () {},
                          text: intl.print,
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: MediaQuery.sizeOf(context).height * 0.06,
                        ),
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
                        CustomButton(
                          onPressed: () {
                            submit();
                            print([
                              widget.controllerPreparationPhysiqueList[0],
                              widget.controllerPreparationPhysiqueList[1],
                              widget.controllerPreparationPhysiqueList[2],
                              widget.controllerPreparationPhysiqueList[3],
                              widget.controllerPreparationPhysiqueList[4],
                              widget.controllerPreparationPhysiqueList[5],
                              widget.controllerPreparationPhysiqueList[6],
                              widget.controllerPreparationPhysiqueList[7],
                              widget.controllerPreparationPhysiqueList[8],
                              widget.controllerPreparationPhysiqueList[9],
                              widget.controllerPreparationPhysiqueList[10],
                              widget.controllerPreparationPhysiqueList[11],
                              widget.controllerPreparationPhysiqueList[12],
                              widget.controllerPreparationPhysiqueList[13],
                              widget.controllerPreparationPhysiqueList[14],
                              widget.controllerPreparationPhysiqueList[15],
                              widget.controllerPreparationPhysiqueList[16],
                              widget.controllerTechnicalList[0],
                              widget.controllerTechnicalList[1],
                              widget.controllerTechnicalList[2],
                              widget.controllerTechnicalList[3],
                              widget.controllerTechnicalList[4],
                              widget.controllerTechnicalList[5],
                              widget.controllerIndividualTacticList[0],
                              widget.controllerIndividualTacticList[1],
                              widget.controllerIndividualTacticList[2],
                              widget.controllerStrategyList[0],
                              _IdentifyObjectives.text,
                              _Visualization.text,
                              _ControlDistractions.text,
                              _Emotionalcontrol.text,
                              _Relaxation.text,
                              _Activation.text,
                              _TeamCohesion.text,
                              _StressControl.text,
                              _Concentration.text,
                              _InternalDialogue.text,
                              _OptimumPsychoPerfo.text,
                              _PsychoFundamentalSkills.text,
                            ]);
                          },
                          text: intl.save,
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: MediaQuery.sizeOf(context).height * 0.06,
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
