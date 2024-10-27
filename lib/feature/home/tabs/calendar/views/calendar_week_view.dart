import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarWeekView extends StatelessWidget {
  final GlobalKey<WeekViewState> weekViewState;
  final EventController eventController;
  final void Function(DateTime dateTime, {bool isAllDay}) onDateTap;
  final Widget Function(String formattedDate) buildHeader;

  const CalendarWeekView({
    super.key,
    required this.weekViewState,
    required this.eventController,
    required this.onDateTap,
    required this.buildHeader,
  });

  @override
  Widget build(BuildContext context) {
    return WeekView(
      key: weekViewState,
      controller: eventController,
      weekPageHeaderBuilder: (startDate, endDate) => buildHeader(
        DateFormat('MMMM yyyy').format(startDate),
      ),
      onDateTap: (date) => onDateTap(date, isAllDay: false),
      onEventTap: (events, DateTime dateTime) => onDateTap(
        events.firstOrNull?.date ?? dateTime,
        isAllDay: false,
      ),
    );
  }
}
