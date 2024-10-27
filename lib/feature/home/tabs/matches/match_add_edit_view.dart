import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/model/competition.dart';
import 'package:pedagogue/model/match.dart';
import 'package:pedagogue/shared/Widget/custom_dialog.dart';
import 'package:pedagogue/utils/date_time_utils.dart';
import 'package:pedagogue/utils/resources/api/api_view_handler.dart';
import '../../../../controller/competition_controller.dart';
import '../../../../controller/match_controller.dart';
import '../../../../shared/style/app_color.dart';
import '../../../../shared/style/dimensions.dart';
import '../../../../shared/widget/custom_button.dart';

import '../../../../shared/widget/custom_input.dart';

class MatchAddEditView extends StatefulWidget {
  final Match? match;
  final Future<void> Function({int? param}) reloadDataFunction;

  const MatchAddEditView({
    super.key,
    this.match,
    required this.reloadDataFunction,
  });

  @override
  State<MatchAddEditView> createState() => _MatchAddEditViewState();
}

class _MatchAddEditViewState extends State<MatchAddEditView> {
  // API
  MatchController matchController = MatchController();
  CompetitionController competitionController = CompetitionController();

  final _formKey = GlobalKey<FormState>();

  TextEditingController opponentController = TextEditingController();
  TextEditingController resOutController = TextEditingController();
  TextEditingController goRetController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController arbitratorController = TextEditingController();
  TextEditingController assistant1Controller = TextEditingController();
  TextEditingController assistant2Controller = TextEditingController();

  DateTime? selectedDateTime;
  String? _selectedImagePath;
  Competition? selectedCompetition;

  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) {
      return AlertMaker.showSimpleAlertDialog(
        context: context,
        title: intl.warning,
        description: intl.pleaseCheckTheRequiredFields,
        alertType: AlertType.warning,
      );
    }

    Match match = Match(
      id: widget.match?.id,
      opponent: opponentController.text,
      resOut: resOutController.text,
      goRet: goRetController.text,
      place: placeController.text,
      arbitrator: arbitratorController.text,
      assistant1: assistant1Controller.text,
      assistant2: assistant2Controller.text,
      dateTime: selectedDateTime,
      competitionId: selectedCompetition?.id,
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.match != null
          ? matchController.update(
              match,
              multipartParamName: 'file',
              imagePathList:
                  _selectedImagePath == null ? const [] : [_selectedImagePath!],
            )
          : matchController.add(
              match,
              multipartParamName: 'file',
              imagePathList:
                  _selectedImagePath == null ? const [] : [_selectedImagePath!],
            ),
      successFunction: () {
        Navigator.pop(context);
        widget.reloadDataFunction(param: 2);
      },
    );
  }

  @override
  void initState() {
    super.initState();

    competitionController.getAll();

    if (widget.match != null) {
      opponentController.text = widget.match?.opponent ?? '';
      resOutController.text = widget.match?.resOut ?? '';
      goRetController.text = widget.match?.goRet ?? '';
      placeController.text = widget.match?.place ?? '';
      arbitratorController.text = widget.match?.arbitrator ?? '';
      assistant1Controller.text = widget.match?.assistant1 ?? '';
      assistant2Controller.text = widget.match?.assistant2 ?? '';
      selectedDateTime = widget.match?.dateTime;
      if (widget.match?.competitionId != null) {
        competitionController
            .getById(widget.match!.competitionId!)
            .then((apiResponse) => selectedCompetition = apiResponse.item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.match == null
              ? intl.addNew(intl.match)
              : intl.update(intl.match),
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
                      controller: opponentController,
                      title: intl.opponent,
                      isRequired: true,
                    ),
                    Dimensions.verticalSpacingHuge,
                    Text(intl.opponentLogo),
                    Dimensions.verticalSpacingMedium,
                    if (_selectedImagePath != null)
                      Container(
                        width: double.maxFinite,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: Dimensions.mediumBorderRadius,
                        ),
                        margin: const EdgeInsets.only(
                          bottom: Dimensions.mediumValue,
                        ),
                        child: Center(
                          child: Image.file(
                            File(_selectedImagePath!),
                            height: 200,
                          ),
                        ),
                      ),
                    SizedBox(
                      width: double.maxFinite,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          final XFile? pickedFile = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);

                          if (pickedFile != null) {
                            setState(
                              () => _selectedImagePath = pickedFile.path,
                            );
                          }
                        },
                        child: Text(intl.opponentLogo),
                      ),
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.text,
                      controller: placeController,
                      title: intl.place,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.text,
                      controller: arbitratorController,
                      title: intl.arbitrator,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.text,
                      controller: assistant1Controller,
                      title: intl.assistant1,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.text,
                      controller: assistant2Controller,
                      title: intl.assistant2,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.apiDropdown,
                      title: intl.competition,
                      selectedElement: selectedCompetition,
                      onSelectElement: (competition) {
                        selectedCompetition = competition;
                      },
                      apiResponse: competitionController.apiResponse,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.dropdown,
                      dropdownItems: const ['residence', 'outside'],
                      controller: resOutController,
                      title: intl.resOut,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.dropdown,
                      dropdownItems: const ['go', 'back'],
                      controller: goRetController,
                      title: intl.goRet,
                    ),
                    Dimensions.verticalSpacingHuge,
                    CustomInput(
                      inputType: InputType.date,
                      controller: TextEditingController(
                        text: DateTimeUtils.stringFromDate(selectedDateTime),
                      ),
                      onSelectedDateTime: (value) => selectedDateTime = value,
                      title: intl.date,
                      isRequired: true,
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
