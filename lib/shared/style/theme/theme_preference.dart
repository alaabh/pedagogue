import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const savedThemePrefs = 'SAVED_THEME_PREFS';

  static Future<int> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(savedThemePrefs) ?? 1;
  }

  static Future<void> setTheme(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(savedThemePrefs, value);
  }
}
