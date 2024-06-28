import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home_screen.dart';
import 'package:netflix_clone/screens/login_screen.dart';
import 'package:netflix_clone/screens/onboarding.dart';
import 'package:netflix_clone/screens/profile_selection_screen.dart';
import 'package:netflix_clone/screens/splash_screen.dart';

class AppRoutes {
  static const String splashSn = '/';
  static const String onBoardingSn = '/onboarding';
  static const String loginSn = '/login';
  static const String homeSn = '/home';
  static const String profileSelectionSn = '/profile-selection';

  static Map<String, WidgetBuilder> routes = {
    splashSn: (content) => const SplashScreen(),
    onBoardingSn: (content) => const Onboarding(),
    loginSn: (content) => const LoginScreen(),
    homeSn: (content) => const HomeScreen(
          selectedImage:
              'path_to_image', // Replace with actual image path or variable
          userName: 'username_here', // Replace with actual username or variable
          key: ValueKey(
              'home_screen'), // Replace with an appropriate key if needed
        ),
    profileSelectionSn: (content) => const ProfileSelectionScreen(),
  };
}
