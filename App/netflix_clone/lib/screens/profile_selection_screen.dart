import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home_screen.dart';
import 'package:netflix_clone/untils/app_colors.dart';
import 'package:netflix_clone/untils/app_routes.dart';
import 'package:netflix_clone/untils/app_strings.dart';
import 'package:netflix_clone/widgets/add_profile_container.dart';
import 'package:netflix_clone/widgets/profile_container.dart';

class ProfileSelectionScreen extends StatelessWidget {
  const ProfileSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            AppStrings.appName,
            style: TextStyle(
              color: AppColors.red,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Who's Watching?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: [
                    for (int i = 0; i < 4; i++)
                      ProfileContainer(
                        imagePath: 'assets/images/profile_img${i + 1}.jpg',
                        userName: 'User ${i + 1}',
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.homeSn,
                            arguments: HomeScreen(
                              selectedImage:'assets/images/profile_img${i + 1}.jpg',
                              userName: 'User ${i + 1}', 
                            ),
                          );
                        },
                      ),
                    AddProfileContainer(
                      onTap: () {
                        // Handle add profile
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
