import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/search_screen.dart';
import 'package:netflix_clone/untils/app_colors.dart';
import 'package:netflix_clone/untils/app_routes.dart';

class CustomAppBar extends StatelessWidget {
  final String selectedImage;
  final String userName;
  final double scrollOffset;
  final String? logoPath;
  final String? title;

  CustomAppBar({
    Key? key,
    required this.selectedImage,
    required this.userName,
    required this.scrollOffset,
    this.logoPath,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 0.0,
        ),
        color: AppColors.black
            .withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              logoPath != null
                  ? Image.asset(
                      logoPath!,
                      height: 70,
                      width: 70,
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        title ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.searchSn,
                          arguments: SearchScreen(
                            selectedImage: selectedImage,
                            userName: userName,
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.search,
                        color: AppColors.grey,
                        size: 26,
                      ),
                    ),
                    Hero(
                      tag: selectedImage,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(selectedImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
