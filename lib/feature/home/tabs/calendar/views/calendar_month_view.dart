import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarMonthView extends StatelessWidget {
  final GlobalKey<MonthViewState> monthViewState;
  final EventController eventController;
  final Function(DateTime date) onDateTap;
  final Widget Function(String formattedDate) buildHeader;

  const CalendarMonthView({
    super.key,
    required this.monthViewState,
    required this.eventController,
    required this.onDateTap,
    required this.buildHeader,
  });

  @override
  Widget build(BuildContext context) {
    return MonthView(
      key: monthViewState,
      useAvailableVerticalSpace: true,
      controller: eventController,
      headerBuilder: (dateTime) => buildHeader(
        DateFormat('MMMM yyyy').format(dateTime),
      ),
      onCellTap: (events, date) {
        onDateTap(date);
      },
      onEventTap: (event, date) {
        onDateTap(date);
      },
    );
  }
}
