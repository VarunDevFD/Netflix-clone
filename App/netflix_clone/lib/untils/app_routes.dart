import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/onboarding.dart';
import 'package:netflix_clone/screens/splash_screen.dart';

class AppRoutes {
  static const String splashSn = '/';
  static const String onBoardingScreen = '/onboarding';

  static Map<String, WidgetBuilder> routes = {
    splashSn: (content) => const SplashScreen(),
    onBoardingScreen: (content) => const Onboarding(),
  };
}
