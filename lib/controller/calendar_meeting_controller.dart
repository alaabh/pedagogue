import 'package:pedagogue/model/calendar_meeting.dart';
import 'package:pedagogue/utils/base_controller.dart';
import 'package:pedagogue/utils/service/calendar_meeting_service.dart';




import '../utils/service/base_service.dart';

class CalendarMeetingController extends BaseController<CalendarMeeting> {
  @override
  BaseService<CalendarMeeting>? get service => CalendarMeetingService.instance;
}
