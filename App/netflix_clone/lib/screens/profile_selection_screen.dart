import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home_screen.dart';
import 'package:netflix_clone/untils/app_colors.dart';
import 'package:netflix_clone/untils/app_strings.dart';

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
            onPressed: () {
              // Handle edit button press
            },
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                selectedImage:
                                    'assets/images/profile_img${i + 1}.jpg',
                                userName: 'User ${i + 1}',
                              ),
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

class ProfileContainer extends StatelessWidget {
  final String imagePath;
  final String userName;
  final VoidCallback onTap;

  const ProfileContainer({
    Key? key,
    required this.imagePath,
    required this.userName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: imagePath,
            child: Container(
              width: 125,
              height: 125,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            userName,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class AddProfileContainer extends StatelessWidget {
  final VoidCallback onTap;

  const AddProfileContainer({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 125,
            height: 125,
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Color.fromARGB(66, 153, 153, 153),
                width: 2,
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                color: AppColors.white,
                size: 50,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Add Profile",
            style: TextStyle(color: AppColors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
