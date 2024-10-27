import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarDayView extends StatelessWidget {
  final GlobalKey<DayViewState> dayViewState;
  final EventController eventController;
  final void Function(DateTime dateTime, {bool isAllDay}) onDateTap;
  final Widget Function(String formattedDate) buildHeader;

  const CalendarDayView({
    super.key,
    required this.dayViewState,
    required this.eventController,
    required this.onDateTap,
    required this.buildHeader,
  });

  @override
  Widget build(BuildContext context) {
    return DayView(
      key: dayViewState,
      controller: eventController,
      heightPerMinute: 1.5,
      dayTitleBuilder: (dateTime) => buildHeader(
        DateFormat('MMMM yyyy').format(dateTime),
      ),
      onDateTap: (date) => onDateTap(date, isAllDay: false),
      onEventTap: (events, DateTime dateTime) => onDateTap(
        events.firstOrNull?.date ?? dateTime,
        isAllDay: false,
      ),
    );
  }
}
