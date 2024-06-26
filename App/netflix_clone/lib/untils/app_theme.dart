import 'package:flutter/material.dart';
import 'package:netflix_clone/untils/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
  
    primaryColor: AppColors.primary, 
    hintColor: AppColors.hint,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      color:  AppColors.primary,
      
     
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: AppColors.text,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
  );
}
