import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home_screen.dart';
import 'package:netflix_clone/screens/login_screen.dart';
import 'package:netflix_clone/screens/movie_detailed_screen.dart';
import 'package:netflix_clone/screens/onboarding.dart';
import 'package:netflix_clone/screens/profile_selection_screen.dart';
import 'package:netflix_clone/screens/search_screen.dart';
import 'package:netflix_clone/screens/splash_screen.dart';

class AppRoutes {
  static const String splashSn = '/';
  static const String onBoardingSn = '/onboarding';
  static const String loginSn = '/login';
  static const String homeSn = '/home';
  static const String profileSelectionSn = '/profile-selection';
  static const String searchSn = '/search';
  static const String detailSn = '/details';

  static Map<String, WidgetBuilder> routes = {
    splashSn: (content) => const SplashScreen(),
    onBoardingSn: (content) => const Onboarding(),
    loginSn: (content) => const LoginScreen(),
    profileSelectionSn: (content) => const ProfileSelectionScreen(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeSn:
        final args = settings.arguments as HomeScreen;
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            selectedImage: args.selectedImage,
            userName: args.userName,
          ),
        );
      case searchSn:
        final args = settings.arguments as SearchScreen;
        return MaterialPageRoute(
          builder: (context) => SearchScreen(
            selectedImage: args.selectedImage,
            userName: args.userName,
          ),
        );
      case detailSn:
        final args = settings.arguments as MovieDetailedSn;
        return MaterialPageRoute(
            builder: (context) => MovieDetailedSn(movieId: args.movieId));
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
