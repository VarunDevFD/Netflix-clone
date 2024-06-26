import 'package:flutter/material.dart';
import 'package:netflix_clone/untils/app_strings.dart';
import 'package:netflix_clone/untils/app_theme.dart';
import 'package:netflix_clone/untils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashSn,
      routes: AppRoutes.routes,
    );
  }
}
