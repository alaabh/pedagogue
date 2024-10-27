import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/shared/style/dimensions.dart';

class EventDetailsView extends StatelessWidget {
  final CalendarEventData calendarEventData;

  const EventDetailsView({
    super.key,
    required this.calendarEventData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.eventDetails)),
      body: Card(
        margin: Dimensions.paddingMedium,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Dimensions.verticalSpacingMedium,
            Center(
              child: Text(
                calendarEventData.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Dimensions.verticalSpacingMedium,
            Center(
              child: Text(
                intl.doubleDotPlaceholder(intl.date) +
                    calendarEventData.date.toString(),
              ),
            ),
            Dimensions.verticalSpacingMedium,
          ],
        ),
      ),
    );
  }
}
