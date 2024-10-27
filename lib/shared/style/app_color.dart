import 'package:flutter/material.dart';

class AppColors {
  static const _mainColor = Color(0xFFF6B72D);
  static const _mainColorDark = Color(0xFF866422);
  static bool isLightMode = true;
  static Brightness brightness = Brightness.light;
  static Color accentColor = const Color(0xFFCD9F53);
  static Color primaryColor = isLightMode ? _mainColor : _mainColorDark;
  static Color secondaryColor = const Color(0xFfB2823C);
  static Color primaryDarkColor = const Color(0xFF323A46);
  static Color primaryLightColor = const Color(0xFFC7BAAA);

  static Color disabledColor = Colors.grey.shade400;

  static Color textColor = Colors.black;
  static Color textColorInverted = Colors.white;

  static Color successColor = const Color(0xFF2DBD72);
  static Color dangerColor = const Color(0xFFE70707);
  static Color warningColor = const Color(0xFFEFBE24);
  static Color infoColor = const Color(0xFF33CBD5);

  static Color teamAColor = Colors.red.shade900;
  static Color teamBColor = Colors.blue;

  static Color primaryBackgroundColor =
      isLightMode ? const Color(0xFFFFFFFF) : const Color(0xFF000000);

  static Color secondaryBackgroundColor =
      isLightMode ? const Color(0xFFFFF2E6) : const Color(0xFF2F2E2B);
}
