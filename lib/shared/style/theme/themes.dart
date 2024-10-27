import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_color.dart';
import '../dimensions.dart';

class Themes {
  static final SystemUiOverlayStyle lightSystemUI = SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: AppColors.secondaryBackgroundColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static final SystemUiOverlayStyle darkSystemUI = SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: AppColors.secondaryBackgroundColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static ThemeData themeData(BuildContext context, bool isLightTheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        brightness: AppColors.brightness,
        primary: AppColors.primaryColor,
      ),
      brightness: AppColors.brightness,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: Dimensions.mediumBorderRadius,
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
        trackVisibility: const MaterialStatePropertyAll(true),
        thumbVisibility: const MaterialStatePropertyAll(true),
        thumbColor: MaterialStatePropertyAll(AppColors.primaryColor),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
      filledButtonTheme: const FilledButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(Dimensions.mediumRoundedShape),
        ),
      ),
      outlinedButtonTheme: const OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(Dimensions.mediumRoundedShape),
        ),
      ),
    );
  }
}
