import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/onboarding.dart';
import 'package:netflix_clone/untils/app_colors.dart';
import 'package:netflix_clone/untils/app_routes.dart';
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
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          AppStrings.appName,
          style: TextStyle(
            color: AppColors.red,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                    style: const TextStyle(color: AppColors.white),
                    decoration: const InputDecoration(
                      labelText: 'Email or Phone Number',
                      labelStyle: TextStyle(
                          color: AppColors.darkWhite,
                          fontWeight: FontWeight.normal),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,// incase you want to fixed in this text on textfield choose alway.

                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 65,
                  decoration: BoxDecoration(
                    color:
                        _passwordFocused ? AppColors.lightGray : AppColors.gray,
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
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: AppColors.darkWhite,
                          fontWeight: FontWeight.normal),
                                                    floatingLabelBehavior: FloatingLabelBehavior.auto, // incase you want to fixed in this text on textfield choose alway.

                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.profileSelectionSn);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black,
                    side:
                        const BorderSide(color: AppColors.lightGray2, width: 2),
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
                  style: TextStyle(color: AppColors.lightGray2, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.gray,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Use a Sign-In Code",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: AppColors.darkWhite, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Onboarding()),
                    );
                  },
                  child: const Text(
                    'New to Netflix? Sign up now.',
                    style: TextStyle(color: AppColors.darkWhite, fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Sign in is protected by Google reCAPTCHA to ensure you\'re not a bot. Learn more.',
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
