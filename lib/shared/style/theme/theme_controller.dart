import 'package:get/get.dart';
import 'package:pedagogue/shared/style/theme/theme_preference.dart';

class ThemeController extends GetxController {
  static var theme = Rx<int>(1);

  static Future<int> getTheme() async {
    return theme.value = await ThemePreference.getTheme();
  }

  static Future<void> setTheme(int value) async {
    theme.value = value;
    await ThemePreference.setTheme(value);
  }
}
