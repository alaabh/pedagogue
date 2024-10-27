import 'package:flutter/material.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../../controller/displineController/step3_controller.dart';
import '../../../model/displineModel/step3_model.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import '../allDisplineMain.dart';

class Step3View extends StatefulWidget {
  const Step3View({super.key});

  @override
  State<Step3View> createState() => _Step3ViewState();
}

class _Step3ViewState extends State<Step3View> {
  TextEditingController performanceController = TextEditingController();
  TextEditingController deadline1Controller = TextEditingController();
  TextEditingController trainingController = TextEditingController();
  TextEditingController deadline2Controller = TextEditingController();
  Step3Controller step3Controller = Step3Controller();
  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    //if (!(_formKey.currentState?.validate() ?? false)) return;

    Step3Model step3Model = Step3Model(
      Performance: performanceController.text,
      Deadline1: deadline1Controller.text,
      Training: trainingController.text,
      Deadline2: deadline2Controller.text,
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: step3Controller.add(step3Model),
      successFunction: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AllDisplineMain(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.step3Title)),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.9,
            child: Column(
              children: [
                CustomInput(
                  controller: performanceController,
                  title: intl.performanceTargets,
                  hint: intl.performanceTargets,
                  maxLines: null,
                  inputType: InputType.text,
                ),
                CustomInput(
                  controller: deadline1Controller,
                  title: intl.deadline,
                  hint: intl.deadline,
                  maxLines: null,
                  inputType: InputType.text,
                ),
                CustomInput(
                  controller: trainingController,
                  title: intl.trainingObjectives,
                  hint: intl.trainingObjectives,
                  maxLines: null,
                  inputType: InputType.text,
                ),
                CustomInput(
                  controller: deadline2Controller,
                  title: intl.deadline,
                  hint: intl.deadline,
                  maxLines: null,
                  inputType: InputType.text,
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
                        text: intl.save,
                        width: MediaQuery.of(context).size.width * 0.18,
                        height: MediaQuery.sizeOf(context).height * 0.06,
                      ),
                      CustomButton(
                        onPressed: () {
                          submit();
                        },
                        text: intl.print,
                        width: MediaQuery.of(context).size.width * 0.18,
                        height: MediaQuery.sizeOf(context).height * 0.06,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
