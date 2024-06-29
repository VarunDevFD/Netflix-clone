import 'package:flutter/material.dart';
import 'package:netflix_clone/untils/app_colors.dart';

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
                color: AppColors.lightGray3,
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