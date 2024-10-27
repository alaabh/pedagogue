import 'package:flutter/material.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/model/competition.dart';
import 'package:pedagogue/utils/resources/api/api_view_handler.dart';
import '../../../../controller/competition_controller.dart';
import '../../../../shared/style/app_color.dart';
import '../../../../shared/style/dimensions.dart';
import '../../../../shared/widget/custom_button.dart';
import '../../../../shared/widget/custom_input.dart';

class CompetitionAddEditView extends StatefulWidget {
  final Competition? competition;
  final Future<void> Function({int? param}) reloadDataFunction;

  const CompetitionAddEditView({
    super.key,
    this.competition,
    required this.reloadDataFunction,
  });

  @override
  State<CompetitionAddEditView> createState() => _CompetitionAddEditViewState();
}

class _CompetitionAddEditViewState extends State<CompetitionAddEditView> {
  // API
  CompetitionController competitionController = CompetitionController();

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) return;

    Competition competition = Competition(
      id: widget.competition?.id,
      name: nameController.text,
      description: descriptionController.text,
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.competition != null
          ? competitionController.update(competition)
          : competitionController.add(competition),
      successFunction: () {
        Navigator.pop(context);
        widget.reloadDataFunction(param: 1);
      },
    );
  }

  @override
  void initState() {
    super.initState();

    if (widget.competition != null) {
      nameController.text = widget.competition?.name ?? '';
      descriptionController.text = widget.competition?.description ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.competition == null
              ? intl.addNew(intl.competition)
              : intl.update(intl.competition),
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
                      controller: nameController,
                      title: intl.name,
                      isRequired: true,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.text,
                      controller: descriptionController,
                      title: intl.description,
                    ),
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
