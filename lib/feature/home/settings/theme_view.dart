import 'package:flutter/material.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/style/theme/theme_controller.dart';

class ThemeView extends StatefulWidget {
  const ThemeView({super.key});

  @override
  State<ThemeView> createState() => _ThemeViewState();
}

class _ThemeViewState extends State<ThemeView> {
  int _selectedTheme = ThemeController.theme.value;

  void onChanged(int? value) {
    setState(() => _selectedTheme = value!);
    ThemeController.theme.value = _selectedTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.themeSettings),
      ),
      body: Padding(
        padding: Dimensions.paddingMedium,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Dimensions.verticalSpacingLarge,
            RadioListTile<int>(
              controlAffinity: ListTileControlAffinity.trailing,
              title: Row(
                children: [
                  const Icon(Icons.phone_android),
                  Dimensions.horizontalSpacingSmall,
                  Text(intl.followSystem),
                ],
              ),
              value: 0,
              groupValue: _selectedTheme,
              onChanged: onChanged,
            ),
            RadioListTile<int>(
              controlAffinity: ListTileControlAffinity.trailing,
              title: Row(
                children: [
                  const Icon(Icons.light_mode),
                  Dimensions.horizontalSpacingSmall,
                  Text(intl.lightMode),
                ],
              ),
              value: 1,
              groupValue: _selectedTheme,
              onChanged: onChanged,
            ),
            RadioListTile<int>(
              controlAffinity: ListTileControlAffinity.trailing,
              title: Row(
                children: [
                  const Icon(Icons.dark_mode),
                  Dimensions.horizontalSpacingSmall,
                  Text(intl.darkMode),
                ],
              ),
              value: 2,
              groupValue: _selectedTheme,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
