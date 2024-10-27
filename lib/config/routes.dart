import 'package:flutter/material.dart';
import 'package:pedagogue/feature/authentication/login_screen.dart';
import 'package:pedagogue/feature/splash/features_pedagogue/features_peagogue1.dart';
import 'package:pedagogue/feature/splash/on_boarding_view.dart';

import '../feature/authentication/register.dart';
import '../feature/home/tabs/home/home_view.dart';
import '../feature/splash/splash_screen_view.dart';

class Routes {
  static const splashRoute = '/';
  static const onBoardingRoute = '/on-boarding';
  static const registerRoute = '/Register';
  static const loginRoute = '/loginScreen';
  static const homeRoute = '/home';

  static Map<String, WidgetBuilder> values = {
    splashRoute: (context) => const SplashScreenView(),
    onBoardingRoute: (context) => const OnBoardingView(),
    registerRoute: (context) => RegisterScreen(),
    loginRoute: (context) => const LoginScreen(),
    homeRoute: (context) => HomeView(),
  };
}
