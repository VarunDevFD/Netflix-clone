import 'package:flutter/material.dart';
import 'package:netflix_clone/untils/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final String selectedImage;
  final double scrollOffset;
  final String? logoPath;
  final String? title;

  const CustomAppBar({
    Key? key,
    required this.selectedImage,
    required this.scrollOffset,
    this.logoPath,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
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
                      height: 60,
                      width: 80,
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
                        onPressed: () {}, icon: const Icon(Icons.search)),
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
