import 'package:flutter/material.dart';
import 'package:pedagogue/controller/coaching_controller.dart';
import 'package:pedagogue/controller/session_controller.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/model/coaching.dart';
import 'package:pedagogue/shared/Widget/custom_dialog.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';
import 'package:pedagogue/utils/resources/api/api_view_handler.dart';
import 'package:pedagogue/utils/time_of_day_utils.dart';

import '../../../../../shared/style/dimensions.dart';

class CoachingSubview extends StatefulWidget {
  final Function loadDataFunction;

  const CoachingSubview({super.key, required this.loadDataFunction});

  @override
  State<CoachingSubview> createState() => CoachingSubviewState();
}

class CoachingSubviewState extends State<CoachingSubview> {
  // API
  SessionController sessionController = SessionController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController ratingController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController gameStageController = TextEditingController();
  TextEditingController themeController = TextEditingController();
  TextEditingController theme2Controller = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController listSessionsController = TextEditingController();
  TextEditingController placeController = TextEditingController();

  Future<void> submit(DateTime dateTime) async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!(formKey.currentState?.validate() ?? false)) {
      return AlertMaker.showSimpleAlertDialog(
        context: context,
        title: intl.warning,
        description: intl.pleaseCheckTheRequiredFields,
        alertType: AlertType.warning,
      );
    }

    CoachingController coachingController = CoachingController();

    final time = TimeOfDayUtils.timeFromString(timeController.text);

    Coaching coaching = Coaching(
      rating: int.tryParse(ratingController.text),
      name: nameController.text,
      gameStage: gameStageController.text,
      theme: themeController.text,
      theme2: theme2Controller.text,
      dateTime: dateTime.copyWith(hour: time.hour, minute: time.minute),
      place: placeController.text,
      sessionId: listSessionsController.text,
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: coachingController.add(coaching),
      successFunction: () {
        widget.loadDataFunction();
        Navigator.of(context).pop();
      },
    );
  }

  @override
  void initState() {
    super.initState();

    sessionController.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        margin: Dimensions.paddingMedium,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: Dimensions.mediumBorderRadius,
        ),
        child: SingleChildScrollView(
          padding: Dimensions.paddingMedium,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInput(
                controller: ratingController,
                inputType: InputType.rating,
                title: intl.rating,
                isRequired: true,
              ),
              Dimensions.verticalSpacingHuge,
              CustomInput(
                inputType: InputType.text,
                controller: nameController,
                title: intl.title,
                hint: intl.title,
                isRequired: true,
              ),
              Dimensions.verticalSpacingHuge,
              CustomInput(
                inputType: InputType.dropdown,
                dropdownItems: [
                  "${intl.gameStageCoaching1}",
                  "${intl.gameStageCoaching2}",
                  "${intl.gameStageCoaching3}",
                  "${intl.gameStageCoaching4}",
                  "${intl.gameStageCoaching5}",
                  "${intl.gameStageCoaching6}",
                ],
                controller: gameStageController,
                title: intl.gamestage,
                hint: intl.select(intl.gamestage),
              ),
              Dimensions.verticalSpacingHuge,
              CustomInput(
                inputType: InputType.dropdown,
                dropdownItems: [
                  "${intl.themeCoaching1}",
                  "${intl.themeCoaching2}",
                  "${intl.themeCoaching3}",
                  "${intl.themeCoaching4}",
                  "${intl.themeCoaching5}",
                  "${intl.themeCoaching6}",
                  "${intl.themeCoaching7}",
                  "${intl.themeCoaching8}",
                  "${intl.themeCoaching9}",
                  "${intl.themeCoaching10}",
                  "${intl.themeCoaching11}",
                  "${intl.themeCoaching12}",
                  "${intl.themeCoaching13}",
                  "${intl.themeCoaching14}",
                  "${intl.themeCoaching15}",
                  "${intl.themeCoaching16}",
                  "${intl.themeCoaching17}",
                  "${intl.themeCoaching18}",
                  "${intl.themeCoaching19}",
                  "${intl.themeCoaching20}",
                  "${intl.themeCoaching21}",
                  "${intl.themeCoaching22}",
                  "${intl.themeCoaching23}",
                  "${intl.themeCoaching24}",
                ],
                controller: themeController,
                title: intl.theme,
                hint: intl.select(intl.theme),
              ),
              Dimensions.verticalSpacingHuge,
              CustomInput(
                inputType: InputType.dropdown,
                dropdownItems: [
                  "${intl.themeCoaching1}",
                  "${intl.themeCoaching2}",
                  "${intl.themeCoaching3}",
                  "${intl.themeCoaching4}",
                  "${intl.themeCoaching5}",
                  "${intl.themeCoaching6}",
                  "${intl.themeCoaching7}",
                  "${intl.themeCoaching8}",
                  "${intl.themeCoaching9}",
                  "${intl.themeCoaching10}",
                  "${intl.themeCoaching11}",
                  "${intl.themeCoaching12}",
                  "${intl.themeCoaching13}",
                  "${intl.themeCoaching14}",
                  "${intl.themeCoaching15}",
                  "${intl.themeCoaching16}",
                  "${intl.themeCoaching17}",
                  "${intl.themeCoaching18}",
                  "${intl.themeCoaching19}",
                  "${intl.themeCoaching20}",
                  "${intl.themeCoaching21}",
                  "${intl.themeCoaching22}",
                  "${intl.themeCoaching23}",
                  "${intl.themeCoaching24}",
                ],
                controller: theme2Controller,
                title: "${intl.theme} 2",
                hint: intl.select(intl.theme),
              ),
              Dimensions.verticalSpacingHuge,
              CustomInput(
                inputType: InputType.time,
                controller: timeController,
                title: intl.time,
                hint: '--:-- --',
              ),
              Dimensions.verticalSpacingHuge,
              CustomInput(
                inputType: InputType.text,
                controller: placeController,
                title: intl.place,
                hint: intl.place,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
