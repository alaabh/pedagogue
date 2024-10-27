import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pedagogue/config/routes.dart';
import 'package:pedagogue/l10n/localization_controller.dart';
import 'package:pedagogue/shared/style/app_color.dart';
import 'package:pedagogue/shared/style/theme/theme_controller.dart';
import 'package:pedagogue/shared/style/theme/themes.dart';
import 'package:pedagogue/shared/widget/loading_widget.dart';

import 'env/env.dart';
import 'l10n/localization.dart';

final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
   OpenAI.apiKey = Env.apiKey;
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  } catch (e, stackTrace) {
    if (kDebugMode) {
      print(e);
      print(stackTrace);
    }
  }

  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    return Container(
      alignment: Alignment.center,
      width: 200,
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline_outlined,
            color: AppColors.dangerColor,
            size: 50,
          ),
          const Text(
            'Something went wrong',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  };
  WidgetsFlutterBinding.ensureInitialized();
  final List<ConnectivityResult> connectivityResult =
      await (Connectivity().checkConnectivity());
  print("ba7$connectivityResult.");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 30)).then(
      (value) => SystemChrome.setSystemUIOverlayStyle(Themes.lightSystemUI),
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    LocalizationController.getLocale();
    ThemeController.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        switch (ThemeController.theme.value) {
          case 1:
            AppColors.brightness = Brightness.light;
            break;
          case 2:
            AppColors.brightness = Brightness.dark;
            break;
          default:
            AppColors.brightness = MediaQuery.of(context).platformBrightness;
            break;
        }

        return GlobalLoaderOverlay(
          overlayColor: AppColors.textColor.withOpacity(0.2),
          useDefaultLoading: false,
          overlayWidgetBuilder: (_) => const LoadingWidget(),
          overlayWholeScreen: true,
          closeOnBackButton: true,
          child: MaterialApp(
            navigatorKey: mainNavigatorKey,
            debugShowCheckedModeBanner: false,
            routes: Routes.values,
            initialRoute: Routes.splashRoute,
            theme: Themes.themeData(context, true),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: Localization.supportedLocales,
            locale: LocalizationController.locale.value,
            builder: (context, child) {
              /* UserService.instance
                  .login(
                email: 'elitesport.tn@gmail.com',
                password: 'BiBos0411+*#',
                // email: 'medjamel97@gmail.com',
                // password: '123456789',
              )
                  .then(
                (apiResponse) {
                  UserSession.instance.saveUserSession(apiResponse.item!);
                },
              ); */

              intl = AppLocalizations.of(context) as AppLocalizations;

              return Directionality(
                textDirection: LocalizationController.locale.value ==
                        Localization.localeArabic
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: child!,
              );
            },
          ),
        );
      },
    );
  }
}
