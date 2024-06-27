import 'package:flutter/material.dart';
import 'package:netflix_clone/data/onboarding_data.dart';
import 'package:netflix_clone/screens/onboarding_screen.dart';
import 'package:netflix_clone/untils/app_colors.dart';
import 'package:netflix_clone/untils/app_routes.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingScreen(onboardingModel: onboardingData[index]);
              },
            ),
            Positioned(
              top: 2,
              right: 425,
              child: Image.asset(
                'assets/logo/logo.png',
                height: 50,
              ),
            ),
            Positioned(
              top: 3,
              right: 1,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('PRIVACY',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('FAQs',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('HELP',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.loginSn);
                    },
                    child: const Text('LOG IN',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 90,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 10,
                    width: _currentIndex == index ? 20 : 10,
                    decoration: BoxDecoration(
                      color: _currentIndex == index ? Colors.red : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              left: 10,
              right: 10,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.loginSn);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.loadingIndicator,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 40),
                      minimumSize: const Size(950, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const PageViewIndicator(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
