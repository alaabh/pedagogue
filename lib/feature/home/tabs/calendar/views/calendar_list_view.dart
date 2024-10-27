import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:pedagogue/controller/calendar_meeting_controller.dart';
import 'package:pedagogue/controller/coaching_controller.dart';
import 'package:pedagogue/controller/match_controller.dart';

import '../../../../../l10n/localization.dart';
import '../../../../../model/calendar_meeting.dart';
import '../../../../../model/coaching.dart';
import '../../../../../model/match.dart';
import '../../../../../shared/style/dimensions.dart';
import '../../../../../utils/date_time_utils.dart';
import '../../../../../utils/resources/api/api_view_handler.dart';
import '../event/event_details_view.dart';
import '../event/event_widget.dart';

class CalendarListView extends StatelessWidget {
  final Widget Function(String formattedDate) buildHeader;
  final CoachingController coachingController;
  final MatchController matchController;
  final CalendarMeetingController calendarMeetingController;

  const CalendarListView({
    super.key,
    required this.buildHeader,
    required this.coachingController,
    required this.matchController,
    required this.calendarMeetingController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(DateFormat('MMMM yyyy').format(DateTime.now())),
            Dimensions.verticalSpacingMedium,
            Obx(
              () => ApiViewHandler.modelListBuilder3(
                context,
                apiResponse1: coachingController.apiResponse,
                apiResponse2: matchController.apiResponse,
                apiResponse3: calendarMeetingController.apiResponse,
                builder: (coachingList, matchList, meetingList) => Builder(
                  builder: (context) {
                    List eventList = [];

                    eventList.addAll(coachingList);
                    eventList.addAll(matchList);
                    eventList.addAll(meetingList);

                    eventList.sort(
                      (a, b) {
                        DateTime dateA = a.dateTime ?? DateTime(1950);
                        DateTime dateB = b.dateTime ?? DateTime(1950);

                        return dateB.compareTo(dateA);
                      },
                    );

                    return Column(
                      children: List.generate(
                        eventList.length,
                        (index) {
                          var event = eventList[index];

                          late String title;
                          late Color color;

                          if (event is Coaching) {
                            title =
                                '${intl.doubleDotPlaceholder(intl.coaching)}'
                                '${event.name}';
                            color = Colors.black;
                          } else if (event is Match) {
                            title = '${intl.doubleDotPlaceholder(intl.match)}'
                                '${event.place}';
                            color = Colors.blue;
                          } else if (event is CalendarMeeting) {
                            title = '${intl.doubleDotPlaceholder(intl.meeting)}'
                                '${event.name}';
                            color = Colors.red;
                          }

                          return InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EventDetailsView(
                                  calendarEventData: CalendarEventData(
                                    title: title,
                                    date: event.dateTime,
                                  ),
                                ),
                              ),
                            ),
                            child: Container(
                              padding: Dimensions.paddingMediumVertical,
                              child: EventWidget(
                                dayString: DateTimeUtils.stringFromDate(
                                  event.dateTime,
                                  returnsTime: true,
                                ),
                                title: title,
                                color: color,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
