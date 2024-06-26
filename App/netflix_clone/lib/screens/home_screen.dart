import 'package:flutter/material.dart';
import 'package:netflix_clone/untils/app_strings.dart';
import 'package:netflix_clone/untils/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        backgroundColor: AppColors.primary,
      ),
      body: const Center(
        child: Text(AppStrings.appName),
      ),
    );
  }
}
