import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'localization.dart';
import 'localization_preference.dart';

class LocalizationController extends GetxController {
  static var locale = Rxn<Locale>(Localization.localeArabic);

  static Future<Locale> getLocale() async {
    return locale.value = Locale(
      await LocalizationPreference.instance.getLocalization() ?? 'ar',
    );
  }

  static Future<void> setLocale(Locale newLocale) async {
    locale.value = newLocale;
    await LocalizationPreference.instance
        .setLocalization(newLocale.languageCode);
  }
}
