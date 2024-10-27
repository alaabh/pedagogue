import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pedagogue/controller/calendar_meeting_controller.dart';
import 'package:pedagogue/controller/coaching_controller.dart';
import 'package:pedagogue/controller/match_controller.dart';
import 'package:pedagogue/feature/home/tabs/calendar/views/calendar_day_view.dart';
import 'package:pedagogue/feature/home/tabs/calendar/views/calendar_list_view.dart';
import 'package:pedagogue/feature/home/tabs/calendar/views/calendar_month_view.dart';
import 'package:pedagogue/feature/home/tabs/calendar/views/calendar_week_view.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/shared/Widget/custom_dialog.dart';
import 'package:pedagogue/shared/style/app_color.dart';
import 'package:pedagogue/shared/style/dimensions.dart';
import 'package:pedagogue/utils/date_time_utils.dart';

import '../../../../utils/resources/api/api_response.dart';
import '../../../../utils/switch_case.dart';
import 'event/event_details_view.dart';
import 'event_creation/event_creation_view.dart';

enum CalendarDisplayStyle { month, week, day, list }

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  // API
  CoachingController coachingController = CoachingController();
  MatchController matchController = MatchController();
  CalendarMeetingController calendarMeetingController =
      CalendarMeetingController();

  CalendarDisplayStyle selectedCalendarDisplayStyle =
      CalendarDisplayStyle.month;

  EventController eventController = EventController();

  final GlobalKey<MonthViewState> monthViewState = GlobalKey<MonthViewState>();
  final GlobalKey<WeekViewState> weekViewState = GlobalKey<WeekViewState>();
  final GlobalKey<DayViewState> dayViewState = GlobalKey<DayViewState>();

  void onDateTap(DateTime dateTime, {bool isAllDay = true}) {
    final dateTimeWithoutMinutes = dateTime.copyWith(minute: 0);

    final eventListForDate = eventController.events
        .where(
          (e) =>
              e.date.year == dateTime.year &&
              e.date.month == dateTime.month &&
              e.date.day == dateTime.day &&
              (isAllDay ? true : e.date.hour == dateTime.hour),
        )
        .toList();

    AlertMaker.showWidgetAlertDialog(
      context: context,
      alertType: AlertType.information,
      hasDefaultButtons: false,
      widget: Column(
        children: [
          Dimensions.verticalSpacingMedium,
          Text(
            '${intl.eventsOf} '
            '${DateTimeUtils.stringFromDate(
              dateTimeWithoutMinutes,
              returnsTime: !isAllDay,
            )}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Dimensions.verticalSpacingMedium,
          if (eventListForDate.isEmpty)
            SizedBox(
              height: 100,
              child: Center(child: Text(intl.noData)),
            ),
          for (final event in eventListForDate)
            SizedBox(
              width: double.maxFinite,
              child: FilledButton.tonal(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EventDetailsView(
                      calendarEventData: event,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(event.title),
                    Text(DateTimeUtils.timeStringFromDate(event.startTime)),
                  ],
                ),
              ),
            ),
          Dimensions.verticalSpacingMedium,
          SizedBox(
            width: double.maxFinite,
            child: FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EventCreationView(
                      dateTime: dateTime,
                      loadDataFunction: loadData,
                    ),
                  ),
                );
              },
              child: Text(intl.addNew(intl.event)),
            ),
          ),
        ],
      ),
    );
  }

  void loadData() {
    coachingController.getAll().then(
      (apiResponse) {
        for (final coaching in apiResponse.itemList) {
          if (coaching.dateTime != null) {
            DateTime startDate = coaching.dateTime!;
            DateTime endDate = startDate.copyWith(hour: startDate.hour + 1);

            eventController.add(
              CalendarEventData(
                title: coaching.name ?? intl.unknown,
                date: startDate,
                startTime: startDate,
                endDate: endDate,
                endTime: endDate,
              ),
            );
          }
        }
      },
    );

    matchController.getAll().then(
      (apiResponse) {
        for (final match in apiResponse.itemList) {
          if (match.dateTime != null) {
            DateTime startDate = match.dateTime!.copyWith(hour: 12, minute: 0);
            DateTime endDate = startDate.copyWith(hour: startDate.hour + 1);

            eventController.add(
              CalendarEventData(
                title: match.place ?? intl.unknown,
                date: startDate,
                startTime: startDate,
                endDate: endDate,
                endTime: endDate,
              ),
            );
          }
        }
      },
    );

    calendarMeetingController.getAll().then(
      (apiResponse) {
        for (final calendarMeeting in apiResponse.itemList) {
          if (calendarMeeting.dateTime != null) {
            DateTime startDate = calendarMeeting.dateTime!;
            DateTime endDate = startDate.copyWith(hour: startDate.hour + 1);

            eventController.add(
              CalendarEventData(
                title: calendarMeeting.name ?? intl.unknown,
                date: startDate,
                startTime: startDate,
                endDate: endDate,
                endTime: endDate,
              ),
            );
          }
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(2),
        child: Obx(
          () => coachingController.apiResponse.value.status ==
                      ApiStatus.loading ||
                  matchController.apiResponse.value.status ==
                      ApiStatus.loading ||
                  calendarMeetingController.apiResponse.value.status ==
                      ApiStatus.loading
              ? LinearProgressIndicator(color: AppColors.accentColor)
              : const SizedBox.shrink(),
        ),
      ),
      body: Card(
        color: Colors.grey.shade200,
        surfaceTintColor: Colors.transparent,
        margin: Dimensions.paddingMedium,
        shape: Dimensions.extraLargeRoundedShape,
        clipBehavior: Clip.hardEdge,
        child: switchCase(
          selectedCalendarDisplayStyle,
          {
            CalendarDisplayStyle.month: CalendarMonthView(
              monthViewState: monthViewState,
              eventController: eventController,
              onDateTap: onDateTap,
              buildHeader: buildHeader,
            ),
            CalendarDisplayStyle.week: CalendarWeekView(
              weekViewState: weekViewState,
              eventController: eventController,
              onDateTap: onDateTap,
              buildHeader: buildHeader,
            ),
            CalendarDisplayStyle.day: CalendarDayView(
              dayViewState: dayViewState,
              eventController: eventController,
              onDateTap: onDateTap,
              buildHeader: buildHeader,
            ),
            CalendarDisplayStyle.list: CalendarListView(
              buildHeader: buildHeader,
              coachingController: coachingController,
              matchController: matchController,
              calendarMeetingController: calendarMeetingController,
            ),
          },
          defaultValue: const SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget buildHeader(String formattedDate) {
    return Container(
      color: AppColors.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: monthViewState.currentState?.nextPage,
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
          ),
          Text(
            formattedDate,
            style: const TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 30,
            child: OutlinedButton(
              onPressed: () {
                switch (selectedCalendarDisplayStyle) {
                  case CalendarDisplayStyle.month:
                    selectedCalendarDisplayStyle = CalendarDisplayStyle.week;
                    break;
                  case CalendarDisplayStyle.week:
                    selectedCalendarDisplayStyle = CalendarDisplayStyle.day;
                    break;
                  case CalendarDisplayStyle.day:
                    selectedCalendarDisplayStyle = CalendarDisplayStyle.list;
                    break;
                  case CalendarDisplayStyle.list:
                    selectedCalendarDisplayStyle = CalendarDisplayStyle.month;
                    break;
                }

                setState(() {});
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                foregroundColor: Colors.white,
              ),
              child: Text(
                switchCase(
                  selectedCalendarDisplayStyle,
                  {
                    CalendarDisplayStyle.month: 'Month',
                    CalendarDisplayStyle.week: 'Week',
                    CalendarDisplayStyle.day: 'Day',
                    CalendarDisplayStyle.list: 'List',
                  },
                  defaultValue: '',
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: monthViewState.currentState?.previousPage,
            icon: const Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
