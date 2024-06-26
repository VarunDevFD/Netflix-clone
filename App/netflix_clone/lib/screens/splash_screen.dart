import 'package:flutter/material.dart';
import 'package:netflix_clone/untils/app_colors.dart';
import 'package:netflix_clone/untils/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _slideAnimations;
  late List<Animation<double>> _fadeAnimations;
  bool _showLoading = false;

  final String _text = "Netflix";

  @override
  void initState() {
    super.initState();
    _controllers = [];
    _slideAnimations = [];
    _fadeAnimations = [];

    for (int i = 0; i < _text.length; i++) {
      _controllers.add(AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this,
      ));

      _slideAnimations.add(Tween<Offset>(
        begin: const Offset(1, 0),
        end: const Offset(0, 0),
      ).animate(CurvedAnimation(
        parent: _controllers[i],
        curve: Curves.easeOut,
      )));

      _fadeAnimations.add(Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: _controllers[i],
        curve: Curves.easeIn,
      )));
    }

    _startAnimation();
  }

  void _startAnimation() {
    for (int i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 500), () {
        _controllers[i].forward();
      });
    }

    // Show the loading indicator after half the text animation is completed
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        _showLoading = true;
      });
    });

    Future.delayed(const Duration(milliseconds: 4000), () {
      Navigator.pushReplacementNamed(context, AppRoutes.onBoardingScreen);
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(_text.length, (index) {
                return SlideTransition(
                  position: _slideAnimations[index],
                  child: FadeTransition(
                    opacity: _fadeAnimations[index],
                    child: Text(
                      _text[index],
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 115,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 200),
                Visibility(
                  visible: _showLoading,
                  child: const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
