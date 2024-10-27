import 'package:flutter/material.dart';
import 'package:pedagogue/controller/team_controller.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/model/team.dart';
import 'package:pedagogue/utils/resources/api/api_view_handler.dart';

import '../../../../shared/style/app_color.dart';
import '../../../../shared/style/dimensions.dart';
import '../../../../shared/widget/custom_button.dart';
import '../../../../shared/widget/custom_input.dart';

class TeamAddEditView extends StatefulWidget {
  final Team? team;

  const TeamAddEditView({
    super.key,
    this.team,
  });

  @override
  State<TeamAddEditView> createState() => _TeamAddEditViewState();
}

class _TeamAddEditViewState extends State<TeamAddEditView> {
  // API
  TeamController teamController = TeamController();

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) return;

    Team team = Team(
      id: widget.team?.id,
      name: nameController.text,
      category: categoryController.text,
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.team != null
          ? teamController.update(team)
          : teamController.add(team),
      successFunction: () => Navigator.pop(context),
    );
  }

  @override
  void initState() {
    super.initState();

    if (widget.team != null) {
      nameController.text = widget.team?.name ?? '';
      categoryController.text = widget.team?.category ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.team == null ? intl.addNew(intl.team) : intl.update(intl.team),
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
                      inputType: InputType.dropdown,
                      dropdownItems: [
                        "${intl.u10}",
                        "${intl.u12}",
                        "${intl.u13}",
                        "${intl.u15}",
                        "${intl.u17}",
                        "${intl.u19}",
                        "${intl.u21}",
                        '${intl.categoriesCoaching1}',
                      ],
                      controller: categoryController,
                      title: intl.category,
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
