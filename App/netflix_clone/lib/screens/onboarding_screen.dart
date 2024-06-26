import 'package:flutter/material.dart';
import 'package:netflix_clone/models/onboarding_model.dart';

class OnboardingScreen extends StatelessWidget {
  final OnBoardingModel onboardingModel;
  const OnboardingScreen({Key? key, required this.onboardingModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(onboardingModel.imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
         Positioned(
            bottom: 180,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  onboardingModel.title,
                  style:const TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      height: 1.1,
                      fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Text(
                  onboardingModel.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageViewIndicator extends StatelessWidget {
  const PageViewIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    // Implementation for page view indicators
    return Container();
  }
}
