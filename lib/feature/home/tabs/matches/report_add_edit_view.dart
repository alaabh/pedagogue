import 'package:flutter/material.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/model/report.dart';
import 'package:pedagogue/utils/resources/api/api_view_handler.dart';
import '../../../../controller/report_controller.dart';
import '../../../../shared/style/app_color.dart';
import '../../../../shared/style/dimensions.dart';
import '../../../../shared/widget/custom_button.dart';
import '../../../../shared/widget/custom_input.dart';

class ReportAddEditView extends StatefulWidget {
  final Report? report;
  final Future<void> Function({int? param}) reloadDataFunction;

  const ReportAddEditView({
    super.key,
    this.report,
    required this.reloadDataFunction,
  });

  @override
  State<ReportAddEditView> createState() => _ReportAddEditViewState();
}

class _ReportAddEditViewState extends State<ReportAddEditView> {
  // API
  ReportController reportController = ReportController();

  final _formKey = GlobalKey<FormState>();

  TextEditingController matchController = TextEditingController();
  TextEditingController yellowCardController = TextEditingController();
  TextEditingController redCardController = TextEditingController();
  TextEditingController scorerController = TextEditingController();
  TextEditingController assistantGoalscoringController =
      TextEditingController();
  TextEditingController scoreController = TextEditingController();
  TextEditingController goalsConcededController = TextEditingController();

  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) return;

    Report report = Report(
      id: widget.report?.id,
      match: matchController.text,
      yellowCard: yellowCardController.text,
      redCard: redCardController.text,
      scorer: scorerController.text,
      assistantGoalscoring: assistantGoalscoringController.text,
      score: scoreController.text,
      goalsConceded: goalsConcededController.text,
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.report != null
          ? reportController.update(report)
          : reportController.add(report),
      successFunction: () {
        Navigator.pop(context);
        widget.reloadDataFunction(param: 3);
      },
    );
  }

  @override
  void initState() {
    super.initState();

    if (widget.report != null) {
      matchController.text = widget.report?.match ?? '';
      yellowCardController.text = widget.report?.yellowCard ?? '';
      redCardController.text = widget.report?.redCard ?? '';
      scorerController.text = widget.report?.scorer ?? '';
      assistantGoalscoringController.text =
          widget.report?.assistantGoalscoring ?? '';
      scoreController.text = widget.report?.score ?? '';
      goalsConcededController.text = widget.report?.goalsConceded ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.report == null
              ? intl.addNew(intl.report)
              : intl.update(intl.report),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: Dimensions.paddingLarge,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomInput(
                      inputType: InputType.text,
                      controller: matchController,
                      title: intl.match,
                      isRequired: true,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.text,
                      controller: yellowCardController,
                      title: intl.yellowCard,
                      isRequired: true,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.text,
                      controller: redCardController,
                      title: intl.redCard,
                      isRequired: true,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.text,
                      controller: scorerController,
                      title: intl.scorer,
                      isRequired: true,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.text,
                      controller: assistantGoalscoringController,
                      title: intl.assistantGoalscoring,
                      isRequired: true,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.text,
                      controller: scoreController,
                      title: intl.score,
                      isRequired: true,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.text,
                      controller: goalsConcededController,
                      title: intl.goalsConceded,
                      isRequired: true,
                    ),
                    Dimensions.verticalSpacingHuge,
                  ],
                ),
              ),
            ),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      width: double.infinity,
      padding: Dimensions.paddingExtraLarge,
      decoration: BoxDecoration(
        color: AppColors.secondaryBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -3),
          )
        ],
      ),
      child: CustomButton(
        text: intl.save,
        onPressed: submit,
        width: MediaQuery.of(context).size.width * 0.18,
      ),
    );
  }
}
