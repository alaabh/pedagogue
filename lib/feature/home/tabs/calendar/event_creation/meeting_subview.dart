import 'package:flutter/material.dart';
import 'package:pedagogue/model/calendar_meeting.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';

import '../../../../../controller/calendar_meeting_controller.dart';
import '../../../../../l10n/localization.dart';
import '../../../../../shared/Widget/custom_dialog.dart';
import '../../../../../shared/style/dimensions.dart';
import '../../../../../utils/resources/api/api_view_handler.dart';
import '../../../../../utils/time_of_day_utils.dart';

class MeetingSubview extends StatefulWidget {
  final Function loadDataFunction;

  const MeetingSubview({super.key, required this.loadDataFunction});

  @override
  State<MeetingSubview> createState() => MeetingSubviewState();
}

class MeetingSubviewState extends State<MeetingSubview> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
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

    CalendarMeetingController meetingController = CalendarMeetingController();

    final time = TimeOfDayUtils.timeFromString(timeController.text);

    CalendarMeeting meeting = CalendarMeeting(
      name: nameController.text,
      description: descriptionController.text,
      dateTime: dateTime.copyWith(hour: time.hour, minute: time.minute),
      place: placeController.text,
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: meetingController.add(meeting),
      successFunction: () {
        widget.loadDataFunction();
        Navigator.of(context).pop();
      },
    );
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
                hint: intl.inputHintNumberOfCharacters('255'),
                isRequired: true,
                maxLength: 255,
                minLines: 3,
                maxLines: 3,
              ),
              Dimensions.verticalSpacingSmall,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
