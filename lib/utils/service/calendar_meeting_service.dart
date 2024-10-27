import '../../constants/env.dart';
import '../../model/calendar_meeting.dart';
import 'base_service.dart';

class CalendarMeetingService extends BaseService<CalendarMeeting> {
  CalendarMeetingService._();

  static final CalendarMeetingService instance = CalendarMeetingService._();

  factory CalendarMeetingService() => instance;

  @override
  String apiUrl = '$baseUrl/meetings';

  @override
  Function? get fromJsonFunction => CalendarMeeting.fromJson;

  @override
  Function(CalendarMeeting calendarMeeting)? get toJsonFunction =>
      (CalendarMeeting calendarMeeting) => calendarMeeting.toJson();
}
