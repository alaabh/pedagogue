import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedagogue/model/staff.dart';

class JsonUtils {
  static T? attribute<T>(dynamic jsonValue) {
    try {
      return jsonValue;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print(e);
        print(stackTrace);
      }

      return null;
    }
  }

  static DateTime? dateFromString<T>(String? jsonValue) {
    try {
      if (jsonValue == null) return null;

      return DateTime.tryParse(jsonValue);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print(e);
        print(stackTrace);
      }

      return null;
    }
  }

  static String? toStringDate<T>(DateTime? dateTime) {
    if (dateTime == null) return null;

    try {
      return DateFormat('yyyy-MM-dd').format(dateTime);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print(e);
        print(stackTrace);
      }

      return null;
    }
  }

  static String? toStringTime<T>(DateTime? dateTime) {
    if (dateTime == null) return null;

    try {
      return DateFormat('HH:mm').format(dateTime);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print(e);
        print(stackTrace);
      }

      return null;
    }
  }

  static TimeOfDay? timeOfDayFromString<T>(String? jsonValue) {
    try {
      if (jsonValue == null) return null;

      int? hour = int.tryParse(jsonValue.split(':')[0]);
      int? min = int.tryParse(jsonValue.split(':')[1]);

      if (hour != null && min != null) {
        return TimeOfDay(hour: hour, minute: min);
      } else {
        return null;
      }
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print(e);
        print(stackTrace);
      }

      return null;
    }
  }

  static String? toStringTimeOfDay<T>(TimeOfDay? timeOfDay) {
    if (timeOfDay == null) return null;

    try {
      return '${timeOfDay.hour}:${timeOfDay.minute}';
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print(e);
        print(stackTrace);
      }

      return null;
    }
  }

  static StaffType? staffType(dynamic jsonValue) {
    try {
      final staffType =
          StaffType.values.firstWhereOrNull((e) => e.value == jsonValue);
      if (staffType == null) {
        if (kDebugMode) print("StaffTypeEnum : $jsonValue is not supported");
      }
      return staffType;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print(e);
        print(stackTrace);
      }

      return null;
    }
  }
}
