import 'package:intl/intl.dart';

class DateTimeUtils {
  static DateTime dateFromString(String? dateString) {
    return DateTime.tryParse(dateString ?? '') ?? DateTime(1950);
  }

  static String stringFromDate(DateTime? dateTime, {bool returnsTime = false}) {
    if (dateTime == null) return '';
    return DateFormat('dd/MM/yyyy${returnsTime ? ' - HH:mm' : ''}')
        .format(dateTime);
  }

  static String timeStringFromDate(DateTime? dateTime) {
    return dateTime == null ? '' : DateFormat('HH:mm').format(dateTime);
  }

  static String? stringFromDateForConversation(DateTime? dateTime) {
    if (dateTime != null) {
      if (dateTime.day == DateTime.now().day) {
        // If the timestamp is from a previous day, return the time
        return DateFormat.Hm().format(dateTime);
      } else {
        // If the timestamp is from another day, return the formatted date
        return DateFormat('dd MMM').format(dateTime);
      }
    } else {
      return null;
    }
  }
}
