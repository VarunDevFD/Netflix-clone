import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/login_screen.dart';
import 'package:netflix_clone/screens/onboarding.dart';
import 'package:netflix_clone/screens/splash_screen.dart';

class AppRoutes {
  static const String splashSn = '/';
  static const String onBoardingSn = '/onboarding';
  static const String loginSn = '/login';

  static Map<String, WidgetBuilder> routes = {
    splashSn: (content) => const SplashScreen(),
    onBoardingSn: (content) => const Onboarding(),
    loginSn: (content) => const LoginScreen(),
  };
}
