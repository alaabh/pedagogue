import 'package:flutter/material.dart';
import 'package:pedagogue/controller/season_controller.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/model/season.dart';
import 'package:pedagogue/utils/resources/api/api_view_handler.dart';

import '../../../../shared/style/app_color.dart';
import '../../../../shared/style/dimensions.dart';
import '../../../../shared/widget/custom_button.dart';
import '../../../../shared/widget/custom_input.dart';

class SeasonAddEditView extends StatefulWidget {
  final Season? season;

  const SeasonAddEditView({
    super.key,
    this.season,
  });

  @override
  State<SeasonAddEditView> createState() => _SeasonAddEditViewState();
}

class _SeasonAddEditViewState extends State<SeasonAddEditView> {
  // API
  SeasonController seasonController = SeasonController();

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) return;

    Season season = Season(
      id: widget.season?.id,
      name: nameController.text,
      description: descriptionController.text,
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.season != null
          ? seasonController.update(season)
          : seasonController.add(season),
      successFunction: () => Navigator.pop(context),
    );
  }

  @override
  void initState() {
    super.initState();

    if (widget.season != null) {
      nameController.text = widget.season?.name ?? '';
      descriptionController.text = widget.season?.description ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.season == null
              ? intl.addNew(intl.season)
              : intl.update(intl.season),
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
                      maxLength: 255,
                      minLines: 3,
                      maxLines: 3,
                      controller: descriptionController,
                      title: intl.description,
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
