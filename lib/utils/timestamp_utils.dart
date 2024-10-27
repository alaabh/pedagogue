import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class TimestampUtils {
  static Timestamp timestampFromString(String timeString) {
    DateTime dateTime = DateTime.parse(timeString);
    return Timestamp.fromDate(dateTime);
  }

  static String? stringFromTimestamp(Timestamp? timestamp) {
    DateTime? dateTime = timestamp?.toDate();

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

  static DateTime dateTimeFromTimestamp(Timestamp? timestamp) {
    return timestamp?.toDate() ?? DateTime.now();
  }
}
