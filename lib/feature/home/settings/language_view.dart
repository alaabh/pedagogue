import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/feature/home/main_page_view.dart';

import '../../../l10n/localization.dart';
import '../../../l10n/localization_controller.dart';
import '../../../shared/style/dimensions.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  void changeLanguage(BuildContext context, Locale locale) {
    LocalizationController.setLocale(locale);
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const MainPageView()),
      (route) => false,
    );
  }

  // --------------------------- BUILD METHODS -----------------------------  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () {
            LocalizationController.locale.value;
            return Text(intl.language);
          },
        ),
      ),
      body: Padding(
        padding: Dimensions.paddingLarge,
        child: Column(
          children: [
            buildLanguageItem(
              context: context,
              languageName: 'العربية',
              countryName: 'المملكة العربية السعودية',
              countryCode: 'SA',
              locale: Localization.localeArabic,
            ),
            Divider(height: 1, color: Colors.grey.shade500.withOpacity(0.5)),
            buildLanguageItem(
              context: context,
              languageName: 'English',
              countryName: 'United States',
              countryCode: 'US',
              locale: Localization.localeEnglish,
            ),
            Divider(height: 1, color: Colors.grey.shade500.withOpacity(0.5)),
            buildLanguageItem(
              context: context,
              languageName: 'Français',
              countryName: 'France',
              countryCode: 'FR',
              locale: Localization.localeFrench,
            ),
            Divider(height: 1, color: Colors.grey.shade500.withOpacity(0.5)),
          ],
        ),
      ),
    );
  }

  Widget buildLanguageItem({
    required BuildContext context,
    required String languageName,
    required String countryName,
    required String countryCode,
    required Locale locale,
  }) {
    return InkWell(
      onTap: () => changeLanguage(context, locale),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Flag.fromString(
              countryCode,
              borderRadius: Dimensions.mediumValue,
              height: 60,
              width: 60 * 4 / 3,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Text(languageName)),
                  const SizedBox(width: 8),
                  Expanded(child: Text('($countryName)')),
                ],
              ),
            ),
            Obx(
              () => LocalizationController.locale.value == locale
                  ? const Icon(Icons.check)
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}
