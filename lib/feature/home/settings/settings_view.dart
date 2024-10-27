import 'package:flutter/material.dart';
import 'package:pedagogue/constants/env.dart';
import 'package:pedagogue/feature/home/settings/profile/profile.dart';
import 'package:pedagogue/feature/home/settings/theme_view.dart';
import 'package:pedagogue/feature/web_view/web_view.dart';
import 'package:pedagogue/shared/style/app_color.dart';

import '../../../l10n/localization.dart';
import '../../../shared/Widget/media/api_image_widget.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/user_session.dart';
import 'change_password_view.dart';
import 'language_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  // --------------------------- BUILD METHODS -----------------------------  //

  @override
  Widget build(BuildContext context) {
    print(UserSession.currentUser.image);
    ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(title: Text(intl.settings)),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: Dimensions.largeValue,
                vertical: Dimensions.smallValue,
              ),
              padding: Dimensions.paddingMedium,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: Dimensions.mediumBorderRadius,
                color: AppColors.primaryColor.withOpacity(0.4),
              ),
              child: Row(
                children: [
                  Dimensions.verticalSpacingSmall,
                  ApiImageWidget(
                    width: 75,
                    height: 75,
                    iconSize: Dimensions.iconSizeLarge,
                    imageFilename: null,
                    baseUrl: baseUrl,
                    isProfilePicture: true,
                    backgroundColor: AppColors.accentColor,
                  ),
                  Dimensions.horizontalSpacingLarge,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (UserSession.currentUser.fullName != null)
                          Text(
                            '${intl.doubleDotPlaceholder(intl.name)}'
                            '${UserSession.currentUser.fullName}',
                          ),
                        if (UserSession.currentUser.email != null)
                          Text(
                            '${intl.doubleDotPlaceholder(intl.email)}'
                            '${UserSession.currentUser.email}',
                          ),
                        if (UserSession.currentUser.address != null)
                          Text(
                            '${intl.doubleDotPlaceholder(intl.address)}'
                            '${UserSession.currentUser.address}',
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Scrollbar(
              controller: scrollController,
              child: SingleChildScrollView(
                controller: scrollController,
                padding: Dimensions.paddingLarge,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildSettingWidget(
                        icon: AppColors.isLightMode
                            ? Icons.dark_mode
                            : Icons.light_mode,
                        color: AppColors.isLightMode
                            ? AppColors.primaryDarkColor
                            : AppColors.primaryLightColor,
                        title: intl.appTheme,
                        subtitle: AppColors.isLightMode
                            ? intl.enableTheDarkTheme
                            : intl.enableTheLightTheme,
                        action: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ThemeView(),
                            ),
                          );
                        },
                      ),
                      Dimensions.verticalSpacingLarge,
                      _buildSettingWidget(
                        icon: Icons.language,
                        color: AppColors.infoColor,
                        title: intl.language,
                        subtitle: intl.changeTheApplicationsLanguage,
                        action: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LanguageView(),
                          ),
                        ),
                      ),
                      Dimensions.verticalSpacingLarge,
                      _buildSettingWidget(
                        icon: Icons.security,
                        color: AppColors.warningColor,
                        title: intl.security,
                        subtitle: intl.changeYourPassword,
                        action: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PasswordChangeView(),
                          ),
                        ),
                      ),
                      Dimensions.verticalSpacingLarge,
                      _buildSettingWidget(
                        icon: Icons.lock,
                        color: AppColors.successColor,
                        title: intl.privacyShortcuts,
                        subtitle: intl.cardVipPrivacyPolicy,
                        action: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => WebView(
                              url: 'https://yourcardvip.com/privacy.html',
                              title: intl.privacyShortcuts,
                            ),
                          ),
                        ),
                      ),
                      Dimensions.verticalSpacingLarge,
                      _buildSettingWidget(
                        icon: Icons.logout,
                        color: AppColors.dangerColor,
                        title: intl.logout,
                        subtitle: intl.youCanLogBackInAnytime,
                        action: () => UserSession.instance
                            .resetUserSession()
                            .then(
                              (value) =>
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                '/',
                                (route) => false,
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingWidget({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required void Function() action,
  }) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: Dimensions.mediumBorderRadius,
      ),
      child: InkWell(
        onTap: action,
        child: ListTile(
          leading: Container(
            padding: Dimensions.paddingMedium,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color.withOpacity(0.3),
            ),
            child: Icon(icon, color: color),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: AppColors.textColor.withOpacity(0.5)),
          ),
          trailing: const Icon(Icons.navigate_next, color: Colors.grey),
        ),
      ),
    );
  }
}
