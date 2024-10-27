import 'package:flutter/material.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';

class stepTwoExercice extends StatefulWidget {
  TextEditingController? dimentionObjectiveController;

  TextEditingController? instructionEvolutionController;
  TextEditingController? expectedBihavorController;
  stepTwoExercice(
      {super.key,
      this.dimentionObjectiveController,
      this.instructionEvolutionController,
      this.expectedBihavorController});

  @override
  State<stepTwoExercice> createState() => _stepTwoExerciceState();
}

class _stepTwoExerciceState extends State<stepTwoExercice> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: Dimensions.paddingLarge,
          child: Column(
            children: [
              Dimensions.verticalSpacingSmall,
              CustomInput(
                inputType: InputType.text,
                controller: widget.dimentionObjectiveController,
                title: '${intl.dimensionObjective}',
              ),
              Dimensions.verticalSpacingHuge,
              CustomInput(
                inputType: InputType.text,
                controller: widget.instructionEvolutionController,
                title: '${intl.instructionsevolutions}',
              ),
              Dimensions.verticalSpacingHuge,
              CustomInput(
                inputType: InputType.text,
                controller: widget.expectedBihavorController,
                title: '${intl.expectedbehaviour}',
              ),
              Dimensions.verticalSpacingHuge,
            ],
          ),
        ),
      ),
    );
  }
}
