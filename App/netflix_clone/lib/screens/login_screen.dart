import 'package:flutter/material.dart';
import 'package:netflix_clone/untils/app_colors.dart';
import 'package:netflix_clone/untils/app_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _emailFocused = false;
  bool _passwordFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            const Center(
              child: Text(
                AppStrings.appName,
                style: TextStyle(
                  color: AppColors.red,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 65),
            Container(
              height: 65,
              decoration: BoxDecoration(
                color: _emailFocused ? AppColors.lightGray : AppColors.gray,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _emailController,
                onTap: () {
                  setState(() {
                    _emailFocused = true;
                    _passwordFocused = false;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Email or Phone Number',
                  hintStyle: TextStyle(
                      color: AppColors.darkWhite,
                      fontWeight: FontWeight.normal),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 65,
              decoration: BoxDecoration(
                color: _passwordFocused ? AppColors.lightGray : AppColors.gray,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _passwordController,
                onTap: () {
                  setState(() {
                    _passwordFocused = true;
                    _emailFocused = false;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                      color: AppColors.darkWhite,
                      fontWeight: FontWeight.normal),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16.0),
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle sign in
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.black,
                side: const BorderSide(color: AppColors.lightGray2, width: 2),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(color: AppColors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'OR',
              style: TextStyle(color: AppColors.lightGray2,fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
